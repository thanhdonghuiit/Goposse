//
//  ValidationHelper.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/14/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

final class ValidationHelper {
  
  // MARK: - Shared helper instance
  static let helper: ValidationHelper = {
    var validationHelper: ValidationHelper = ValidationHelper()
    return validationHelper
  }()
  
  func validateEmailString(_ email: String) -> (Bool, String?) {
    let strippedEmail: String = email.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let regexPattern: String = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regexPattern)
    let regexResults: Bool = emailTest.evaluate(with: strippedEmail)
    if regexResults == true {
      return (true, strippedEmail)
    } else {
      return (false, nil)
    }
  }
  
  func validatePasswordString(_ password: String) -> Bool {
    if password.characters.count > 0 {
      return true
    } else {
      return false
    }
  }
}
