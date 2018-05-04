//
//  Secrets.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/7/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
import Locksmith
 

final class Secrets {
  
  struct Keys {
    static let BaseMainURL: String = "BaseMainURL"
    static let BaseAuthURL: String = "BaseAuthURL"
    static let AppMainSharedSecret: String = "AppMainSharedSignature"
    static let AppAuthSharedSecret: String = "AppAuthSharedSignature"
    static let AuthToken: String = "AuthToken"
    static let UserId: String = "UserId"
    static let GoogleTrackingId: String = "GoogleTrackingId"
    static let GoogleCloudMessagingSenderId: String = "GoogleCloudMessagingSenderId"
    static let GoogleCloudMessagingShouldSandbox: String = "GoogleCloudMessagingShouldSandbox"
  }
  
  struct BugSnag {
    static let Key = "66a64be0291962b8baab17545c0aa5e5"
  }
  
  private var secretsConfiguration: [String : [KeyVal]] = [:]
  private var secureHelper: SecureHelper = SecureHelper()
  
  // MARK: - Initialize Singleton
  static let secrets: Secrets = {
    return Secrets()
  }()
  
  init() {
    secretsConfiguration = defaultConfiguration()
  }
  
  // MARK: - Configuration section
  private func defaultConfiguration() -> [String : [KeyVal]] {
    var config: [String : [KeyVal]] = [:]
    
    let userDefaults: UserDefaults = UserDefaults.standard
    let userId: String? = userDefaults.object(forKey: Keys.UserId) as! String?
    
    // Default all to how they should be for a release-production version
    var gcmShouldSandbox: Bool = false
    #if DEBUG
      gcmShouldSandbox = true
    #endif
    print("\n\n>>>>>>>>>>>>   SANDBOX MODE: \(gcmShouldSandbox)\n\n")
    
    // For local host
    config[BuildConfigurations.Debug] = [
      KeyVal(key: Secrets.Keys.BaseMainURL, value: Urls.BaseMainUrlDevelopment),
      KeyVal(key: Secrets.Keys.BaseAuthURL, value: Urls.BaseAuthUrlDevelopment),
      KeyVal(key: Secrets.Keys.AppAuthSharedSecret, value: "vbIUZHG+WhtUcTSmJ/UkStV3Pe5KUqbrRwKpodlz977XMSkSh+V/QZUK3mkhP5EF9erJsd9wujiGd3g0HEAf8sZkDapUjkt8l3CLEPQdlj8="),
      KeyVal(key: Secrets.Keys.AppMainSharedSecret, value: "oOR3ePYDEt6Ay2Fdng+JQd2y9BRXcVZFhZOUMxJxLukE8MPnI59JlexYQi/GwkFD6ow9lB5NT/EK/axlHMeBMaSeHDKIyOnPMVUOooFfE6M="),
      KeyVal(key: Secrets.Keys.GoogleTrackingId, value: "UA-76584321-1"),
      KeyVal(key: Secrets.Keys.GoogleCloudMessagingSenderId, value: "886245952571"),
      KeyVal(key: Secrets.Keys.GoogleCloudMessagingShouldSandbox, value: gcmShouldSandbox),
    ]
    
    // For live testing on a debug server
    config[BuildConfigurations.Staging] = [
      KeyVal(key: Secrets.Keys.BaseMainURL, value: Urls.BaseMainUrlStaging),
      KeyVal(key: Secrets.Keys.BaseAuthURL, value: Urls.BaseAuthUrlStaging),
      KeyVal(key: Secrets.Keys.AppAuthSharedSecret, value: "e230dfb99fa98166a34e18bddc3e3157817c8d58807e2f91ce98b9e8fb71f4a5915cd677a74acd3a6055f769ba5311af143bb46bfde2abcbeab83c44b744d4f1"),
      KeyVal(key: Secrets.Keys.AppMainSharedSecret, value: "4870aba84d59363afcab1072d1b6170eb29026a74c39f36225b6fb51d78f0faaffc47f3149ff72b49d1af3069178d32aeebcf2c123c6a9e53d14543f64586bfa"),
      KeyVal(key: Secrets.Keys.GoogleTrackingId, value: "UA-76584321-1"),
      KeyVal(key: Secrets.Keys.GoogleCloudMessagingSenderId, value: "886245952571"),
      KeyVal(key: Secrets.Keys.GoogleCloudMessagingShouldSandbox, value: gcmShouldSandbox),
    ]
    
    // The real deal
    config[BuildConfigurations.Release] = [
      KeyVal(key: Secrets.Keys.BaseMainURL, value: Urls.BaseMainUrlProduction),
      KeyVal(key: Secrets.Keys.BaseAuthURL, value: Urls.BaseAuthUrlProduction),
      KeyVal(key: Secrets.Keys.AppAuthSharedSecret, value: "0c548652ba4cf1136bb31ff83364afd05eb0c7afafe544f00fbd592df0d6355527b0f2a8c4c0e7ebd0b32e224e3671392e9654419cc9cc3b0061cc5412a534a8"),
      KeyVal(key: Secrets.Keys.AppMainSharedSecret, value: "e75d0526ab7609c0c4a8e3a6b84f6108ccfb5741cd69927817d21db6d9fe687b99b7b688f1fa09be80090a075c87258fde1ffbc7f9f5f817567f4789c188bfc4"),
      KeyVal(key: Secrets.Keys.GoogleTrackingId, value: "UA-76584321-1"),
      KeyVal(key: Secrets.Keys.GoogleCloudMessagingSenderId, value: "886245952571"),
      KeyVal(key: Secrets.Keys.GoogleCloudMessagingShouldSandbox, value: gcmShouldSandbox),
    ]
    
    var tokenKey: KeyVal?
    var userKey: KeyVal?
    if userId != nil {
      if let authToken: String = currentAuthToken() {
        tokenKey = KeyVal(key: Secrets.Keys.AuthToken, value: authToken)
        userKey = KeyVal(key: Secrets.Keys.UserId, value: userId!)
      }
      if (tokenKey != nil && userKey != nil) {
        config[BuildConfigurations.Debug]!.append(contentsOf: [tokenKey!, userKey!])
        config[BuildConfigurations.Staging]!.append(contentsOf: [tokenKey!, userKey!])
        config[BuildConfigurations.Release]!.append(contentsOf: [tokenKey!, userKey!])
      }
    }
    
    return config
  }
  
  // MARK: - Value storage
  func setSecret(key: String, value: AnyObject) {
    let configuration: String = AppInfo.currentBuildConfiguration()
    setSecret(configuration: configuration, key: key, value: value, saveToKeychain: false)
  }
  
  func setSecret(key: String, value: AnyObject, saveToKeychain: Bool) {
    let configuration: String = AppInfo.currentBuildConfiguration()
    setSecret(configuration: configuration, key: key, value: value, saveToKeychain: saveToKeychain)
  }
  
  func setSecret(configuration: String, key: String, value: AnyObject, saveToKeychain: Bool) {
    var foundKeyVal: Bool = false
    if var dictVals: [KeyVal] = secretsConfiguration[configuration] {
      for keyVal: KeyVal in dictVals {
        if keyVal.key as! String == key {
          foundKeyVal = true
          keyVal.value = value
        }
      }
      if foundKeyVal == false {
        dictVals.append(KeyVal(key: key, value: value))
        secretsConfiguration[configuration] = dictVals
      }
      if saveToKeychain == true {
        let userDefaults: UserDefaults = UserDefaults.standard
        let userId: String? = userDefaults.object(forKey: Keys.UserId) as! String?
        if userId != nil {
          if let stringValue: String = value as? String {
            do {
              try secureHelper.saveSecureValue(userId: userId!, forKey: key, value: stringValue)
            } catch {
              // TODO: What to do here?
            }
          }
        }
      }
    }
  }
  
  // MARK: - Value retrieval
  func secretValue(key: String, defaultValue: AnyObject) -> AnyObject {
    var returnValue: AnyObject = defaultValue
    if let secretValue: AnyObject = secretValue(key: key) {
      returnValue = secretValue
    }
    return returnValue
  }
  
  func secretValue(key: String) -> AnyObject? {
    let configuration: String = AppInfo.currentBuildConfiguration()
//    print("\(key) : \(configuration)")
    let result = secretValue(configuration: configuration, key: key)
    return result
  }
  
  func secretValue(configuration: String, key: String) -> AnyObject? {
    var secretValue: AnyObject? = nil
    if let dictVals: [KeyVal] = secretsConfiguration[configuration] {
      var foundVals: [KeyVal] = dictVals.filter({ $0.key as! String == key })
      if foundVals.count > 0 {
        secretValue = foundVals[0].value as AnyObject?
      }
    }
    
    return secretValue
  }
  
  func secretStringValue(key: String) -> String? {
    return secretValue(key: key) as? String
  }
  
  func resetSecretsConfiguration() {
    secretsConfiguration = defaultConfiguration()
  }
  
  // MARK: - Token helper
  private func currentAuthToken() -> String? {
    let userDefaults: UserDefaults = UserDefaults.standard
    let userId: String? = userDefaults.object(forKey: Keys.UserId) as! String?
    if userId != nil {
      let token: String? = secureHelper.loadSecureValue(userId: userId!, forKey: Keys.AuthToken) as! String?
      if token != nil {
        return token
      }
    }
    return nil
  }
}
