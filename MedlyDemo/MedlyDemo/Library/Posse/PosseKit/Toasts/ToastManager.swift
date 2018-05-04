//
//  ToastManager.swift
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
public enum ToastMode: Int {
	case temporary
	case sticky
	case userDismissable
}

public enum ToastPosition: Int {
	case top
	case bottom
	case center
}


// MARK: - Toast Configuration
public struct ToastConfiguration {
	public var animationParams: AnimationParams = AnimationParams()
	public var backgroundColor: UIColor = UIColor(white: 0.25, alpha: 0.93)
	public var foregroundColor: UIColor = UIColor(white: 1.0, alpha: 0.95)
	public var font: UIFont = UIFont.systemFont(ofSize: 13.0)
	public var imageSize: CGSize = CGSize(width: 24.0, height: 24.0)
	public var textAlignment: NSTextAlignment = .center
	public var maxLines: Int = 2
	public var mode: ToastMode = .temporary
	public var position: ToastPosition = .top
	public var adjustRectForStatusBar: Bool = true        // NOTE: each implementation must do this specifically
}

public struct AnimationParams {
	public var duration: TimeInterval = 0.3
	public var startAlpha: Double = 1.0
	public var endAlpha: Double = 1.0
	public var showDelay: TimeInterval = 0.0
	public var hideDelay: TimeInterval = 2.0
	public var usingSpringWithDamping: CGFloat = 1.0
	public var initialSpringVelocity: CGFloat = 1.0
	public var animationOptions: UIViewAnimationOptions = .curveLinear
}


// MARK: - Toast Manager
open class ToastManager {
	
	private(set) private var toastQueue: [Toast] = []
	
	private(set) private var configurations: [String : ToastConfiguration] = [:]
	
	private var attachedWindow: UIWindow?
	private var attachedViewController: UIViewController?
	private var toastWindow: UIWindow = UIWindow()
	
	private var parentFrameRect: CGRect = CGRect.zero
	
	open var muteToasts: Bool = false
	
	private var visibleToast: Toast?
	
	
	// MARK: - Initialization
	public init() {
		let configuration: ToastConfiguration = ToastConfiguration()
		self.configurations["default"] = configuration
	}
	
	public init(defaultConfiguration configuration: ToastConfiguration) {
		self.configurations["default"] = configuration
	}
	
	
	// MARK: - Toast attachment methods
	open func attachTo(window: UIWindow) {
		self.attachedWindow = window
		self.attachedViewController = nil
	}
	
	open func attachTo(viewController: UIViewController) {
		self.attachedWindow = nil
		self.attachedViewController = viewController
	}
	
	
	// MARK: Toast creation
	open func newToastBuilder(toastClass: Toast.Type) -> Toast.Builder {
		return Toast.Builder(toastClass: toastClass, toastManager: self)
	}
	
	// MARK: Toast configuration management
	open func addConfiguration(key: String, configuration: ToastConfiguration) {
		self.configurations[key] = configuration
	}
	
	open func updateDefaultConfiguration(configuration: ToastConfiguration) {
		self.configurations["default"] = configuration
	}
	
	open func defaultConfiguration() -> ToastConfiguration {
		return self.configurations["default"]!
	}
	
	open func validConfiguration(forToast toast: Toast) -> ToastConfiguration {
		var toastConfiguration: ToastConfiguration? = toast.configuration
		if toast.configurationKey != nil {
			toastConfiguration = self.configurations[toast.configurationKey!]
		}
		if toastConfiguration == nil {
			toastConfiguration = type(of: toast).defaultConfiguration()
		}
		if toastConfiguration == nil {
			toastConfiguration = self.defaultConfiguration()
		}
		
		if toast.toastMode != nil {
			toastConfiguration!.mode = toast.toastMode!
		}
		
		return toastConfiguration!
	}
	
	
	// MARK: - Sizing
	private func parentFrame() -> CGRect {
		if let window = self.attachedWindow {
			return window.frame
		} else if let viewController = self.attachedViewController {
			return viewController.view.frame
		} else {
			return UIScreen.main.bounds
		}
	}
	
	open func calculatedToastRects(_ toast: Toast) -> (hiddenRect: CGRect, visibleRect: CGRect) {
		let parentFrame: CGRect = self.parentFrame()
		let toastConfiguration: ToastConfiguration = self.validConfiguration(forToast: toast)
		let hiddenRect: CGRect = toast.preferredHiddenRect(parentFrame: parentFrame, position: toastConfiguration.position)
		let visibleRect: CGRect = toast.preferredVisibleRect(parentFrame: parentFrame, position: toastConfiguration.position)
		return (hiddenRect, visibleRect)
	}
	
	
	// MARK: - Toast visibility
	open func show(_ toast: Toast) {
		self.show(toast, animated: true)
	}
	
	open func show(_ toast: Toast, animated: Bool) {
		
		if self.visibleToast != nil {
			self.toastQueue.append(toast)
			return
		}
		
		let toastConfiguration: ToastConfiguration = self.validConfiguration(forToast: toast)
		toast.configureToastStyle(configuration: toastConfiguration)
		
		let toastRects: (hiddenRect: CGRect, visibleRect: CGRect) = self.calculatedToastRects(toast)
		toast.frame = toastRects.hiddenRect   // setup the initial frame
		
		if self.attachedViewController != nil {
			self.attachedViewController!.view.addSubview(toast)
		} else if attachedWindow != nil {
			self.attachedWindow!.addSubview(toast)
		} else {
			return
		}
		
		if toastConfiguration.mode == .temporary {
			self.visibleToast = toast
		}
		
		if toast.needsToAddConstraints {
			toast.configureConstraints()
			toast.needsToAddConstraints = false
		}
		
		toast.preparingToShow()
		
		if animated {
			
			let animationParams: AnimationParams = toastConfiguration.animationParams
			toast.alpha = CGFloat(animationParams.startAlpha)
			
			UIView.animate(withDuration: animationParams.duration,
			               delay: animationParams.showDelay,
			               usingSpringWithDamping: animationParams.usingSpringWithDamping,
			               initialSpringVelocity: animationParams.initialSpringVelocity,
			               options: animationParams.animationOptions,
			               
			               animations: { () -> Void in
							toast.frame = toastRects.visibleRect
							toast.alpha = CGFloat(animationParams.endAlpha)
				}, completion: { (success) -> Void in
					if toastConfiguration.mode == .temporary {
						delay(interval: animationParams.hideDelay, closure: { () -> Void in
							self.dismiss(toast, animated: animated, processQueue: true)
						})
					} else {
						self.processToastQueue()
					}
			})
		} else {
			toast.frame = toastRects.visibleRect
		}
	}
	
	open func dismiss(_ toast: Toast) {
		dismiss(toast, animated: true)
	}
	
	open func dismiss(_ toast: Toast, animated: Bool) {
		dismiss(toast, animated: animated, processQueue: false)
	}
	
	private func dismiss(_ toast: Toast, animated: Bool, processQueue: Bool) {
		if toast.superview == nil {
			return
		}
		
		let toastRects: (hiddenRect: CGRect, visibleRect: CGRect) = self.calculatedToastRects(toast)
		let toastConfiguration: ToastConfiguration = self.validConfiguration(forToast: toast)
		
		let animationParams: AnimationParams = toastConfiguration.animationParams
		
		var duration: TimeInterval = animationParams.duration
		if animated == false {
			duration = 0.0
		}
		
		toast.preparingToHide()
		
		UIView.animate(withDuration: duration,
		               delay: 0.0,
		               usingSpringWithDamping: animationParams.usingSpringWithDamping,
		               initialSpringVelocity: animationParams.initialSpringVelocity,
		               options: animationParams.animationOptions,
		               
		               animations: { () -> Void in
						toast.alpha = CGFloat(animationParams.startAlpha)
						toast.frame = toastRects.hiddenRect
			}, completion: { (success) -> Void in
				toast.removeFromSuperview()
				if processQueue {
					self.visibleToast = nil
					self.processToastQueue()
				}
		})
	}
	
	
	// MARK: - Toast queue management
	private func processToastQueue() {
		if self.toastQueue.count > 0 {
			self.show(self.toastQueue.first!)
			self.toastQueue.remove(at: 0)
		}
	}
	
	// MARK: - Resets
	open func clearQueue() {
		toastQueue.removeAll(keepingCapacity: false)
	}
}
