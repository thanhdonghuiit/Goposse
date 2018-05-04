//
//  Serializable.swift
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

open class Serializable : NSObject {
	
	open func asDictionary() -> Dictionary<String, Any> {
		let klass : AnyClass? = type(of: self)
		var propertyCount : CUnsignedInt = 0
		let props = class_copyPropertyList(klass, &propertyCount)
		var outDict : Dictionary<String, Any> = [:]
		guard let classProperties = props else {
			return outDict
		}
		for i in 0 ..< Int(propertyCount) {
			let property = classProperties[i]
			let propName = NSString(cString: property_getName(property), encoding: String.Encoding.utf8.rawValue)!
			_ = property_getAttributes(property)
			var value = self.value(forKey: propName as String);
			
			if value is Serializable {
				value = (value as! Serializable).asDictionary()
			} else if value is Array<Serializable> {
				var internalArr: Array<Dictionary<String, Any>> = []
				for item in (value as! Array<Serializable>) {
					internalArr.append(item.asDictionary())
				}
				value = internalArr
			} else if value is NSData {
				value = (value as! Data).base64EncodedString(options: [])
			} else if value is Bool {
				value = (value as! Bool)
			}
			outDict[propName as String] = value
		}
		
		classProperties.deallocate(capacity: Int(propertyCount))
		
		return outDict
	}
	
}
