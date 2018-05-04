//
//  ProgressViewController.swift
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

import Foundation
import CoreGraphics
import UIKit

public class ProgressViewController : RoutableViewController {
  
  
  private (set) public var contentViewRect: CGRect = CGRect.null
  private (set) public var emptyStateViewRect: CGRect = CGRect.null
  private (set) public var progressViewRect: CGRect = CGRect.null
  
  
  // MARK: - View lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    configureDefaultRects()
    
    self.view.addSubview(self.emptyStateView)
    self.view.addSubview(self.contentView)
    self.view.addSubview(self.progressView)
  }
  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // configure the default rects for standard visual components
    configureDefaultRects()
  }

  
  // MARK: - View initialization
  private (set) public lazy var contentView: UIView = {
    var view: UIView = UIView()
    view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
    return view
  }()
  
  private (set) public var emptyStateView: UIView = {
    var view: UIView = UIView()
    view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
    view.alpha = 0.0
    return view
  }() {
    didSet {
      emptyStateView.alpha = 0.0
    }
  }
  
  public var progressView: CircularProgressView = {
    var view: CircularProgressView = CircularProgressView()
    view.alpha = 0.0
    return view
  }() {
    didSet {
      progressView.alpha = 0.0
    }
  }

  
  // MARK: - Layout
  private func configureDefaultRects() {
    if self.progressViewRect.equalTo(CGRect.null) {
      let w: CGFloat = 30.0, h: CGFloat = 30.0, x: CGFloat = (self.view.bounds.width - w) / 2.0,
      y: CGFloat = (self.view.bounds.height - w) / 2.0;
      self.progressView.frame = CGRect(x: x, y: y, width: w, height: h)
    } else {
      self.progressView.frame = self.progressViewRect
    }
    
    if self.emptyStateViewRect.equalTo(CGRect.null) {
      self.emptyStateView.frame = self.view.bounds
    } else {
      self.emptyStateView.frame = self.emptyStateViewRect
    }
    
    if self.contentViewRect.equalTo(CGRect.null) {
      self.contentView.frame = self.view.bounds
    } else {
      self.contentView.frame = self.contentViewRect
    }
  }
  
  
  // MARK: - Loading state view transitions
  public func transitionViewsForLoadStart() {
    self.progressView.startAnimating(restart: true)
    UIView.animate(withDuration: 0.2, animations: { () -> Void in
      self.progressView.alpha = 1.0
      self.contentView.alpha = 0.15
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
