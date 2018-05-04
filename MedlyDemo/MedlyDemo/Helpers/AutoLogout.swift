//
//  AutoLogout.swift
//  lindenwood
//
//  Created by Posse on 10/25/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
import UIKit

@objc(AutoLogoutTimer)

final class AutoLogoutTimer: UIApplication {
  
  static let ApplicationDidTimoutNotification = "AppTimout"
  
  // The timeout in seconds for when to fire the idle timer.
  let timeoutInSeconds: TimeInterval = 10 * 60
  
  var idleTimer: Timer?
  
  // Listen for any touch. If the screen receives a touch, the timer is reset.
  override func sendEvent(_ event: UIEvent) {
    super.sendEvent(event)
    
    if idleTimer != nil {
      resetIdleTimer()
    }
    
    if let touches = event.allTouches {
      for touch in touches {
        if touch.phase == UITouchPhase.began {
          print("timer reset!!!")
          resetIdleTimer()
        }
      }
    }
  }
  
  // Resent the timer because there was user interaction.
  func resetIdleTimer() {
    if let idleTimer = idleTimer {
      print("timer invalidated!!!")
      idleTimer.invalidate()
    }
    
    idleTimer = Timer.scheduledTimer(timeInterval: timeoutInSeconds, target: self, selector: #selector(AutoLogoutTimer.idleTimerExceeded), userInfo: nil, repeats: false)
  }
  
  // If the timer reaches the limit as defined in timeoutInSeconds, post this notification.
  func idleTimerExceeded() {
    NotificationCenter.default.post(name: Notification.Name(rawValue: AutoLogoutTimer.ApplicationDidTimoutNotification), object: nil)
  }
}
