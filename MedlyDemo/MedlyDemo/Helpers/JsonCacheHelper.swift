//
//  JsonCacheHelper.swift
//  lindenwood
//
//  Created by Kevin Gray on 2/23/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

final class JsonCacheHelper {
  
  // MARK: - Shared helper instance
  static let helper: JsonCacheHelper = {
    var jsonCacheHelper: JsonCacheHelper = JsonCacheHelper()
    return jsonCacheHelper
  }()
  
  func loadJsonFromDisk(jsonFilename: String) -> JsonDictionary? {
    let fileManager: FileManager = FileManager.default
    let paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true) as [AnyObject]
    // If this wasn't found, I don't know that's on iOS, just return
    if paths.count <= 0 {
      return nil
    }
    if let documentsDir: String = paths[0] as? String {
      // Set the path to where the file is
      let cachedCategoriesDirectory: String = documentsDir.appendPathComponent(path: jsonFilename)
      // Write the data to the file
      if fileManager.fileExists(atPath: cachedCategoriesDirectory) {
        let data: Data? = fileManager.contents(atPath: cachedCategoriesDirectory)
        if (data != nil) {
          // NSData retrieved, convert it to a JSON
          if let jsonObject: AnyObject = NSKeyedUnarchiver.unarchiveObject(with: data!) as AnyObject? {
            if let jsonDict: JsonDictionary = jsonObject as? JsonDictionary {
              return jsonDict
            } else {
              return nil
            }
          } else {
            return nil
          }
        } else {
          return nil
        }
      } else {
        return nil
      }
    } else {
      return nil
    }
  }
  
  func saveJsonToDisk(json: JsonDictionary, jsonFilename: String) {
    // Get path to the documents folder
    let paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true) as [AnyObject]
    // If this wasn't found, I don't know that's on iOS, just return.. It really shouldn't happen, but worst case they need to re-download the categories
    if paths.count <= 0 {
      // ERROR - iOS ERROR
      return
    }
    // Again, on iOS
    if let documentsDir: String = paths[0] as? String {
      // Set the path to where the file is
      let cachedCategoriesDirectory: String = documentsDir.appendPathComponent(path: jsonFilename)
      // Write the data to the file
      let saveData: Data = NSKeyedArchiver.archivedData(withRootObject: json)
      try? saveData.write(to: URL(fileURLWithPath: cachedCategoriesDirectory), options: [.atomic])
    } else {
      // ERROR - iOS ERROR
      return
    }
  }
}
