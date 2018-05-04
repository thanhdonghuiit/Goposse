//
//  PasswordValidator.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/22/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

final class PasswordValidator: Validator {
  
  func uniqueName() -> String {
    return "PasswordValidator"
  }
  
  func validate(items: [AnyObject?]) -> ValidatorResult {
    var results: [Int] = []
    var messages: [String] = []
    for item in items {
      var result: Int = -1
      var message: String = Strings.ValidationMessages.EnterValidPassword
      if let password: String = item as? String {
        if password.characters.count > 0 {
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
