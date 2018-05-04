//
//  PhoneNumberValidator.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/22/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
import libPhoneNumber_iOS

final class PhoneNumberValidator: Validator {
  
  func uniqueName() -> String {
    return "PhoneNumberValidator"
  }
  
  func validate(items: [AnyObject?]) -> ValidatorResult {
    var results: [Int] = []
    var messages: [String] = []
    for item in items {
      var result: Int = -1
      var message: String = Strings.ValidationMessages.EnterValidPhoneNumber
      if let phoneNumber: String = item as? String {
        let strippedPhoneNumber: String = phoneNumber.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let regexPattern: String = "\\d{10}|1\\d{10}"
        //let regexPatternWithOutCountryCode: String = "\\d{10}"
        let phoneTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regexPattern)
        let regexResults: Bool = phoneTest.evaluate(with: strippedPhoneNumber)
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

final class FormattedPhoneNumberValidator: Validator {
  let phoneUtil: NBPhoneNumberUtil = NBPhoneNumberUtil()
  
  func uniqueName() -> String {
    return "PhoneNumberValidator"
  }
  
  func validate(items: [AnyObject?]) -> ValidatorResult {
    var results: [Int] = []
    var messages: [String] = []
    for item in items {
      var result: Int = -1
      var message: String = Strings.ValidationMessages.EnterValidPhoneNumber
      
      if let phoneNumber: String = item as? String {
        
        var validPhoneNumber: Bool = false
        do {
          let parsedPhoneNumber: NBPhoneNumber = try phoneUtil.parse(phoneNumber, defaultRegion: "US")
          validPhoneNumber = phoneUtil.isValidNumber(forRegion: parsedPhoneNumber, regionCode: "US")
        } catch (let error as NSError) {
          print("There was an issue trying to parse phone number while validating: \(error.description)")
        }

        if validPhoneNumber == true {
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
