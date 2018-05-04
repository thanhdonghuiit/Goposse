//
//  RevealAnimator.swift
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

open class RevealAnimator : Animator {
	
	
	// MARK: - Internal
	private let animation: CABasicAnimation
	private let maskLayer: CAShapeLayer
	private var view: UIView? = nil
	
	// MARK: - Properties
	open var center: CGPoint = CGPoint.zero
	
	
	// MARK: - Initialization
	public init() {
		self.animation = CABasicAnimation(keyPath: "path")
		self.maskLayer = CAShapeLayer()
		setupAnimation()
	}
	
	
	// MARK: - Setup
	open func setupAnimation() {
		self.animation.duration = 0.2
		self.animation.delegate = AnimationDelegate {
			if let view: UIView = self.view {
				view.layer.mask = nil
				self.animation.delegate = nil
			}
		}
	}
	
	
	private func insetRectAtPoint(center: CGPoint, radius: CGFloat) -> CGRect {
		assert(radius >= 0, "radius must be a positive number")
		return CGRect(origin: center, size: CGSize.zero).insetBy(dx: -radius, dy: -radius)
	}
	
	
	open func animate(view: UIView) {
		
		self.view = view
		
		let startPath = CGPath(
			ellipseIn: self.insetRectAtPoint(center: view.center, radius: 0.0), transform: nil
		)
		let endPath = CGPath(
			ellipseIn: self.insetRectAtPoint(center: view.center,
			                                 radius: max(view.bounds.width, view.bounds.height) / 1.75), transform: nil
		)
		
		// animation setup
		self.maskLayer.path = endPath
		
		self.animation.fromValue = startPath
		self.animation.toValue = endPath
		self.animation.isRemovedOnCompletion = false
		
		view.layer.mask = self.maskLayer
		self.maskLayer.add(self.animation, forKey: "show")
		self.maskLayer.frame = view.bounds
	}
}
