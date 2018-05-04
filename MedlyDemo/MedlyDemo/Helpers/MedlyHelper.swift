//
//  MedlyHelper.swift
//  lindenwood
//
//  Created by Louis Tur on 4/25/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

import SnapKit
import UIKit
import Locksmith
import UserNotifications


final class MedlyHelper {
  
  
  // MARK: - Alert Helper
  class func callPharmacy(_ presenter: Action, pharmacyIndex: Int? = nil, showModal: Bool = true) {
    var phoneNumber = ""
    
    if let currentSession: UserSession = UserSession.currentSession {
      if pharmacyIndex != nil {
        if let pharmacies = currentSession.user.pharmacies {
          let selectedPharmacy: Pharmacy = pharmacies[pharmacyIndex!]
          phoneNumber = selectedPharmacy.phoneNumber
        }
      }
      else {
        if let defaultPharmacy: Pharmacy = currentSession.user.defaultPharmacy {
          phoneNumber = defaultPharmacy.phoneNumber
        }
      }
    }
    
    if let url = URL(string: "tel://\(phoneNumber)") {
      
      let deviceCanOpenURL: Bool = UIApplication.shared.canOpenURL(url)
      if deviceCanOpenURL == true {
        
        if showModal {
          MedlyHelper.showConfirmationPrompt(actionTitle: Strings.ResultMessages.Feed.CallPharmacyConfirmationTitle,
                                             message: Strings.ResultMessages.Feed.CallPharmacyConfirmationMessage,
                                             confirmAction: Strings.ResultMessages.Feed.CallPharmacyConfirmationAction,
                                             cancelAction: Strings.Generic.Cancel,
                                             results: { (didConfirm: Bool) -> Void in
                                              
                                              if didConfirm == true {
                                                UIApplication.shared.openURL(url)
                                              }
          })
        } else {
          UIApplication.shared.openURL(url)
        }
       
      }
      else { // not capable of opening URL
        MedlyHelper.showAlert(title: Strings.ResultMessages.Feed.FailedToLaunchTelephoneTitle,
                             message: "\(Strings.ResultMessages.Feed.FailedToLaunchTelephoneMessage) \(phoneNumber)",
                             actionTitle: Strings.Generic.Ok)
      }
    }
    else { // no pharm info
      MedlyHelper.showAlert(title: Strings.ResultMessages.Feed.NoPharmacyInfoAttachedToUserTitle,
                           message: Strings.ResultMessages.Feed.NoPharmacyInfoAttachedToUserMessage,
                           actionTitle: Strings.Generic.Ok)
    }

  }
  
  class func textPharmacy(_ presenter: Action, pharmacyIndex: Int? = nil, showModal: Bool = true) {
    var phoneNumber = ""
    
    if let currentSession: UserSession = UserSession.currentSession {
      if pharmacyIndex != nil {
        if let pharmacies = currentSession.user.pharmacies {
          let selectedPharmacy: Pharmacy = pharmacies[pharmacyIndex!]
          phoneNumber = selectedPharmacy.phoneNumber
        }
      }
      else {
        if let defaultPharmacy: Pharmacy = currentSession.user.defaultPharmacy {
          phoneNumber = defaultPharmacy.phoneNumber
        }
      }
    }
    
    if let url = URL(string: "sms://\(phoneNumber)") {
      
      let deviceCanOpenURL: Bool = UIApplication.shared.canOpenURL(url)
      if deviceCanOpenURL == true {
        if showModal {
          MedlyHelper.showConfirmationPrompt(actionTitle: Strings.ResultMessages.Feed.TextPharmacyConfirmationTitle,
                                             message: Strings.ResultMessages.Feed.TextPharmacyConfirmationMessage,
                                             confirmAction: Strings.ResultMessages.Feed.TextPharmacyConfirmationAction,
                                             cancelAction: Strings.Generic.Cancel,
                                             results: { (didConfirm: Bool) -> Void in
                                              
                                              if didConfirm == true {
                                                UIApplication.shared.openURL(url)
                                              }
          })
        } else {
          UIApplication.shared.openURL(url)
        }
      }
      else { // not capable of opening URL
        MedlyHelper.showAlert(title: Strings.ResultMessages.Feed.FailedToTextTelephoneTitle,
                              message: "\(Strings.ResultMessages.Feed.FailedToTextTelephoneMessage) \(phoneNumber)",
          actionTitle: Strings.Generic.Ok)
      }
    }
    else { // no pharm info
      MedlyHelper.showAlert(title: Strings.ResultMessages.Feed.NoPharmacyInfoAttachedToUserTitle,
                            message: Strings.ResultMessages.Feed.NoPharmacyInfoAttachedToUserMessage,
                            actionTitle: Strings.Generic.Ok)
    }
    
  }
  
  class func showConfirmationPrompt(actionTitle: String, message: String, confirmAction: String, cancelAction: String = Strings.Generic.Cancel, results: @escaping (_ didConfirm: Bool)->Void ) {
    
    let confirmAlertAction: UIAlertAction = UIAlertAction(title: confirmAction, style: UIAlertActionStyle.default) { (alert: UIAlertAction) -> Void in
      results(true)
    }
    
    let cancelAlertAction: UIAlertAction = UIAlertAction(title: cancelAction, style: UIAlertActionStyle.cancel) { (alert: UIAlertAction) -> Void in
      results(false)
    }
    
    let alertController: UIAlertController = UIAlertController(title: actionTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(confirmAlertAction)
    alertController.addAction(cancelAlertAction)
    DispatchQueue.main.async(execute: {
      let alertWindow = UIWindow(frame: UIScreen.main.bounds)
      alertWindow.rootViewController = UIViewController()
      alertWindow.windowLevel = UIWindowLevelAlert + 1;
      alertWindow.makeKeyAndVisible()
      alertWindow.rootViewController?.present(alertController, animated: true, completion: nil)
      // REMOVE
//      presenter.present(alertController, animated: true, completion: nil)
    })

  }
  
  class func showDestructiveConfirmationPrompt(actionTitle: String, message: String, destructiveMessage: String, results: @escaping (_ shouldDelete: Bool)->Void) {
    
    let deleteAlertAction: UIAlertAction = UIAlertAction(title: destructiveMessage, style: UIAlertActionStyle.destructive) { (alert: UIAlertAction) -> Void in
      results(true)
    }
    
    let cancelAlertAction: UIAlertAction = UIAlertAction(title: Strings.Generic.Cancel, style: UIAlertActionStyle.cancel) { (alert: UIAlertAction) -> Void in
      results(false)
    }
    
    let alertController: UIAlertController = UIAlertController(title: actionTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(deleteAlertAction)
    alertController.addAction(cancelAlertAction)
    DispatchQueue.main.async(execute: {
      let alertWindow = UIWindow(frame: UIScreen.main.bounds)
      alertWindow.rootViewController = UIViewController()
      alertWindow.windowLevel = UIWindowLevelAlert + 1;
      alertWindow.makeKeyAndVisible()
      alertWindow.rootViewController?.present(alertController, animated: true, completion: nil)
      // REMOVE
//      presenter.present(alertController, animated: true, completion: nil)
    })
  }
  
  class func showAlert(title: String, message: String, actionTitle: String, handler: ((_ alert: UIAlertAction?) -> Void)? = nil) {
    // Show it on the main thread
    DispatchQueue.main.async(execute: {
      let alertController = UIAlertController(title: title, message:
        message, preferredStyle: UIAlertControllerStyle.alert)
      alertController.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default,handler: handler))
      
      let alertWindow = UIWindow(frame: UIScreen.main.bounds)
      alertWindow.rootViewController = UIViewController()
      alertWindow.windowLevel = UIWindowLevelAlert + 1;
      alertWindow.makeKeyAndVisible()
      alertWindow.rootViewController?.present(alertController, animated: true, completion: nil)
      // REMOVE:
//      presenter.present(alertController, animated: true, completion: nil)
    })
  }
  
  
  // MARK: - Name Helper
  class func feedNotificationImageForKey(_ key: String) -> UIImage? {
    switch key {
    case MainFeedImages.FailureImage:
      return UIImage(named: "image_feed_exclamation")
      
    case MainFeedImages.GreenShirtDude:
      return UIImage(named: "image_feed_medly_dude")
      
    case MainFeedImages.MaleDoctor:
      return UIImage(named: "image_feed_male_doctor")
      
    case MainFeedImages.FemaleDoctor:
      return UIImage(named: "image_feed_female_doctor")
      
    case MainFeedImages.RxPillBottle:
      return UIImage(named: "image_feed_pill_bottle")
      
    case MainFeedImages.DeliveryVan:
      return UIImage(named: "image_feed_delivery_van")
      
    default:
      return UIImage(named: "image_feed_exclamation")
    }
  }
  
  
  // MARK: - UI Helper
  class func drawDropShadowForView(view: UIView, color: CGColor = Colors.GrayAAAAAA.cgColor, cornerRadius: CGFloat = 4.0) {
    view.clipsToBounds = false
    view.layer.cornerRadius = cornerRadius
    view.layer.masksToBounds = false
    view.layer.shadowColor = color
    view.layer.shadowOffset = CGSize(width: Dimens.Onboarding.CardShadowOffsetX, height: Dimens.Onboarding.CardShadowOffsetY)
    view.layer.shadowRadius = Dimens.Onboarding.CardShadowRadius
    view.layer.shadowOpacity = Float(Dimens.Onboarding.CardShadowOpacity)
  }
  
  class func requestToEnableBiometricAuth(_ presentingAction: Action, onCompletion: @escaping () -> Void ) {
    let user: User = UserSession.currentSession!.user
    
    if (LABiometryHelper.helper.biometricAuthAvailable() == false || user.biometricAuthEnabled != nil) {
      onCompletion()
      return
    }
    
    let authType = LABiometryHelper.helper.authTypeForDisplay()
    showConfirmationPrompt(actionTitle: "Enable \(authType)?", message: "Logging back into Medly is a lot easier if you have \(authType) enabled!", confirmAction: "OK", cancelAction: "No") { (confirmed) in
      UserSession.currentSession!.updateUserBiometricAuthEnabled(confirmed)
      onCompletion()
      return
    }
  }
  
  
  // MARK: - Notification Registration
  /**
  Registers for push notifications. Designed to always prompt on first launch, following logging in. After that, will only
  prompt again if the user has not enabled notifications, and it has been at least a day since they last opened the app.
  */
  class func registerForPushNotifications(_ presentingAction: Action) {
    let application: UIApplication = UIApplication.shared
    
    if application.isRegisteredForRemoteNotifications {
      return
    }

    if let notificationSettings: UIUserNotificationSettings = application.currentUserNotificationSettings {
      if notificationSettings.types != [.alert, .badge, .sound]
      || !application.isRegisteredForRemoteNotifications {
        if UserSession.hasCurrentSession() {
          (application.delegate as? AppDelegate)?
            .requestPushNotificationAuthotizzation(application)
        }
      }
    }
    
    let isFirstRun = (application.delegate as? AppDelegate)!.isFirstRun
    
    if !isFirstRun,
      shouldPromptForNotificationPermission() {
      MedlyHelper.showAlert(title: "Medly Can Send You Updates!",
                            message: "Medly will keep you up-to-date with important information about your prescriptions. But, we need your permission to send notifications first.\n\nIf you've turned off notifications, go to\n\nSettings > Medly > Notifications > Allow Notifications",
                            actionTitle: Strings.Generic.Ok, handler: nil)
    }
  }
  
  /** 
   Checks to see if it has been over a day since the last time a user was (possibly) notified. If the NotificationPrompted
   has not yet been added, we return true and set the value to right now. Otherwise, only return true if it has been over 
   a day at least.
   */
  private class func shouldPromptForNotificationPermission() -> Bool {
    let defaults = UserDefaults.standard
    let oneDayInSeconds: Double = 86400.0
    let now: Date = Date()
    
    guard let lastDateSincePrompt: Date = defaults.object(forKey: Constants.BundleKey.NotificationPrompted) as? Date else {
      defaults.set(now, forKey: Constants.BundleKey.NotificationPrompted)
      defaults.synchronize()
      return true
    }
    
    let timeSinceLastPrompt: TimeInterval = now.timeIntervalSince(lastDateSincePrompt)
    if Double(timeSinceLastPrompt) > oneDayInSeconds { // over a day, prompt if needed
      defaults.set(now, forKey: Constants.BundleKey.NotificationPrompted)
      defaults.synchronize()
      return true
    }
    return false
  }
  
  
  // MARK: - LocksmithError Helper 
  class func handleErrorType(_ errorType: LocksmithError) -> String {
    var errorMessage: String
    switch errorType {
    case .allocate: errorMessage = "Failed to allocate memory."
    case .authFailed: errorMessage = "Authorization/Authentication failed."
    case .decode: errorMessage = "Unable to decode the provided data."
    case .duplicate: errorMessage = "The item already exists."
    case .interactionNotAllowed: errorMessage = "Interaction with the Security Server is not allowed."
    case .noError: errorMessage = "No error."
    case .notAvailable: errorMessage = "No trust results are available."
    case .notFound: errorMessage = "The item cannot be found."
    case .param: errorMessage = "One or more parameters passed to the function were not valid."
    case .requestNotSet: errorMessage = "The request was not set"
    case .typeNotFound: errorMessage = "The type was not found"
    case .unableToClear: errorMessage = "Unable to clear the keychain"
    case .undefined: errorMessage = "An undefined error occurred"
    case .unimplemented: errorMessage = "Function or operation not implemented."
    }
    return errorMessage
  }
  
}
