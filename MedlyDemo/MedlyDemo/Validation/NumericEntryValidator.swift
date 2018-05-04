//
//  NumericEntryValidator.swift
//  lindenwood
//
//  Created by Louis Tur on 4/27/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import UIKit

final class NumericEntryValidator: Validator {

  func uniqueName() -> String {
    return "NumericEntryValidator"
  }
  
  func validate(items: [AnyObject?]) -> ValidatorResult {
    var results: [Int] = []
    var messages: [String] = []
    for item in items {
      var result: Int = -1
      var message: String = Strings.ValidationMessages.NumbersOnly
      if let text: String = item as? String {
        let invalidCharacterSet: CharacterSet = CharacterSet.decimalDigits.inverted
        if let _: Range = text.rangeOfCharacter(from: invalidCharacterSet) {
        }
        else {
          result = 1
          message = ""
        }
      }
      results.append(result)
      messages.append(message)
    }
    return (results, messages)
  }

}
