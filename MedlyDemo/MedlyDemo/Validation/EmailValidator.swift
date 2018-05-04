//
//  EmailValidator.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/22/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

final class EmailValidator: Validator {
  
  func uniqueName() -> String {
    return "EmailValidator"
  }
  
  func validate(items: [AnyObject?]) -> ValidatorResult {
    var results: [Int] = []
    var messages: [String] = []
    for item in items {
      var result: Int = -1
      var message: String = Strings.ValidationMessages.EnterValidEmail
      if let email: String = item as? String {
        let strippedEmail: String = email.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let regexPattern: String = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regexPattern)
        let regexResults: Bool = emailTest.evaluate(with: strippedEmail)
        if regexResults == true {
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
