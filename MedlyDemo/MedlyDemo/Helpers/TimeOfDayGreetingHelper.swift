//
//  TimeOfDayGreetingHelper.swift
//  lindenwood
//
//  Created by Kevin Gray on 3/23/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

final class TimeOfDayGreetingHelper {
  
  // MARK: - Shared helper instance
  static let helper: TimeOfDayGreetingHelper = {
    var helper: TimeOfDayGreetingHelper = TimeOfDayGreetingHelper()
    return helper
  }()
  
  func greetingForCurrentTime() -> String {
    let hour = (Calendar.current as NSCalendar).component(.hour, from: Date())
    if hour >= 5 && hour < 12 {
      return Strings.Greetings.Morning
    } else if hour >= 12 && hour < 18 {
      return Strings.Greetings.Afternoon
    } else {
      return Strings.Greetings.Evening
    }
  }
}
