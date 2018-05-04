//
//  RequiredImageValidator.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/25/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import UIKit

final class RequiredImageValidator: Validator {
  
  func uniqueName() -> String {
    return "RequiredEntryValidator"
  }
  
  func validate(items: [AnyObject?]) -> ValidatorResult {
    var results: [Int] = []
    var messages: [String] = []
    for item in items {
      var result: Int = -1
      var message: String = Strings.ValidationMessages.EnterRequiredImage
      if (item as? UIImage) != nil {
        result = 1
        message = ""
      }
      results.append(result)
      messages.append(message)
    }
    return (results, messages)
  }
}
