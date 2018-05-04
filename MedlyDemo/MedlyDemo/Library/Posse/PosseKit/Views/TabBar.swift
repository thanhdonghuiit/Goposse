//
//  TabBar.swift
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

// MARK: Enums
public enum TabItemType : Int {
	case tab
	case button
}

public enum TabIndicatorPosition : Int {
	case top
	case bottom
	case belowText
}

public enum TabIndicatorAnimationStyle : Int {
	case slide
	case fade
}

public enum TabSizeMode : Int {
	case matchContents
	case fixed
	case auto
}


// MARK: - Delegates
public protocol TabBarDelegate: class {
	func tabBar(tabBar: TabBar, tappedButtonAtIndex index: Int)
	func tabBar(tabBar: TabBar, selectedItemAtIndex index: Int)
};


// MARK: - TabItem class
open class TabItem: Button {
	open var type: TabItemType = .tab
	open var isStyled: Bool = false
}


// MARK: - TabBar class
open class TabBar: UIView {
	
	// default values
	public struct Defaults {
		static let TextColor: UIColor = UIColor(hex: 0xAAAAAA)
		static let TextSelectedColor: UIColor = UIColor(hex: 0x111111)
		static let TextHighlightColor: UIColor = UIColor(hex: 0xFFFFFF)
		static let IndicatorColor: UIColor = UIColor(hex: 0x555555)
		static let BackgroundColor: UIColor = UIColor.white
		static let BackgroundHighlightedColor: UIColor = UIColor(hex: 0xAAAAAA)
		static let BackgroundSelectedColor: UIColor = UIColor(hex: 0xEEEEEE)
	}
	
	lazy private var tabScrollView: UIScrollView = {
		var view = UIScrollView()
		return view
	}()
	private var tabContentView: UIView = UIView()
	
	public weak var tabBarDelegate: TabBarDelegate?
	
	private var tabButtons: [TabItem] = []
	private var indicatorView: UIView = {
		var view: UIView = UIView()
		return view
	}()
	
	
	// tab colors
	open var tabFont: UIFont = UIFont.systemFont(ofSize: 11.0)
	open var tabColor: UIColor? = Defaults.BackgroundColor
	open var tabHighlightedColor: UIColor? = Defaults.BackgroundHighlightedColor
	open var tabSelectedColor: UIColor? = Defaults.BackgroundSelectedColor
	open var tabTextColor: UIColor? = Defaults.TextColor
	open var tabTextSelectedColor: UIColor? = Defaults.TextSelectedColor
	open var tabTextHighlightedColor: UIColor? = Defaults.TextHighlightColor

	open var scrollContentOffset: CGPoint = CGPoint.zero
	open var scrollContentInset: UIEdgeInsets = UIEdgeInsets.zero
	
	private var contentAdjusted: Bool = false
	
	// tab sizing
	open var tabSizeMode: TabSizeMode = .auto {
		didSet {
			self.setContentAdjusted()
		}
	}
	open var tabWidth: Double = 0.0 {
		didSet {
			self.setContentAdjusted()
		}
	}
	open var tabMaxWidth: Double = 0.0 {
		didSet {
			self.setContentAdjusted()
		}
	}

	
	// tab icon styling
	open var tabIconSize: CGSize = CGSize(width: 20.0, height: 20.0) {
		didSet {
			self.setContentAdjusted()
		}
	}
	open var tabIconInsets: UIEdgeInsets = UIEdgeInsets.zero {
		didSet {
			self.setContentAdjusted()
		}
	}
	
	// tab indicator styling
	open var indicatorColor: UIColor? = Defaults.IndicatorColor {
		didSet {
			self.indicatorView.backgroundColor = self.indicatorColor
		}
	}
	open var indicatorPosition: TabIndicatorPosition = .bottom {
		didSet {
			self.setContentAdjusted()
		}
	}
	open var indicatorSizedToContent: Bool = false {
		didSet {
			self.setContentAdjusted()
		}
	}
	
	open var indicatorSize: CGSize = CGSize(width: 0.0, height: 3.0) {
		didSet {
			self.setContentAdjusted()
		}
	}
	open var indicatorInsets: UIEdgeInsets = UIEdgeInsets.zero
	open var animateIndicatorPosition: Bool = true
	
	// general styling
	open var animationStyle: TabIndicatorAnimationStyle = .slide
	open var shouldFireOnTabReselect: Bool = false
	
	// state
	open var selectedIndex: Int = -1 {
		willSet {
			moveToTabItemAtIndex(index: newValue)
		}
	}
	
	
	// MARK: - Initialization
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	func commonInit() {
		self.tabScrollView.showsHorizontalScrollIndicator = false
		self.tabScrollView.showsVerticalScrollIndicator = false
		self.addSubview(self.tabScrollView)
		self.tabScrollView.addSubview(self.tabContentView)
		self.tabContentView.addSubview(self.indicatorView)
	}
	
	
	// MARK: - Layout
	open override func layoutSubviews() {
		super.layoutSubviews()
		
		self.tabScrollView.frame = CGRect(x: 0.0, y: 0.0,
		                                  width: self.bounds.width, height: self.bounds.height)
		if self.tabContentView.bounds.size.width <= 0.0 {
			self.tabContentView.frame = self.bounds
		}
		if self.contentAdjusted {
			layoutTabButtons()
			var contentSize = CGSize.zero
			if self.tabButtons.count > 0 {
				contentSize = CGSize(width: self.tabButtons.last!.frame.maxX,
				                     height: self.bounds.height)
			}
			var contentBounds = CGRect(x: 0.0, y: 0.0,
			                           width: self.bounds.width, height: self.bounds.height)
			if !contentSize.equalTo(CGSize.zero) {
				contentBounds.size.width = contentSize.width
			}

			self.tabContentView.frame = contentBounds
			self.tabScrollView.contentSize = contentSize

			self.indicatorView.backgroundColor = self.indicatorColor
			self.indicatorView.frame = indicatorRect(tabIndex: self.selectedIndex)
			self.tabContentView.bringSubview(toFront: self.indicatorView)
		}
		
		self.contentAdjusted = false
		self.tabScrollView.contentOffset = self.scrollContentOffset
		self.tabScrollView.contentInset = self.scrollContentInset
	}
	
	private func setContentAdjusted() {
		contentAdjusted = true
		self.setNeedsLayout()
	}
	
	
	private func layoutTabButtons() {
		if self.tabButtons.count == 0 {
			return
		}
		var maxWidth = CGFloat(self.tabMaxWidth)
		if maxWidth <= 0.0 {
			maxWidth = 0.75 * self.bounds.width
		}
		var x: CGFloat = 0.0, y: CGFloat = 0.0,
			width: CGFloat = self.bounds.width / CGFloat(self.tabButtons.count),
			height: CGFloat = self.bounds.height
		if self.tabSizeMode == .fixed && self.tabWidth > 0.0 {
			width = CGFloat(self.tabWidth)
		} else if self.tabSizeMode == .matchContents {
			
		}
		if tabButtons.count > 1 {
			width = min(width, maxWidth)
		}
		var itemRect = CGRect(x: x, y: y, width: width, height: height)
		itemRect.size.width = width
		for tabItem in self.tabButtons {
			itemRect.origin.x = x
			tabItem.frame = itemRect;
			print(tabItem.frame)
			x += width
			updateTabProperties(tabItem)
		}
	}
	
	private func reindexTabs() {
		for (idx, tabItem) in self.tabButtons.enumerated() {
			tabItem.tag = idx
		}
	}
	
	private func indicatorRect(tabIndex: Int) -> CGRect {
		if self.tabButtons.count == 0 {
			return CGRect.zero
		}
		
		// indicator is zero sized, return
		if self.indicatorSize.equalTo(CGSize.zero) {
			return CGRect.zero
		}
		
		let tabItem = self.tabButtons[tabIndex]
		let hasImage: Bool = (tabItem.image(forState: UIControlState()) != nil)
		let hasTitle: Bool = (tabItem.title(forState: UIControlState()) != nil)
		let titleSize: CGSize = tabItem.titleLabel.sizeThatFits(tabItem.bounds.size)
		
		var indicatorFrame = tabItem.frame
		indicatorFrame.size.height = self.indicatorSize.height
		if indicatorSize.width != 0.0 {
			indicatorFrame.size.width = indicatorSize.width
		}
		
		indicatorFrame.origin.y = self.indicatorInsets.top
		if self.indicatorPosition == .bottom {
			indicatorFrame.origin.y = (tabItem.frame.maxY - indicatorSize.height) - self.indicatorInsets.bottom
		} else if indicatorPosition == .belowText {
			let (y, width) = indicatorBeneathContentPosition(tabItem: tabItem,
			                                                 hasImage: hasImage, hasTitle: hasTitle, titleSize: titleSize)
			indicatorFrame.origin.y = y + self.indicatorInsets.top - self.indicatorInsets.bottom
			indicatorFrame.size.width = width
		}
		
		let useWidth = indicatorFrame.size.width - (self.indicatorInsets.left + self.indicatorInsets.right)
		indicatorFrame.origin.x = tabItem.frame.midX - (useWidth / 2.0)
		
		return indicatorFrame
	}
	
	func indicatorBeneathContentPosition(tabItem: TabItem, hasImage: Bool, hasTitle: Bool, titleSize: CGSize) -> (outY: CGFloat, outWidth: CGFloat) {
		var y: CGFloat = 0.0, width: CGFloat = 0.0
		if hasImage && hasTitle {
			// has BOTH image and title
			width = titleSize.width
			var ih: CGFloat = titleSize.height + self.tabIconSize.height
			if tabItem.imagePosition == .top {
				ih += self.indicatorInsets.top
			}
			y = ((tabItem.bounds.size.height - ih) / 2.0) + ih
		} else if hasTitle {
			// has ONLY title
			width = titleSize.width
			y = ((tabItem.bounds.size.height - titleSize.height) / 2.0) + (titleSize.height)
		} else if hasImage {
			// has ONLY image
			width = self.tabIconSize.width
			y = tabItem.imageView.frame.maxY
		}
		return (y, width)
	}
	
	
	
	// MARK: - Tab Management - Adding
	@discardableResult
	public func addTabItem(type: TabItemType, text: String? = nil, image: UIImage? = nil,
	                       selectedImage: UIImage? = nil, index: Int = Int.max) -> TabItem {
		let tabItem: TabItem = TabItem()
		tabItem.type = type
		self.setTabItemValues(tabItem: tabItem, text: text, image: image, selectedImage: selectedImage)
		return addTabItem(tabItem: tabItem)
	}
	
	@discardableResult
	public func addTabItem(tabItem: TabItem, index: Int = Int.max) -> TabItem {
		var tabIndex: Int = index
		if (tabIndex == Int.max) {
			tabIndex = self.tabButtons.count
		}
		if (self.tabButtons.count == 0) {
			tabItem.isSelected = true
			selectedIndex = 0
		}
		
		tabItem.addTarget(self, action: #selector(TabBar.tappedTabButton(sender:)), for: .touchUpInside)
		self.tabButtons.append(tabItem)
		
		self.tabContentView.addSubview(tabItem)
		reindexTabs()
		layoutTabButtons()
		
		return tabItem
	}
	
	
	// MARK: - Tab Management - Updates
	public func updateTabItem(atIndex index: Int, text: String? = nil, image: UIImage? = nil, selectedImage: UIImage? = nil) {
		if (index < self.tabButtons.count) {
			let tabItem: TabItem = self.tabButtons[index]
			setTabItemValues(tabItem: tabItem, text: text, image: image, selectedImage: selectedImage)
		}
	}
	
	public func updateTabItemTypeAtIndex(atIndex index: Int, type: TabItemType) {
		let tabItem: TabItem = self.tabButtons[index]
		tabItem.type = type
	}
	
	
	// MARK: - Tab Management - Removal
	public func removeTabItem(atIndex index: Int) {
		if (index < self.tabButtons.count) {
			let tabItem: TabItem = self.tabButtons[index]
			tabItem.removeFromSuperview()
			self.tabButtons.remove(at: index)
			reindexTabs()
			layoutTabButtons()
		}
	}
	
	private func setTabItemValues(tabItem: TabItem, text: String?, image: UIImage?, selectedImage: UIImage?) {
		tabItem.imageSize = self.tabIconSize
		if let title: String = text {
			tabItem.setTitle(title: title, forState: UIControlState())
		}
		tabItem.setImage(image: image, forState: UIControlState())
		tabItem.setImage(image: selectedImage, forState: .selected)
		tabItem.imageSpacing = 6.0
	}
	
	private func updateTabProperties(_ tabItem: TabItem) {
		if tabItem.isStyled == false {
			tabItem.imageAdjustmentInsets = self.tabIconInsets
			tabItem.titleLabel.font = self.tabFont
			tabItem.setBackgroundColor(color: self.tabColor, forState: UIControlState())
			tabItem.setBackgroundColor(color: self.tabHighlightedColor, forState: .highlighted)
			tabItem.setBackgroundColor(color: self.tabSelectedColor, forState: .selected)
			tabItem.setBackgroundColor(color: self.tabHighlightedColor,
			                           forState: [ .selected, .highlighted ])
			
			tabItem.setTitleColor(color: self.tabTextColor, forState: UIControlState())
			tabItem.setTitleColor(color: self.tabTextHighlightedColor, forState: .highlighted)
			tabItem.setTitleColor(color: self.tabTextSelectedColor, forState: .selected)
			tabItem.setTitleColor(color: self.tabTextHighlightedColor,
			                      forState: [ .selected, .highlighted ])
		}
	}
	
	
	// MARK: - Indicator adjustments
	private func moveToTabItemAtIndex(index: Int) {
		if ((index < 0 || index >= self.tabButtons.count) || index == self.selectedIndex) {
			return
		}
		let tabItem: TabItem = self.tabButtons[index]
		animateToTabItem(tabItem: tabItem, atIndex: index)
		var visibleFrame = tabItem.frame
		let delta = (index < self.selectedIndex ? -1.0 : 1.0)
		visibleFrame.origin.x = max(visibleFrame.origin.x + (CGFloat(delta) * (0.05 * tabItem.bounds.width)), 0.0)
		self.tabScrollView.scrollRectToVisible(visibleFrame, animated: true)
	}
	
	private func animateToTabItem(tabItem: TabItem, atIndex index: Int) {
		if (self.selectedIndex >= 0) {
			let selectedItem: TabItem = self.tabButtons[self.selectedIndex]
			selectedItem.isSelected = false
			selectedItem.setNeedsLayout()
		}
		
		tabItem.isSelected = true
		tabItem.setNeedsLayout()
		
		if (animationStyle == .fade) {
			self.indicatorView.alpha = 0.0
			self.indicatorView.frame = self.indicatorRect(tabIndex: index)
		}
		
		let duration: TimeInterval = (self.animateIndicatorPosition ? 0.08 : 0.0)
		let fadeDuration: TimeInterval = (self.animateIndicatorPosition ? 0.18 : 0.0)
		UIView.animate(withDuration: duration, animations: { () -> Void in
			self.indicatorView.frame = self.indicatorRect(tabIndex: index)
		})
		if (animationStyle == .fade) {
			UIView.animate(withDuration: fadeDuration, animations: { () -> Void in
				self.indicatorView.alpha = 1.0
			})
		}
	}
	
	
	// MARK: - Actions
	func tappedTabButton(sender: AnyObject?) {
		if (sender != nil) {
			let tabItem: TabItem = sender! as! TabItem
			if (tabItem.type == .tab) {   // button is acting as a tab
				if (self.selectedIndex == tabItem.tag && !self.shouldFireOnTabReselect) {
					return
				}
				animateToTabItem(tabItem: tabItem, atIndex: tabItem.tag)
				self.selectedIndex = tabItem.tag
				tabBarDelegate?.tabBar(tabBar: self, selectedItemAtIndex: tabItem.tag)
			} else if (tabItem.type == .button) {
				tabBarDelegate?.tabBar(tabBar: self, tappedButtonAtIndex: tabItem.tag)
			}
		}
	}
	
}


