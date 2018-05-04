//
//  ZipCodeValidator.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/24/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

final class ZipCodeValidator: Validator {
  
  func uniqueName() -> String {
    return "ZipCodeValidator"
  }
  
  func validate(items: [AnyObject?]) -> ValidatorResult {
    var results: [Int] = []
    var messages: [String] = []
    for item in items {
      var result: Int = -1
      var message: String = Strings.ValidationMessages.EnterValidZipCode
      if let zipCode: String = item as? String {
        let strippedZipCode: String = zipCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let regexPattern: String = "^\\d{5}?$"
        let zipTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regexPattern)
        let regexResults: Bool = zipTest.evaluate(with: strippedZipCode)
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

final class DeliveryZipCodeValidator: Validator {
  
  func uniqueName() -> String {
    return "DeliveryZipCodeValidator"
  }
  
  func validate(items: [AnyObject?]) -> ValidatorResult {
    var results: [Int] = []
    var messages: [String] = []
    for item in items {
      var result: Int = -1
      var message: String = Strings.ValidationMessages.EnterValidZipCode
      if let zipCode: String = item as? String {
        let strippedZipCode: String = zipCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let regexPattern: String = "^\\d{5}?$"
        let zipTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regexPattern)
        let regexResults: Bool = zipTest.evaluate(with: strippedZipCode)
        let configSupportResults = supportsZipCode(strippedZipCode)
        if regexResults == true && configSupportResults == true {
          result = 1
          message = ""
        } else if regexResults == true && configSupportResults == false {
          result = -1
          message = Strings.ValidationMessages.NotAValidDeliveryZipCode
        }
      }
      results.append(result)
      messages.append(message)
    }
    return (results, messages)
  }
  
  func supportsZipCode(_ zipCode: String) -> Bool {
    let config: Config = ConfigManager().getConfig()
    if let _: ConfigLocality = config.configLocalities.supportedLocalities[zipCode] {
      return true
    }
    return false
  }
  
}
