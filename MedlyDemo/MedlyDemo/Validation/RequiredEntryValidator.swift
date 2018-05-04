//
//  RequiredEntryValidator.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/20/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

final class RequiredEntryValidator: Validator {
  
  func uniqueName() -> String {
    return "RequiredEntryValidator"
  }
  
  func validate(items: [AnyObject?]) -> ValidatorResult {
    var results: [Int] = []
    var messages: [String] = []
    for item in items {
      var result: Int = -1
      var message: String = Strings.ValidationMessages.EnterRequiredField
      if let text: String = item as? String {
        if text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).characters.count > 0 {
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
