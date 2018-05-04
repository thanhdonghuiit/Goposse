//
//  LABiometryHelper.swift
//  lindenwood
//
//  Created by Kevin Gray on 10/25/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
import LocalAuthentication

final class LABiometryHelper {
  
  // MARK: - Shared helper instance
  static let helper: LABiometryHelper = {
    var helper: LABiometryHelper = LABiometryHelper()
    return helper
  }()
  
  func biometricAuthAvailable() -> Bool {
    let context: LAContext = LAContext()
    if context.canEvaluatePolicy(_: LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil) {
      return true
    } else {
      return false
    }
  }
  
  // NOTE: As of 10/23/2017 LABiometryType on LAContext always returns none.
  // See https://stackoverflow.com/questions/46541758/labiometrytype-in-ios11-always-return-none
  // TODO: Uncomment code below once Apple resolves issue.
  
  func authTypeForDisplay() -> String {
//    let context: LAContext = LAContext()
//    if #available(iOS 11.0, *) {
//      switch context.biometryType {
//      case .typeTouchID:
//        return "Touch ID"
//      case .typeFaceID:
//        return "Face ID"
//      case .none:
//        print("DEBUG: LABiometryType .none should not be reached when calling \(#function)")
//        return "Touch ID"
//      }
//    } else {
      return "Touch ID"
//    }
  }

  func authTypeIconIdentifier() -> String {
//    let context: LAContext = LAContext()
//    if #available(iOS 11.0, *) {
//      switch context.biometryType {
//      case .typeTouchID:
//        return "icon_touch_id"
//      case .typeFaceID:
//        return "icon_face_id"
//      case .none:
//        print("DEBUG: LABiometryType .none should not be reached when calling \(#function)")
//        return "icon_touch_id"
//    } else {
      return "icon_touch_id"
//    }
  }
  
}
