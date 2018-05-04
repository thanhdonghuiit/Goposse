//
//  BirthdayValidator.swift
//  lindenwood
//
//  Created by Kevin Gray on 4/19/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

final class BirthdayValidator: Validator {
  
  func uniqueName() -> String {
    return "BirthdayValidator"
  }
  
  func validate(items: [AnyObject?]) -> ValidatorResult {
    var results: [Int] = []
    var messages: [String] = []
    for item in items {
      var result: Int = -1
      var message: String = Strings.ValidationMessages.EnterValidBirthday
      if let values: [String] = item as? [String] {
        if values.count == 3 {
          let monthText: String = values[0]
          let dayText: String = values[1]
          let yearText: String = values[2]
          if monthText.characters.count >= 2 && dayText.characters.count >= 2 && yearText.characters.count == 4 {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMddyyyy"
            if let enteredDate: Date = dateFormatter.date(from: "\(monthText)\(dayText)\(yearText)") {
              // Check that it is not in the future
              let comparisonResult: ComparisonResult = Date().compare(enteredDate)
              if comparisonResult != ComparisonResult.orderedAscending {

                if let oldestDate: Date = dateFormatter.date(from: "01011900") {
                  let comparisonResult: ComparisonResult = oldestDate.compare(enteredDate)
                  if comparisonResult != ComparisonResult.orderedDescending {
                    result = 1
                    message = ""
                  }
                }
              }
            }
          }
        }
      }
      results.append(result)
      messages.append(message)
    }
    return (results, messages)
  }
}
