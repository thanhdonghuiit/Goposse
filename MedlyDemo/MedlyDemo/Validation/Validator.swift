//
//  Validator.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/20/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

typealias ValidatorResult = (results: [Int], messages: [String])

protocol Validator: class {
  func uniqueName() -> String
  func validate(items: [AnyObject?]) -> ValidatorResult
}
