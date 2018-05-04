//
//  NetworkedViewController.swift
//  PosseKit
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

public class NetworkedViewController : RoutableViewController {

  private (set) public var request: Request!
  private (set) public var httpClient: HttpClient!

  private static var sharedHttpClient: HttpClient?
  private static var sharedResponseType: Response.Type?
  private var responseType: Response.Type?
  
  private (set) public var contentViewRect: CGRect = CGRect.null
  private (set) public var emptyStateViewRect: CGRect = CGRect.null
  private (set) public var progressViewRect: CGRect = CGRect.null
  
  
  // MARK: - View initialization
  private (set) public lazy var contentView: UIView = {
    var view: UIView = UIView()
    view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
    return view
  }()

  public lazy var emptyStateView: UIView = {
    var view: UIView = UIView()
    view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
    return view
  }()

  public var progressView: CircularProgressView = {
    var view: CircularProgressView = CircularProgressView()
    view.alpha = 0.0
    return view
  }() {
    didSet {
      progressView.alpha = 0.0
    }
  }


  // MARK: - Initializers
  required public init(request: Request) {
    super.init(nibName: nil, bundle: nil)
    commonInit(request: request, responseType: nil)
  }
  
  required public init(request: Request, responseType: Response.Type?) {
    super.init(nibName: nil, bundle: nil)
    commonInit(request: request, responseType: responseType)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func commonInit(request: Request, responseType: Response.Type?) {
    self.request = request
    if responseType != nil {
      self.responseType = responseType
    } else {
      self.responseType = NetworkedViewController.sharedResponseType
    }
    if NetworkedViewController.sharedHttpClient != nil {
      self.httpClient = NetworkedViewController.sharedHttpClient!
    } else {
      self.httpClient = HttpClient()
    }
  }
  
  
  // MARK: - View lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    configureDefaultRects()
    
    self.view.addSubview(self.emptyStateView)
    self.view.addSubview(self.contentView)
    self.view.addSubview(self.progressView)
    
    reload()      // load the configured request
  }
  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // configure the default rects for standard visual components
    configureDefaultRects()
  }
  
  
  // MARK: - Layout
  private func configureDefaultRects() {
    if self.progressViewRect.equalTo(CGRect.null) {
      let w: CGFloat = 30.0, h: CGFloat = 30.0, x: CGFloat = (self.view.bounds.width - w) / 2.0,
      y: CGFloat = (self.view.bounds.height - h) / 2.0;
      var progressRect: CGRect = CGRect(x: x, y: y, width: w, height: h)
      if let navigationController: UINavigationController = self.navigationController {
        progressRect.origin.y -= navigationController.navigationBar.frame.height
      }
      self.progressViewRect = progressRect
      self.progressView.frame = self.progressViewRect
    }
    if self.emptyStateViewRect.equalTo(CGRect.null) {
      self.emptyStateViewRect = self.view.bounds
      self.emptyStateView.frame = self.emptyStateViewRect
    }
    if self.contentViewRect.equalTo(CGRect.null) {
      self.contentViewRect = self.view.bounds
      self.contentView.frame = self.contentViewRect
    }
  }
  

  // MARK: - Shared initialization of logic common to all ViewController instances
  public class func setHttpClient(httpClient: HttpClient) {
    self.sharedHttpClient = httpClient
  }
  
  
  // MARK: - Response type management
  public class func setResponseType(responseType: Response.Type) {
    self.sharedResponseType = responseType
  }


  // MARK: - Network load calls
  public func reload() {
    reload(request: self.request, showLoading: true)
  }

  public func reload(showLoading: Bool) {
    reload(request: self.request, showLoading: showLoading)
  }

  public func reload(request: Request, showLoading: Bool) {
    // initial setup
    self.transitionViewsForLoadStart()
    self.didBeginRequest(request: request)
    if showLoading == true {
      self.setLoadingState(isLoading: showLoading)
    }
    
    // execute the request
    _ = self.httpClient.execute(request: request, responseKind: self.responseType,
      callback: { _httpClientCallback in
        let response = _httpClientCallback.0
        let error = _httpClientCallback.1 as NSError?
        // notify load completed
        DispatchQueue.main.async { () -> Void in
          self.setLoadingState(isLoading: false)
          self.transitionViewsForLoadCompletion()
          self.didReceiveResponse(response: response, error: error, request: request)
        }
      })
  }


  // MARK: - Network Lifecycle delegates
  public func didBeginRequest(request: Request) {
  }

  public func didReceiveResponse(response: Response?, error: NSError?, request: Request) {
  }


  // MARK: - Loading state view transitions
  public func transitionViewsForLoadStart() {
    self.progressView.startAnimating(restart: true)
    UIView.animate(withDuration: 0.2, animations: { () -> Void in
      self.progressView.alpha = 1.0
      self.contentView.alpha = 0.25
    })
  }

  public func transitionViewsForLoadCompletion() {
    self.progressView.stopAnimating()
    UIView.animate(withDuration: 0.2, animations: { () -> Void in
      self.contentView.alpha = 1.0
      self.progressView.alpha = 0.0
    })
  }

  public func setLoadingState(isLoading: Bool) {
    if isLoading {
      transitionViewsForLoadStart()
    } else {
      transitionViewsForLoadCompletion()
    }
  }

}
