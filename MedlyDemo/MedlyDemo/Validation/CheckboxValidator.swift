//
//  CheckboxValidator.swift
//  lindenwood
//
//  Created by Kevin Gray on 3/15/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

final class CheckboxValidator: Validator {
  
  func uniqueName() -> String {
    return "CheckboxValidator"
  }
  
  func validate(items: [AnyObject?]) -> ValidatorResult {
    var results: [Int] = []
    var messages: [String] = []
    for item in items {
      var result: Int = -1
      var message: String = Strings.ValidationMessages.EnterRequiredImage
      if let checked: Bool = item as? Bool {
        if checked == true {
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
