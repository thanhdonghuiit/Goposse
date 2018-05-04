//
//  Button.swift
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

public enum ButtonStyle: Int {
	case text
	case primary
	case borderedWhite
}

public enum ImagePosition: Int {
	case left
	case right
	case top
}

open class Button : Tappable {

	fileprivate let INTERNAL_PADDING: Double = 3.0

	public struct BorderAttributes {
		var width: Double = 1.0
		var color: UIColor = UIColor.black

		public init() {
			self.width = UnitHelpers().singlePixel()
			self.color = UIColor(hex: 0x777777)
		}

		public init(width: Double, color: UIColor) {
			self.width = width
			self.color = color
		}
	}

	internal struct Attributes {

		fileprivate (set) internal var hasImages: Bool = false
		fileprivate (set) internal var hasTitles: Bool = false

		internal var titleColor: [UInt : UIColor] = [:]
		internal var title: [UInt : String] = [:] {
			didSet {
				self.hasTitles = self.title.count > 0
			}
		}
		internal var attributedTitle: [UInt : NSAttributedString] = [:] {
			didSet {
				self.hasTitles = self.attributedTitle.count > 0
			}
		}
		internal var borderAttributes: [UInt : BorderAttributes] = [:]
		internal var image: [UInt : UIImage] = [:] {
			didSet {
				self.hasImages = self.image.count > 0
			}
		}
	}


	// MARK: - Variables
	internal var attributes: Attributes = Attributes()
	open var cornerRadius: Double = 0.0
	open var hasInitialized: Bool = false
	open var imagePosition: ImagePosition = .top
	open var imageSize: CGSize = CGSize.zero
	open var imageSpacing: Double = 3.0

	open var titleAdjustmentInsets: UIEdgeInsets = UIEdgeInsets.zero
	open var imageAdjustmentInsets: UIEdgeInsets = UIEdgeInsets.zero



	// MARK: - Initialization
	convenience public init() {
		self.init(frame: CGRect.zero)
	}

	override public init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}

	fileprivate func commonInit() {
		self.addSubview(self.contentView)
		self.contentView.addSubview(self.titleLabel)
		self.contentView.addSubview(self.imageView)
		self.setTitleColor(color: UIColor.black, forState: UIControlState())
		self.setTitleColor(color: UIColor.gray, forState: .highlighted)
		updateButtonStyle(forState: self.state)
	}


	// MARK: - Layout
	override open func layoutSubviews() {
		self.layer.cornerRadius = CGFloat(self.cornerRadius)
		self.contentView.frame = self.contentRect()
		self.titleLabel.frame = self.titleRect()
		self.imageView.frame = self.imageRect()
		if !hasInitialized {
			updateButtonStyle(forState: self.state)
			hasInitialized = true
		}
	}


	// MARK: - Lazy Initialization
	fileprivate lazy var contentView: UIView = {
		var view: UIView = UIView()
		view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
		view.isUserInteractionEnabled = false
		return view
	}()


	open lazy var titleLabel: UILabel = {
		var label: UILabel = UILabel()
		label.textAlignment = NSTextAlignment.center
		label.isUserInteractionEnabled = false
		label.font = UIFont.systemFont(ofSize: 13.0)
		//label.layer.borderColor = UIColor.redColor().CGColor
		//label.layer.borderWidth = 1.0
		return label
	}()

	open lazy var imageView: UIImageView = {
		var view: UIImageView = UIImageView()
		view.contentMode = UIViewContentMode.scaleAspectFit
		view.clipsToBounds = true
		return view
	}()


	// MARK: - Getters/Setters
	open func setTitle(title: String, forState state: UIControlState) {
		if title.characters.count > 0 {
			self.attributes.title[state.rawValue] = title
		}
		if state == self.state {
			updateButtonStyle(forState: self.state)
		}
	}

	open func title(forState state: UIControlState) -> String? {
		var title: String? = nil
		if let stateValue: String = self.attributes.title[state.rawValue] {
			title = stateValue
		} else if let stateValue: String = self.attributes.title[UIControlState().rawValue] {
			title = stateValue
		}
		return title
	}


	open func setAttributedTitle(title: NSAttributedString, forState state: UIControlState) {
		self.attributes.attributedTitle[state.rawValue] = title
		if state == self.state {
			updateButtonStyle(forState: self.state)
		}
	}

	open func attributedTitle(forState state: UIControlState) -> NSAttributedString? {
		var attributedTitle: NSAttributedString? = nil
		if let stateValue: NSAttributedString = self.attributes.attributedTitle[state.rawValue] {
			attributedTitle = stateValue
		} else if let stateValue: NSAttributedString = self.attributes.attributedTitle[UIControlState().rawValue] {
			attributedTitle = stateValue
		}
		return attributedTitle
	}


	open func setTitleColor(color: UIColor?, forState state: UIControlState) {
		if color != nil {
			self.attributes.titleColor[state.rawValue] = color
		}
		if state == self.state {
			updateButtonStyle(forState: self.state)
		}
	}

	open func titleColor(forState state: UIControlState) -> UIColor? {
		var titleColor: UIColor? = nil
		if let stateValue: UIColor = self.attributes.titleColor[state.rawValue] {
			titleColor = stateValue
		} else if let stateValue: UIColor = self.attributes.titleColor[UIControlState().rawValue] {
			titleColor = stateValue
		}
		return titleColor
	}


	open override func setBackgroundColor(color: UIColor?, forState state: UIControlState) {
		super.setBackgroundColor(color: color, forState: state)
		if state == self.state {
			updateButtonStyle(forState: self.state)
		}
	}

	open func setBorderAttributes(attributes: BorderAttributes, forState state: UIControlState) {
		self.attributes.borderAttributes[state.rawValue] = attributes
		if state == self.state {
			updateButtonStyle(forState: self.state)
		}
	}

	open func borderAttributes(forState state: UIControlState) -> BorderAttributes? {
		var borderAttributes: BorderAttributes? = nil
		if let stateValue: BorderAttributes = self.attributes.borderAttributes[state.rawValue] {
			borderAttributes = stateValue
		} else if let stateValue: BorderAttributes = self.attributes.borderAttributes[UIControlState().rawValue] {
			borderAttributes = stateValue
		}
		return borderAttributes
	}

	open func setImage(image: UIImage?, forState state: UIControlState) {
		if image != nil {
			self.attributes.image[state.rawValue] = image
		}
		if state == self.state {
			updateButtonStyle(forState: self.state)
			self.setNeedsLayout()
		}
	}

	open func image(forState state: UIControlState) -> UIImage? {
		var image: UIImage? = nil
		if let stateValue: UIImage = self.attributes.image[state.rawValue] {
			image = stateValue
		} else if let stateValue: UIImage = self.attributes.image[UIControlState().rawValue] {
			image = stateValue
		}
		return image
	}


	// MARK: - State Configuration
	fileprivate func updateButtonStyle(forState state: UIControlState) {
		self.imageView.image = self.image(forState: state)
		self.titleLabel.textColor = self.titleColor(forState: state)
		if let attTitle: NSAttributedString = self.attributedTitle(forState: state) {
			self.titleLabel.attributedText = attTitle
		} else {
			self.titleLabel.text = self.title(forState: state)
		}
		if let borderAttributes: BorderAttributes = self.borderAttributes(forState: state) {
			self.layer.borderWidth = CGFloat(borderAttributes.width)
			self.layer.borderColor = borderAttributes.color.cgColor
		} else {
			self.layer.borderWidth = 0
			self.layer.borderColor = UIColor.clear.cgColor
		}
	}

	open func resetAllAttributes() {
		self.attributes = Attributes()
	}

	override open var isHighlighted: Bool {
		didSet {
			self.updateButtonStyle(forState: self.state)
		}
	}

	override open var isSelected: Bool {
		didSet {
			self.updateButtonStyle(forState: self.state)
		}
	}

	override open var isEnabled: Bool {
		didSet {
			self.updateButtonStyle(forState: self.state)
		}
	}


	// MARK: - Content Rects
	fileprivate func imageRect() -> CGRect {

		var contentRect: CGRect = self.contentRect()
		contentRect.origin = CGPoint(x: 0.0, y: 0.0)

		var rect: CGRect = CGRect.zero
		let hasImages: Bool = self.attributes.hasImages
		let hasTitles: Bool = self.attributes.hasTitles

		if hasImages {
			if hasTitles == false {
				if imageSize.equalTo(CGSize.zero) {
					rect = contentRect
				} else {
					rect = CGRect()
					rect.size = self.imageSize
					rect.origin = CGPoint(
						x: (contentRect.width - imageSize.width) / 2.0,
						y: (contentRect.height - imageSize.height) / 2.0
					)
				}
			} else {

				var imageSize: CGSize = self.imageSize
				if imageSize.equalTo(CGSize.zero) {
					let dim: CGFloat = min(contentRect.width, contentRect.height)
					imageSize = CGSize(width: dim, height: dim)
				}
				var maxTitleWidth: CGFloat = contentRect.width - (imageSize.width + CGFloat(self.imageSpacing))
				if self.imagePosition == .top {
					maxTitleWidth = contentRect.width
				}
				let titleSize: CGSize = self.titleSize(maxSize: CGSize(width: maxTitleWidth, height: CGFloat(Float.greatestFiniteMagnitude)))

				rect.size = self.imageSize

				rect.origin.x = (contentRect.width - imageSize.width) / 2.0
				if hasTitles == true {
					if self.imagePosition == .top {
						let totalHeight: CGFloat = imageSize.height + titleSize.height + CGFloat(self.imageSpacing)
						if totalHeight > contentRect.height {
							rect.origin.y = 0.0
						} else {
							rect.origin.y = (contentRect.height - totalHeight) / 2.0
						}
					} else {
						rect.origin.x = 0.0
						if self.imagePosition == .right {
							rect.origin.x = contentRect.width - imageSize.width
						}
					}
				} else {
					rect.origin.y = (contentRect.height - imageSize.height) / 2.0
				}
			}
		}
		return rect.ceilRect()
	}

	fileprivate func titleRect() -> CGRect {

		var contentRect: CGRect = self.contentRect()
		contentRect.origin = CGPoint(x: 0.0, y: 0.0)

		let imageRect: CGRect = self.imageRect()

		var maxTitleWidth: CGFloat = contentRect.width - (self.imageSize.width + CGFloat(self.imageSpacing))
		if self.imagePosition == .top {
			maxTitleWidth = contentRect.width
		}
		let titleSize: CGSize = self.titleSize(maxSize: CGSize(width: maxTitleWidth, height: CGFloat(Float.greatestFiniteMagnitude)))

		var rect: CGRect = contentRect
		rect.origin.y = 0.0
		if self.attributes.hasImages {
			if self.imagePosition != .top {
				rect.size.width = contentRect.width - (imageRect.width + CGFloat(self.imageSpacing))
				rect.origin.x = 0.0
				if self.imagePosition == .left {
					rect.origin.x = imageRect.maxX + CGFloat(self.imageSpacing)
				}
			} else {
				rect.size.height = min(titleSize.height, contentRect.height - (imageRect.height + CGFloat(self.imageSpacing)))
				rect.origin.y = imageRect.maxY + CGFloat(self.imageSpacing)
			}
		}
		return UIEdgeInsetsInsetRect(rect.ceilRect(), self.titleAdjustmentInsets)
	}

	fileprivate func contentRect() -> CGRect {
		return UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsWithEqualInsets(inset: INTERNAL_PADDING)).ceilRect()
	}

	fileprivate func titleSize(maxSize: CGSize) -> CGSize {
		var boundingRect: CGRect = CGRect.zero
		if self.attributes.hasTitles {
			var calcString: NSAttributedString?
			if let attributedTitle: NSAttributedString = self.attributedTitle(forState: self.state) {
				calcString = attributedTitle
			} else {
				if let title: String = self.title(forState: self.state) {
					var titleAtts: [String : AnyObject] = [:]
					titleAtts[NSFontAttributeName] = self.titleLabel.font
					calcString = NSAttributedString(string: title, attributes: titleAtts)
				}
			}
			if calcString != nil {
				boundingRect = calcString!.boundingRect(with: maxSize,
				                                        options: [NSStringDrawingOptions.usesFontLeading, NSStringDrawingOptions.usesLineFragmentOrigin],
				                                        context: nil)
			}
		}
		return boundingRect.size
	}


	// MARK: - Sizing
	open override func sizeThatFits(_ size: CGSize) -> CGSize {
		var adjustedSize: CGSize = size
		adjustedSize.width -= 20.0
		var titleSize: CGSize = self.titleLabel.sizeThatFits(adjustedSize)
		titleSize.width += 20.0
		return titleSize
	}


	open override var intrinsicContentSize: CGSize {
		return self.sizeThatFits(CGSize(width: Double.greatestFiniteMagnitude, height: Double.greatestFiniteMagnitude))
	}

	open override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
		return self.sizeThatFits(targetSize)
	}

	open override func systemLayoutSizeFitting(_ targetSize: CGSize,
	                                           withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
	                                           verticalFittingPriority: UILayoutPriority) -> CGSize {
		return self.sizeThatFits(targetSize)
	}

}
