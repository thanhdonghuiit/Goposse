//
//  ModalManager.swift
//  PosseKit
//
//  Created by Posse in NYC
//  http://goposse.com
//
//  Copyright (c) 2016 Posse Productions LLC.
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//  * Neither the name of the Posse Productions LLC, Posse nor the
//    names of its contributors may be used to endorse or promote products
//    derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL POSSE PRODUCTIONS LLC (POSSE) BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

import UIKit

// MARK: - Enums
public enum ModalPresentationStyle {
	case fromBottom
	case fromTop
	case custom
}


// MARK: - Type aliases
public typealias ModalCallback = () -> Void
public typealias ModalPresentationOptions = (shouldPresent: Bool, animated: Bool)
public typealias ModalDismissalOptions = (shouldDismiss: Bool, animated: Bool)


public struct ModalConfig {
	public static let NoAlpha: (startAlpha: Double, endAlpha: Double) = (1.0, 1.0)
	public static let DefaultPresentationAnimated: ModalPresentationOptions = (shouldPresent: true, animated: true)
	public static let DefaultDismissalAnimated: ModalDismissalOptions = (shouldDismiss: true, animated: true)
}


// MARK: - Modal manager class
open class ModalManager : NSObject {
	
	private static var keyWindow: UIWindow?
	
	private var notificationCenter: NotificationCenter!
	private var modalStack: [ModalInfo] = []
	
	
	// MARK: - Lazy initialization
	internal lazy var overlayView: UIView = {
		var view: UIView = UIView()
		view.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
		view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
		view.addGestureRecognizer(self.overlayTapRecognizer)
		return view
	}()
	
	internal lazy var overlayTapRecognizer: UITapGestureRecognizer = {
		var recognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ModalManager.tappedOverlay(_:)))
		return recognizer
	}()
	
	
	// MARK: - Initialization
	public override init() {
		notificationCenter = NotificationCenter.default
	}
	
	deinit {
		unregisterNotifications()
	}
	
	
	// MARK: - Global configuration
	open class func setKeyWindow(_ window: UIWindow) {
		self.keyWindow = window
	}
	
	// MARK: - Singleton
	open static let manager: ModalManager = {
		var modalManager: ModalManager = ModalManager()
		return modalManager
	}()
	
	
	// MARK: - Notification registration
	private func registerNotifications() {
		notificationCenter.addObserver(self, selector: #selector(ModalManager.willShowKeyboard(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		notificationCenter.addObserver(self, selector: #selector(ModalManager.willHideKeyboard(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
	}
	
	private func unregisterNotifications() {
		notificationCenter.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		notificationCenter.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
	}
	
	
	// MARK: - Modal check functions
	open func isShowingModal() -> Bool {
		return self.modalStack.count > 0
	}
	
	
	// MARK: - Show/hide animation functions
	private func push(_ modal: ModalInfo, animated: Bool, callback: ModalCallback?) {
		
		if ModalManager.keyWindow == nil {
			Logger.warning("No key window set. Ignoring.")
			return
		}
		
		unregisterNotifications()
		registerNotifications()
		
		let parentViewController: UIViewController = modal.presentingViewController!
		
		let viewController: UIViewController = modal.viewController
		
		parentViewController.viewWillDisappear(animated)
		
		var showOverlay: Bool = false
		var animateOverlay: Bool = true
		var duration: TimeInterval = 0.28
		var alphaStart: Double = 1.0
		var alphaEnd: Double = 1.0
		let overlayAlphaStart: Double = -1.0
		let overlayAlphaEnd: Double = -1.0
		
		if modal.conformsToModal {
			let modal: Modal = (viewController as! Modal)
			duration = modal.animationDurations().startDuration
			alphaStart = modal.transitionAlphas().startAlpha
			alphaEnd = modal.transitionAlphas().endAlpha
			let overlayPresentationOptions: ModalPresentationOptions = modal.showModalOverlay()
			showOverlay = overlayPresentationOptions.shouldPresent
			animateOverlay = overlayPresentationOptions.animated
		}
		
		if showOverlay {
			self.showOverlay(animated: animateOverlay, alphaStart: overlayAlphaStart, alphaEnd: overlayAlphaEnd)
		}
		
		ModalManager.keyWindow?.addSubview(viewController.view)
		viewController.view.frame = self.startingRect(viewController: viewController,
		                                              style: modal.presentedMode)
		
		viewController.view.alpha = CGFloat(alphaStart)
		
		viewController.viewWillAppear(animated)
		
		if !animated {
			duration = 0.0
		}
		
		UIView.animate(withDuration: duration, animations: { () -> Void in
			viewController.setNeedsStatusBarAppearanceUpdate()
			viewController.view.alpha = CGFloat(alphaEnd)
			viewController.view.frame = self.endingRect(viewController: viewController,
			                                            style: modal.presentedMode)
		}) { (completed: Bool) -> Void in
			parentViewController.viewDidDisappear(animated)
			viewController.viewDidAppear(animated)
			if callback != nil {
				callback!()
			}
		}
	}
	
	private func pop(to position: Int, animated: Bool, callback: ModalCallback?) {
		
		let hideModal: ModalInfo? = self.modalStack.last
		if hideModal == nil {
			return    // cant find modal to dismiss so we're out
		}
		
		var superViewController: UIViewController!
		
		if position != self.modalStack.count - 1 {
			for idx: Int in position...self.modalStack.count - 2 {
				let removeModal: ModalInfo = self.modalStack[idx]
				let removeViewController: UIViewController = removeModal.viewController
				if idx == position {
					superViewController = removeModal.presentingViewController
				}
				removeViewController.view.removeFromSuperview()
			}
		}
		
		let viewController: UIViewController = hideModal!.viewController
		
		var duration: TimeInterval = 0.28
		var alphaEnd: Double = 1.0
		if hideModal!.conformsToModal {
			let modal: Modal = (viewController as! Modal)
			duration = modal.animationDurations().endDuration
			alphaEnd = modal.transitionAlphas().startAlpha
		}
		
		if superViewController == nil {
			superViewController = hideModal!.presentingViewController!
		}
		
		viewController.viewWillDisappear(animated)
		
		self.modalStack.removeDownTo(index: position)
		
		var movingToSuperView: Bool = false
		
		if self.modalStack.count == 0 {
			self.unregisterNotifications()
			if self.overlayView.superview != nil {
				self.hideOverlay(animated: animated)
			}
			movingToSuperView = true
		} else {
			let nextModalInfo: ModalInfo = self.modalStack.last!
			movingToSuperView = (nextModalInfo.viewController == hideModal!.presentingViewController)
			if nextModalInfo.conformsToModal {
				let modal: Modal = (nextModalInfo.viewController as! Modal)
				let overlayPresentationOptions: ModalPresentationOptions = modal.showModalOverlay()
				let animateOverlay: Bool = overlayPresentationOptions.animated
				if overlayPresentationOptions.shouldPresent {
					if self.overlayView.superview == nil {
						self.showOverlay(animated: animateOverlay, alphaStart: 0.0, alphaEnd: 1.0)
						nextModalInfo.viewController.view.superview?
							.insertSubview(self.overlayView, belowSubview: nextModalInfo.viewController.view)
					} else {
						self.overlayView.removeFromSuperview()
						nextModalInfo.viewController.view.superview?
							.insertSubview(self.overlayView, belowSubview: nextModalInfo.viewController.view)
					}
				} else {
					self.hideOverlay(animated: animated)
				}
			} else {
				self.hideOverlay(animated: animated)
			}
		}
		
		if movingToSuperView {
			superViewController.viewWillAppear(animated)
			superViewController.setNeedsStatusBarAppearanceUpdate()
		}
		
		if !animated {
			duration = 0.0
		}
		
		UIView.animate(withDuration: duration, animations: { () -> Void in
			viewController.view.alpha = CGFloat(alphaEnd)
			viewController.view.frame = self.startingRect(viewController: viewController, style: hideModal!.presentedMode)
		}) { (completed: Bool) -> Void in
			viewController.view.removeFromSuperview()
			viewController.viewDidDisappear(animated)
			if movingToSuperView {
				superViewController.viewDidAppear(animated)
			}
			if callback != nil {
				callback!()
			}
		}
	}
	
	
	// MARK: - Overlay state management
	private func showOverlay(animated: Bool, alphaStart: Double, alphaEnd: Double) {
		self.overlayView.alpha = CGFloat(max(alphaStart, 0.3))
		if self.overlayView.superview == nil {
			ModalManager.keyWindow?.addSubview(self.overlayView)
		}
		self.overlayView.superview?.bringSubview(toFront: self.overlayView)
		self.overlayView.frame = (ModalManager.keyWindow != nil ? ModalManager.keyWindow!.bounds : CGRect.zero)
		
		var duration: TimeInterval = 0.0
		if animated {
			duration = 0.18
		}
		
		var outAlpha: Double = alphaEnd
		if outAlpha == -1.0 {
			outAlpha = 1.0
		}
		
		UIView.animate(withDuration: duration, animations: { () -> Void in
			self.overlayView.alpha = CGFloat(outAlpha)
		})
	}
	
	private func hideOverlay(animated: Bool) {
		
		var duration: TimeInterval = 0.0
		if animated {
			duration = 0.1
		}
		UIView.animate(withDuration: duration, animations: { () -> Void in
			self.overlayView.alpha = 0.0
		}) { (completed: Bool) -> Void in
			self.overlayView.removeFromSuperview()
		}
	}
	
	
	// MARK: - Present/dismiss methods
	open func present(_ viewController: UIViewController) {
		present(viewController, style: .custom, animated: true, callback: nil)
	}
	
	open func present(_ viewController: UIViewController, animated: Bool, callback: ModalCallback?) {
		present(viewController, style: .custom, animated: animated, callback: callback)
	}
	
	open func present(_ viewController: UIViewController, style: ModalPresentationStyle, animated: Bool,
	                  callback: ModalCallback?) {
		
		if ModalManager.keyWindow == nil {
			Logger.warning("No key window set. Ignoring.")
			return
		}
		
		var parentViewController: UIViewController = ModalManager.keyWindow!.rootViewController!
		if self.modalStack.count > 0 {
			parentViewController = self.modalStack.last!.viewController
		}
		if let navigationController: UINavigationController = parentViewController as? UINavigationController {
			if navigationController.visibleViewController != nil {
				parentViewController = navigationController.visibleViewController!
			}
		}
		present(viewController, onto: parentViewController, style: style, animated: animated, callback: callback)
	}
	
	open func present(_ viewController: UIViewController, onto parentViewController: UIViewController, style: ModalPresentationStyle, animated: Bool,
	                  callback: ModalCallback?) {
		let modal: ModalInfo = ModalInfo(viewController: viewController, presentedMode: style)
		modal.presentingViewController = parentViewController
		modalStack.append(modal)
		push(modal, animated: animated, callback: callback)
	}
	
	open func dismiss() {
		dismiss(animated: true)
	}
	
	open func dismiss(animated: Bool) {
		if modalStack.count > 0 {
			let modalInfo: ModalInfo = modalStack.last!
			dismiss(to: modalInfo.viewController, animated: animated)
		}
	}
	
	open func dismiss(to viewController: UIViewController, animated: Bool) {
		dismiss(to: viewController, animated: animated, callback: nil)
	}
	
	open func dismiss(to viewController: UIViewController, animated: Bool, callback: ModalCallback?) {
		let modalInfo: (modal: ModalInfo, position: Int)? = findModalInfo(viewController: viewController)
		if modalInfo != nil {
			pop(to: modalInfo!.position, animated: animated, callback: callback)
		}
	}
	
	open func dismissAll(animated: Bool) {
		pop(to: 0, animated: animated, callback: nil)
	}
	
	
	// MARK: - Modal info management
	private func findModalInfo(viewController: UIViewController) -> (modal: ModalInfo, position: Int)? {
		for (idx, modal): (Int, ModalInfo) in self.modalStack.enumerated() {
			if modal.viewController == viewController {
				return (modal: modal, position: idx)
			} else if viewController.navigationController != nil {
				if modal.viewController == viewController.navigationController! {
					return (modal: modal, position: idx)
				}
			}
		}
		return nil
	}
	
	
	
	// MARK: - Keyboard notifications
	open func willShowKeyboard(_ sender: AnyObject?) {
		let modal: ModalInfo = modalStack.last!
		if modal.conformsToModal {
			let adjustForFrame: Bool = (modal.viewController as! Modal).adjustsFrameForKeyboard()
			if adjustForFrame {
				// TODO: Adjust for frame
			}
		}
	}
	
	open func willHideKeyboard(_ sender: AnyObject?) {
		let modal: ModalInfo = modalStack.last!
		if modal.conformsToModal {
			let adjustForFrame: Bool = (modal.viewController as! Modal).adjustsFrameForKeyboard()
			if adjustForFrame {
				// TODO: Adjust for frame
			}
		}
	}
	
	
	// MARK: - Sizing
	private func startingRect(viewController: UIViewController, style: ModalPresentationStyle) -> CGRect {
		
		var windowRect: CGRect = CGRect.zero
		if let window = ModalManager.keyWindow {
			windowRect = window.bounds
		}
		
		var rect: CGRect = CGRect.null
		if style == .custom {
			if let modalViewController: Modal = viewController as? Modal {
				rect = modalViewController.startingRect(parentRect: windowRect)
			}
		}
		
		// if not using custom option, or if custom failed to find a Modal compliant ViewController as the passed
		// ViewController then fallback to .FromBottom or use the requested starting position
		if rect.equalTo(CGRect.null) {
			rect = windowRect
			if style == .fromTop {
				rect.origin.y = -rect.height
			} else {
				rect.origin.y = rect.height
			}
		}
		
		return rect
	}
	
	private func endingRect(viewController: UIViewController, style: ModalPresentationStyle) -> CGRect {
		
		var rect: CGRect = CGRect.null
		var windowRect: CGRect = CGRect.zero
		if let window = ModalManager.keyWindow {
			windowRect = window.bounds
		}
		
		if style == .custom {
			if let modalViewController: Modal = viewController as? Modal {
				rect = modalViewController.endingRect(parentRect: windowRect)
			}
		}
		
		// if not using custom option, or if custom failed to find a Modal compliant ViewController as the passed
		// ViewController then fallback to .FromBottom or use the requested starting position
		if rect.equalTo(CGRect.null) {
			rect = windowRect
		}
		
		return rect
	}
	
	
	// MARK: - Actions
	open func tappedOverlay(_ sender: AnyObject!) {
		let modal: ModalInfo = modalStack.last!
		if modal.conformsToModal {
			let modalViewController: Modal = (modal.viewController as! Modal)
			let dismissalOptions: ModalDismissalOptions = modalViewController.overlayTapShouldDismiss()
			if dismissalOptions.shouldDismiss {
				dismiss(animated: dismissalOptions.animated)
			}
		}
	}
	
}

