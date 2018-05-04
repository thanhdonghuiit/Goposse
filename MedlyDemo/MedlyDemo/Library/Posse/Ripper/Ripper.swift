//
//  Ripper.swift
//  Ripper
//
//  Created by Posse in NYC
//  http://goposse.com
//
//  Copyright (c) 2016 Posse Productions LLC.
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//  * Neither the name of the Posse Productions LLC, Posse nor the
//    names of its contributors may be used to endorse or promote products
//    derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL POSSE PRODUCTIONS LLC (POSSE) BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

import UIKit
 

public enum ImageCacheMode {
  case originals
  case processed
}

open class Ripper {
  
  static let DEFAULT_CACHE_COUNT = 100
  
  // MARK: - Internal / private properties
  internal var placeholderImage: UIImage?
  internal var resizeFilter: ScaleFilter?
  internal var httpClient: HttpClient!
  internal var imageCache: NSCache<AnyObject, AnyObject>!
  internal var headers: [String : String]?
  internal var filters: [Filter]?
  
  private var operationQueue: OperationQueue!
  

  // MARK: - Public properties
  open var imageCacheMode: ImageCacheMode = .processed
  open var cacheLimit: Int = DEFAULT_CACHE_COUNT {
    didSet {
      self.imageCache.countLimit = self.cacheLimit
    }
  }
  
  
  // MARK: - Singleton
  open static let downloader: Ripper = {
    var instance: Ripper = Ripper()
    return instance
  }()
  
  
  // MARK: - Initialization
  public init() {
    // initialize the shared http client
    var clientConfiguration: HttpClientConfiguration = HttpClientConfiguration()
    clientConfiguration.timeoutInterval = 60.0
    self.httpClient = HttpClient(configuration: clientConfiguration)

    initialize()  // common initialization
  }
  
  public init(httpConfiguration: HttpClientConfiguration) {
    self.httpClient = HttpClient(configuration: httpConfiguration)
    
    initialize()  // common initialization
  }
  
  private func initialize() {
    // initialize the image cache
    self.imageCache = NSCache()
    self.imageCache.countLimit = Ripper.DEFAULT_CACHE_COUNT
    
    // initialize properties / defaults
    self.headers = [:]
    self.filters = []
    
    // initialize the operation queue
    self.operationQueue = OperationQueue(downloader: self)
  }

  
  // MARK: - Global operations / properties
  open func resizeFilter(width: Double, height: Double) -> Ripper {
    self.resizeFilter = ScaleFilter()
    self.resizeFilter!.outputSize = CGSize(width: width, height: height)
    return self
  }

  open func placeholder(_ placeholderImage: UIImage) -> Ripper {
    self.placeholderImage = placeholderImage
    return self
  }
  
  open func HTTPHeaders(_ headers: [String : String]) -> Ripper {
    self.headers = headers
    return self
  }
  
  open func addHeader(key: String, value: String) -> Ripper {
    if self.headers != nil {
      self.headers![key] = value
    }
    return self
  }
  
  open func addFilter(_ filter: Filter) -> Ripper {
    if self.filters != nil {
      self.filters!.append(filter)
    }
    return self
  }

  
  // MARK: - Operation creation
  open func load(url: String) -> Operation {
    return self.operationQueue.makeOperation(url: url, named: nil)
  }
  
  open func load(named: String) -> Operation {
    return self.operationQueue.makeOperation(url: nil, named: named)
  }
  
  
}
