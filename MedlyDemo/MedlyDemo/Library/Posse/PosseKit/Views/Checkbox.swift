//
//  Checkbox.swift
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

public enum CheckboxStyle : Int {
	case filled
	case check
}


open class Checkbox : UIControl {
	
	private var shapeLayer: CAShapeLayer = CAShapeLayer()
	
	open static let RadiusCircle: Double = -1.0
	
	internal class Attributes {
		internal var checkColor: [UInt : UIColor] = [:]
		internal var backgroundColor: [UInt : UIColor] = [:]
		internal var borderColor: [UInt : UIColor] = [:]
		internal var cornerRadius: [UInt : Double] = [:]
	}
	
	private var attributes: Attributes = Attributes()
	
	open override var isSelected: Bool {
		didSet {
			self.updateCheckboxStyle(forState: self.state, checked: self.isSelected, animated: true)
		}
	}
	
	open var checkboxStyle: CheckboxStyle = .check {
		didSet {
			self.updateCheckboxStyle(forState: self.state)
		}
	}
	
	open override var isHighlighted: Bool {
		didSet {
			self.updateCheckboxStyle(forState: self.state)
		}
	}
	
	open override var isEnabled: Bool {
		didSet {
			self.updateCheckboxStyle(forState: self.state)
		}
	}
	
	
	// MARK: - Initialization
	public override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.clear
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Layout
	open override func layoutSubviews() {
		super.layoutSubviews()
		self.updateCheckboxStyle(forState: self.state)
		self.shapeLayer.frame = self.bounds
	}
	
	
	private func updateCheckboxStyle(forState state: UIControlState) {
		self.updateCheckboxStyle(forState: state, checked: self.isSelected, animated: true)
	}
	
	private func updateCheckboxStyle(forState state: UIControlState, checked: Bool, animated: Bool) {
		
		var radius: CGFloat = 0.0
		if let stateRadius: Double = self.cornerRadius(forState: state) {
			if stateRadius == Checkbox.RadiusCircle {
				radius = CGFloat(min(self.bounds.width, self.bounds.height) / 2.0)
			} else {
				radius = CGFloat(stateRadius)
			}
		}
		
		let rect: CGRect = self.bounds
		
		if checked {
			if self.shapeLayer.superlayer != nil {
				self.shapeLayer.removeFromSuperlayer()
			}
			if self.checkboxStyle == .check {
				self.shapeLayer = self.checkMarkLayer(rect: rect)
				self.layer.addSublayer(self.shapeLayer)
			} else if self.checkboxStyle == .filled {
				let xinset: CGFloat = 0.2 * rect.width
				let yinset: CGFloat = 0.2 * rect.height
				let adjustedRect: CGRect =  rect.insetBy(dx: xinset, dy: yinset)
				self.shapeLayer = self.filledMarkLayer(rect: adjustedRect, radius: radius)
				self.shapeLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
				self.layer.addSublayer(self.shapeLayer)
			}
		} else if !checked {
			if self.shapeLayer.superlayer != nil {
				self.shapeLayer.removeFromSuperlayer()
			}
			self.shapeLayer = CAShapeLayer()
			self.layer.addSublayer(self.shapeLayer)
			self.shapeLayer.frame = self.bounds
		}
		
		if let backgroundColor: UIColor = self.backgroundColor(forState: self.state) {
			self.shapeLayer.backgroundColor = backgroundColor.cgColor
		} else {
			self.shapeLayer.backgroundColor = UIColor.clear.cgColor
		}
		
		var borderColor: UIColor = UIColor.darkGray
		if let stateColor: UIColor = self.borderColor(forState: self.state) {
			borderColor = stateColor
		}
		
		var checkColor: UIColor = UIColor.black
		if let stateColor: UIColor = self.checkColor(forState: self.state) {
			checkColor = stateColor
		}
		if self.checkboxStyle == .filled {
			self.shapeLayer.fillColor = checkColor.cgColor
		} else {
			self.shapeLayer.strokeColor = checkColor.cgColor
		}
		
		self.layer.borderWidth = 2.0
		self.layer.borderColor = borderColor.cgColor
		self.layer.cornerRadius = radius
		self.shapeLayer.cornerRadius = radius
		
		if animated {
			let scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
			scaleAnimation.fromValue = 0.0
			scaleAnimation.toValue = 1.0
			scaleAnimation.duration = 0.08
			
			let rotateAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
			rotateAnimation.fromValue = Double.pi / 4.0
			rotateAnimation.toValue = 0.0
			rotateAnimation.duration = 0.1
			
			let animationGroup: CAAnimationGroup = CAAnimationGroup()
			if self.checkboxStyle == .check {
				animationGroup.animations = [ scaleAnimation, rotateAnimation ]
			} else {
				animationGroup.animations = [ scaleAnimation ]
			}
			animationGroup.duration = 0.1
			self.shapeLayer.add(animationGroup, forKey: "showAnimation")
		}
		
	}
	
	
	// MARK: - Styling
	open func setBackgroundColor(color: UIColor?, forState state: UIControlState) {
		if color != nil {
			self.attributes.backgroundColor[state.rawValue] = color
		}
		if state == self.state {
			updateCheckboxStyle(forState: self.state)
		}
	}
	
	open func backgroundColor(forState state: UIControlState) -> UIColor? {
		var backgroundColor: UIColor? = nil
		if let stateValue: UIColor = self.attributes.backgroundColor[state.rawValue] {
			backgroundColor = stateValue
		} else if let stateValue: UIColor = self.attributes.backgroundColor[UIControlState().rawValue] {
			backgroundColor = stateValue
		}
		return backgroundColor
	}
	
	open func setCheckColor(color: UIColor?, forState state: UIControlState) {
		if color != nil {
			self.attributes.checkColor[state.rawValue] = color
		}
		if state == self.state {
			updateCheckboxStyle(forState: self.state)
		}
	}
	
	open func checkColor(forState state: UIControlState) -> UIColor? {
		var checkColor: UIColor? = nil
		if let stateValue: UIColor = self.attributes.checkColor[state.rawValue] {
			checkColor = stateValue
		} else if let stateValue: UIColor = self.attributes.checkColor[UIControlState().rawValue] {
			checkColor = stateValue
		}
		return checkColor
	}
	
	open func setBorderColor(color: UIColor?, forState state: UIControlState) {
		if color != nil {
			self.attributes.borderColor[state.rawValue] = color
		}
		if state == self.state {
			updateCheckboxStyle(forState: self.state)
		}
	}
	
	open func borderColor(forState state: UIControlState) -> UIColor? {
		var borderColor: UIColor? = nil
		if let stateValue: UIColor = self.attributes.borderColor[state.rawValue] {
			borderColor = stateValue
		} else if let stateValue: UIColor = self.attributes.borderColor[UIControlState().rawValue] {
			borderColor = stateValue
		}
		return borderColor
	}
	
	open func setCornerRadius(radius: Double?, forState state: UIControlState) {
		if radius != nil {
			self.attributes.cornerRadius[state.rawValue] = radius
		}
		if state == self.state {
			updateCheckboxStyle(forState: self.state)
		}
	}
	
	open func cornerRadius(forState state: UIControlState) -> Double? {
		var val: Double? = 0.0
		if let stateValue: Double = self.attributes.cornerRadius[state.rawValue] {
			val = stateValue
		} else if let stateValue: Double = self.attributes.cornerRadius[UIControlState().rawValue] {
			val = stateValue
		}
		return val
	}
	
	
	// MARK: - Drawing
	private func checkMarkLayer(rect: CGRect) -> CAShapeLayer {
		
		let strokeWidth: CGFloat = UnitHelpers().singlePixelCG() * (0.22 * min(rect.width, rect.height))
		
		let shapeLayer: CAShapeLayer = CAShapeLayer()
		let shapeFrame: CGRect = rect
		shapeLayer.frame = shapeFrame
		
		
		let bezierPath: UIBezierPath = UIBezierPath()
		let delta: CGFloat = strokeWidth / 2.0
		let w: CGFloat = shapeFrame.width - ((2 * strokeWidth) / 2.0)
		let h: CGFloat = shapeFrame.height - ((2 * strokeWidth) / 2.0)
		
		
		bezierPath.move(to: CGPoint(x: (0.25 * w) + delta, y: 0.52 * h))
		bezierPath.addLine(to: CGPoint(x: 0.5 * w, y: 0.72 * h))
		bezierPath.addLine(to: CGPoint(x: (0.75 * w) + delta, y: 0.43 * h))
		
		shapeLayer.lineWidth = strokeWidth
		shapeLayer.fillColor = UIColor.clear.cgColor
		shapeLayer.path = bezierPath.cgPath
		
		return shapeLayer
	}
	
	private func filledMarkLayer(rect: CGRect, radius: CGFloat) -> CAShapeLayer {
		let shapeLayer: CAShapeLayer = CAShapeLayer()
		let shapeFrame: CGRect = rect
		shapeLayer.frame = shapeFrame
		
		let bezierPath: UIBezierPath = UIBezierPath(roundedRect: shapeLayer.bounds, cornerRadius: radius)
		
		var checkColor: UIColor = UIColor.black
		if let stateColor: UIColor = self.checkColor(forState: self.state) {
			checkColor = stateColor
		}
		shapeLayer.fillColor = checkColor.cgColor
		shapeLayer.path = bezierPath.cgPath
		
		return shapeLayer
	}
	
}
