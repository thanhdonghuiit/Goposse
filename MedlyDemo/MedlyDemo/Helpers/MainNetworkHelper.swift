//
//  BaseNetworkHelper.swift
//  lindenwood
//
//  Created by Kevin Gray on 2/22/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
 

final class MainNetworkHelper : NetworkHelper {
  
  static let helper: MainNetworkHelper = {
    var networkHelper: MainNetworkHelper = MainNetworkHelper()
    return networkHelper
  }()
    
  override class func getBaseUrl() -> String? {
    return Secrets.secrets.secretStringValue(key: Secrets.Keys.BaseMainURL)
  }
  
  override func setupCallProtocols(_ httpClient: HttpClient) {
    httpClient.addCallProtocol(NetLoggerCallProtocol())
    httpClient.addCallProtocol(MainCallProtocol())
  }
}
