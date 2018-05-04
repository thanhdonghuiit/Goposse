//
//  AuthNetworkHelper.swift
//  lindenwood
//
//  Created by Kevin Gray on 2/22/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
 

final class AuthNetworkHelper : NetworkHelper {
  
  static let helper: AuthNetworkHelper = {
    var networkHelper: AuthNetworkHelper = AuthNetworkHelper()
    return networkHelper
  }()
  
  override class func getBaseUrl() -> String? {
    return Secrets.secrets.secretStringValue(key: Secrets.Keys.BaseAuthURL)
  }
  
  override func setupCallProtocols(_ httpClient: HttpClient) {
    httpClient.addCallProtocol(NetLoggerCallProtocol())
    httpClient.addCallProtocol(AuthCallProtocol())
  }
}
