//
//  NetworkHelper.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/7/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
 

typealias NetworkHelperCallback = (_ result: NetworkResult) -> Void

class NetworkHelper {
  
  // MARK: - Variables
  private (set) var httpClient: HttpClient!
  
  
  // MARK: - Initialization
  init() {
    let clientConfiguration: HttpClientConfiguration = HttpClientConfiguration()
    httpClient = HttpClient(configuration: clientConfiguration)
    setupCallProtocols(httpClient)
  }
  
  init(httpClient: HttpClient) {
    self.httpClient = httpClient
  }
  
  // MARK: - Standard network configuration
  func setupCallProtocols(_ httpClient: HttpClient) {
  }
  
  class func getBaseUrl() -> String? {
    return nil
  }
  
  // MARK: - Call execution
  /** Calls Haitch's HttpClient function:
   
    `execute(request request: Request, responseKind: Response.Type?, callback: HttpClientCallback?) -> NSURLSessionDataTask?`
  */
  func execute(request: Request, callback: NetworkHelperCallback?) -> URLSessionDataTask? {
    return httpClient.execute(request: request, responseKind: NetworkResponse.self)
      { httpClientCallback -> Void in
        let response = httpClientCallback.0
        let error = httpClientCallback.1
        let result: NetworkResult = NetworkResult()
        result.executeError = error as NSError?
        let networkResponse: NetworkResponse? = response as? NetworkResponse
        if networkResponse != nil {
          if result.executeError == nil {
            result.statusCode = networkResponse!.statusCode
            result.executeError = networkResponse!.internalError
          }
          result.apiResponse = networkResponse!.apiResponse
        }
        if callback != nil {
          callback!(result)
        }
    }
  }
  
  // MARK: - URL helpers
  class func urlString(path: String) -> String {
    return urlString(path: path, params: nil)
  }
  
  class func urlString(path: String, params: RequestParams?) -> String {
    var baseUrl: String = ""
    if let configBaseUrl: String = getBaseUrl() {
      baseUrl = configBaseUrl
      if let convUrl: URL = URL(string: path, relativeTo: URL(string: baseUrl)) {
        baseUrl = convUrl.absoluteString
      }
      return NetHelper.urlWithParams(baseUrl, params: params)
    } else {
      return path
    }
  }
  
  
}
