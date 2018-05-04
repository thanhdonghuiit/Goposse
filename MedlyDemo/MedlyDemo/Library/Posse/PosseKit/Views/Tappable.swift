//
//  Tappable.swift
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

open class Tappable : UIControl {
	
	// MARK: - Public vars
	open var hitAreaInsets: UIEdgeInsets = UIEdgeInsetsWithEqualInsets(inset: -15.0)
	
	// MARK: - Private vars
	private var stateBackgroundColors: [UInt : UIColor] = [:]
	
	
	// MARK: - Initialization
	override public init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit() {
	}
	
	
	// MARK: - Getters / Setters
	open func setBackgroundColor(color: UIColor?, forState state: UIControlState) {
		if color != nil {
			self.stateBackgroundColors[state.rawValue] = color
		}
		if state == self.state {
			updateTappableStyle(forState: self.state)
		}
	}
	
	open func backgroundColor(forState state: UIControlState) -> UIColor? {
		var backgroundColor: UIColor? = nil
		if let stateValue: UIColor = self.stateBackgroundColors[state.rawValue] {
			backgroundColor = stateValue
		} else if let stateValue: UIColor = self.stateBackgroundColors[UIControlState().rawValue] {
			backgroundColor = stateValue
		}
		return backgroundColor
	}
	
	
	// MARK: - State management
	internal func updateTappableStyle(forState: UIControlState) {
		self.backgroundColor = self.backgroundColor(forState: forState)
	}
	
	override open var isHighlighted: Bool {
		didSet {
			self.updateTappableStyle(forState: self.state)
		}
	}
	
	override open var isSelected: Bool {
		didSet {
			self.updateTappableStyle(forState: self.state)
		}
	}
	
	override open var isEnabled: Bool {
		didSet {
			self.updateTappableStyle(forState: self.state)
		}
	}
	
	
	// MARK: - Hit areas
	open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
		if self.isUserInteractionEnabled == false {
			return nil
		}
		if UIEdgeInsetsEqualToEdgeInsets(self.hitAreaInsets, UIEdgeInsets.zero) {
			return super.hitTest(point, with: event)
		}
		let hitRect: CGRect = UIEdgeInsetsInsetRect(self.bounds, self.hitAreaInsets)
		if hitRect.contains(point) {
			return self
		} else {
			return nil
		}
	}
	
}
