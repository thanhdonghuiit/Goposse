//
//  AnalyticsHelper.swift
//  lindenwood
//
//  Created by Kevin Gray on 4/18/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

// NOTE: This class is not in use. Google analytics was set up originally, however
// it has been replaced in favor of Firebase Analytics

import Foundation
import Google.Analytics

final class AnalyticsHelper {
  private var tracker: GAITracker = GAI.sharedInstance().defaultTracker
  
  // MARK: - Singleton initialization
  static let helper: AnalyticsHelper = {
    var instance: AnalyticsHelper = AnalyticsHelper()
    return instance
  }()
  
  func trackEvent(_ category: String, action: String, label: String, value: Int?) {
    let builderValue: NSNumber = value as NSNumber? ?? 0
    let builder: GAIDictionaryBuilder = GAIDictionaryBuilder.createEvent(withCategory: category, action: action, label: label, value: builderValue)
    
    tracker.send((builder.build() as NSDictionary) as? [AnyHashable: Any])
  }
  
  func trackScreenView(screenName name: String) {
    if let builder = GAIDictionaryBuilder.createScreenView() {
      tracker.set(kGAIScreenName, value: name)
      tracker.send((builder.build() as NSDictionary) as? [AnyHashable: Any])
    }
  }
}
