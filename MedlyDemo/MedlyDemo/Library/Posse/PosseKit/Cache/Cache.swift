//
//  Cache.swift
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

open class Cache<K: Hashable, V> {
	
	private var name: String!
	private var expirationTime: Date?
	private var expiryTTL: TimeInterval?
	
	private let cacheAccessQueue = DispatchQueue(label: "CacheAccessQueue", attributes: DispatchQueue.Attributes.concurrent)
	
	private var cacheKeys: [K]!
	private var cacheStore: [K : V]!
	
	open var extendsExpirationOnAdd: Bool = true
	
	private var memoryWarningObserver : NSObjectProtocol!
	
	
	// MARK: - Initialization
	public convenience init(name: String) {
		self.init(name: name, expiresIn: nil)
	}
	
	public init(name: String, expiresIn: TimeInterval?) {
		commonInit(name: name, expiresIn: expiresIn)
	}
	
	private func commonInit(name: String, expiresIn: TimeInterval?) {
		self.name = name
		self.cacheKeys = [K]()
		self.cacheStore = [K : V]()
		self.expiryTTL = expiresIn
		
		updateExpirationTime(expiryTTL: self.expiryTTL)
		
		// register for memory warnings
		let notifications: NotificationCenter = NotificationCenter.default
		memoryWarningObserver = notifications.addObserver(forName: NSNotification.Name.UIApplicationDidReceiveMemoryWarning,
		                                                  object: nil, queue: Foundation.OperationQueue.main,
		                                                  using: { [unowned self] (notification : Notification!) -> Void in
															self.onMemoryWarning()
			})
	}
	
	deinit {
		let notifications: NotificationCenter = NotificationCenter.default
		notifications.removeObserver(memoryWarningObserver, name: NSNotification.Name.UIApplicationDidReceiveMemoryWarning, object: nil)
	}
	
	
	// MARK: - Cache management functions
	open subscript(key: K) -> V? {
		get {
			return self.cacheStore[key]
		}
		set(newValue) {
			if let insertValue = newValue {
				self.set(key: key, object: insertValue)
			} else {
				self.remove(key: key)
			}
		}
	}
	
	open var count: Int {
		return self.cacheKeys.count
	}
	
	open func allValues() -> [V] {
		var allItems: [V] = [V]()
		for key: K in self.cacheKeys {
			allItems.append(self.cacheStore[key]!)
		}
		return allItems
	}
	
	open func insert(atIndex index: Int, key: K, object: V) {
		self.cacheAccessQueue.async(flags: .barrier, execute: { () -> Void in
			if self.hasExpired() {
				self.removeAll()
			}
			let oldValue = self.cacheStore.updateValue(object, forKey: key)
			if oldValue == nil {
				if index >= 0 {
					self.cacheKeys.insert(key, at: index)
				} else {
					self.cacheKeys.append(key)
				}
			}
			if self.extendsExpirationOnAdd {
				self.updateExpirationTime(expiryTTL: self.expiryTTL)
			}
		})
	}
	
	open func prepend(key: K, object: V) {
		self.insert(atIndex: 0, key: key, object: object)
	}
	
	open func set(key: K, object: V) {
		self.insert(atIndex: -1, key: key, object: object)
	}
	
	open func set(objects: [K : V]) {
		self.cacheAccessQueue.async(flags: .barrier, execute: { () -> Void in
			if self.hasExpired() {
				self.removeAll()
			}
			for (key, object): (K, V) in objects {
				let oldValue = self.cacheStore.updateValue(object, forKey: key)
				if oldValue == nil {
					self.cacheKeys.append(key)
				}
			}
			if self.extendsExpirationOnAdd {
				self.updateExpirationTime(expiryTTL: self.expiryTTL)
			}
		})
	}
	
	open func remove(key: K) {
		self.cacheAccessQueue.async(flags: .barrier, execute: { () -> Void in
			self.cacheStore.removeValue(forKey: key)
			_ = self.cacheKeys.filter {$0 != key}
		})
	}
	
	open func removeAll() {
		self.cacheAccessQueue.async(flags: .barrier, execute: { () -> Void in
			self.cacheStore.removeAll(keepingCapacity: false)
			self.expirationTime = nil
			self.expiryTTL = nil
		})
	}
	
	
	// MARK: - Expiration management
	private func updateExpirationTime(expiryTTL: TimeInterval?) {
		if expiryTTL != nil {
			let baseDate: Date = Date()
			self.expiryTTL = expiryTTL
			self.expirationTime = baseDate.addingTimeInterval(expiryTTL!)
		} else {
			self.expirationTime = nil
		}
	}
	
	open func hasExpired() -> Bool {
		if hasExpiration() {
			let comparison: ComparisonResult = expirationTime!.compare(Date())
			return comparison == ComparisonResult.orderedDescending
		}
		return false
	}
	
	internal func hasExpiration() -> Bool {
		return expirationTime != nil
	}
	
	// MARK: - Memory management
	private func onMemoryWarning() {
		self.cacheStore.removeAll(keepingCapacity: false)
	}
}
