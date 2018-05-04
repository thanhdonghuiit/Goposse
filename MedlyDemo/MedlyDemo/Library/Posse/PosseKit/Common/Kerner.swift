//
//  Kerner.swift
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

public enum KernAmount : Hashable, Equatable {
	
	private var kernAmounts: [KernAmount : Double] {
		get {
			return [
				.contracted : -1.0,
				.mediumContracted : -0.75,
				.slightlyContracted : -0.5,
				.regular : 0.0,
				.slightlyExpanded : 0.5,
				.mediumExpanded : 0.75,
				.expanded : 1.0,
			]
		}
	}
	
	case contracted
	case mediumContracted
	case slightlyContracted
	case regular
	case slightlyExpanded
	case mediumExpanded
	case expanded
	
	
	public func amountValue() -> Double {
		return kernAmountValue(self)
	}
	
	public func kernAmountValue(_ kernAmount: KernAmount) -> Double {
		if let amt = kernAmounts[kernAmount] {
			return amt
		} else {
			return 0.0
		}
	}
}

open class Kerner {
	
	public init() {
	}
	
	open func kernTextValue(_ text: String?, withPreset preset: KernAmount, forLabel label: UILabel) {
		self.kernTextValue(text, withAmount: preset.amountValue(), forLabel: label)
	}
	
	open func kernTextValue(_ text: String?, withAmount amount: Double, forLabel label: UILabel) {
		if let textVal: String = text {
			var atts: [String : Any] = [:]
			atts[NSKernAttributeName] = amount
			let attString: NSMutableAttributedString = NSMutableAttributedString(string: textVal)
			let fullRange: NSRange = NSMakeRange(0, textVal.characters.count)
			attString.addAttributes(atts, range: fullRange)
			label.attributedText = attString
		}
	}
	
	
}
