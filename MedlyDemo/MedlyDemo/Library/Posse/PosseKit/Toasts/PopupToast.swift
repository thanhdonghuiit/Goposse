//
//  PopupToast.swift
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

import Foundation
import UIKit

open class PopupToast : BannerToast {
	
	// MARK: - Layout
	open override func layoutSubviews() {
		super.layoutSubviews()
		self.textLabel.isUserInteractionEnabled = false
		self.layer.cornerRadius = 2.0
	}
	
	// MARK: - Toast configuration overrides
	open override func configureToastStyle(configuration: ToastConfiguration) {
		super.configureToastStyle(configuration: configuration)
		self.layer.backgroundColor = configuration.backgroundColor.cgColor
	}
	
	open override class func defaultConfiguration() -> ToastConfiguration {
		var configuration: ToastConfiguration = ToastConfiguration()
		configuration.position = .bottom
		configuration.maxLines = 3
		configuration.animationParams.startAlpha = 0.0
		configuration.animationParams.endAlpha = 1.0
		configuration.mode = .temporary
		configuration.animationParams.showDelay = 0
		configuration.animationParams.hideDelay = 3.0
		configuration.animationParams.duration = 0.5
		configuration.imageSize = CGSize(width: 32.0, height: 30.0)
		configuration.font = UIFont.systemFont(ofSize: 11.0)
		configuration.adjustRectForStatusBar = false
		return configuration
	}
	
	
	// MARK: - Sizing
	override func optimalSize(parentFrame: CGRect) -> CGSize {
		let maxWidth: Double = Double(parentFrame.width) - 40.0;
		return optimalSize(parentFrame: parentFrame, maxWidth: maxWidth, includeButton: false)
	}
	
	open override func preferredHiddenRect(parentFrame: CGRect, position: ToastPosition) -> CGRect {
		let optimalSize: CGSize = self.optimalSize(parentFrame: parentFrame)
		let h: Double = Double(optimalSize.height)
		var y: Double = 0.0
		if position == .bottom {
			y = Double(parentFrame.height) - h
		} else if position == .center {
			y = Double((parentFrame.height - optimalSize.height) / 2.0) + 40.0
		}
		let x: Double = Double(parentFrame.width - optimalSize.width) / 2.0
		return CGRect(x: ceil(x), y: ceil(y), width: ceil(Double(optimalSize.width)), height: ceil(h))
	}
	
	open override func preferredVisibleRect(parentFrame: CGRect, position: ToastPosition) -> CGRect {
		var visibleRect: CGRect = self.preferredHiddenRect(parentFrame: parentFrame, position: position)
		var y: CGFloat = CGFloat(fmax(20.0, Double(0.5 * visibleRect.height)))
		if position == .bottom {
			y = parentFrame.height - visibleRect.height * 1.5
		} else if position == .center {
			y = (parentFrame.height - visibleRect.height) / 2.0
		}
		
		visibleRect.origin.y = ceil(y)
		return visibleRect
	}
	
	
	// MARK: - Touch handling
	open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		let toastConfiguration: ToastConfiguration = self.toastManager.validConfiguration(forToast: self)
		if toastConfiguration.mode != .sticky {
			self.toastManager.dismiss(self)
		}
	}
	
}
