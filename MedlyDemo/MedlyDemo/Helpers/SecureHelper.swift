//
//  SecureHelper.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/7/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
import Locksmith
 


final class SecureHelper {
  
  let configName: String = AppInfo.currentBuildConfiguration()
  private var cachedData: NSDictionary?
  private var userAccoundId: String?
  
  // MARK: - Initialization
  init() {
  }
  
  
  // MARK: - Keychain accessors
  func loadSecureData(userId: String) -> NSDictionary? {
    if cachedData == nil {
      let userKey: String = "\(userId)-\(configName)"
      userAccoundId = userKey
      return Locksmith.loadDataForUserAccount(userAccount: userKey) as NSDictionary?
    } else {
      return cachedData
    }
  }
  
  func loadSecureValue(userId: String, forKey key: String) -> AnyObject? {
    if let data: NSDictionary = loadSecureData(userId: userId) {
      return data.object(forKey: key) as AnyObject?
    }
    return nil
  }
  
  func saveSecureData(userId: String, data: [String: String]) throws {
    let userKey: String = "\(userId)-\(configName)"
    cachedData = data as NSDictionary?
    do {
      try Locksmith.saveData(data: data, forUserAccount: userKey)
    } catch {
      throw PersistenceError.saveFailed
    }
  }
  
  func saveSecureValue(userId: String, forKey key: String, value: String) throws {
    if let secureData: NSDictionary = loadSecureData(userId: userId) {
      if var data: [String : String] = secureData as? [String : String] {
        data[key] = value
        try saveSecureData(userId: userId, data: data)
      } else {
        var data: [String : String] = [String : String]()
        data[key] = value
        try saveSecureData(userId: userId, data: data)
      }
    } else {
      var data: [String : String] = [String : String]()
      data[key] = value
      try saveSecureData(userId: userId, data: data)
    }
  }
  
  func clearValue(userId: String, key: String) throws {
    if let secureData: NSDictionary = loadSecureData(userId: userId) {
      if var data: [String : String] = secureData as? [String : String] {
        data.removeValue(forKey: key)
        data[key] = nil
        try saveSecureData(userId: userId, data: data)
      } else {
        throw PersistenceError.deleteFailed
      }
      
    }
  }
  
  func clearKeychain() throws {
    do {
      try Locksmith.deleteDataForUserAccount(userAccount: userAccoundId!)
    } catch {
      throw PersistenceError.deleteFailed
    }
  }
}
