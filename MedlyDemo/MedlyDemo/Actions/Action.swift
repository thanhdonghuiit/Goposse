//
//  Action.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/12/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import UIKit


protocol ActionDelegate : class {
  func onActionResult(_ action: Action, code: Int, bundle: [String : AnyObject]?)
}

class Action : ProgressViewController {
  
  static let ACTION_CANCELED: Int = -1
  static let ACTION_FAILED: Int = 0
  static let ACTION_OK: Int = 1
  static let ACTION_DONE: Int = 2
  
  
  var bundle: [String:AnyObject]? = [:]
  weak var actionDelegate: ActionDelegate?
  
  var actionIndex: Int = -1
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  func actionName() -> String {
    return ""
  }
  
  func finish(_ code: Int, bundle: [String:AnyObject]? = nil) {
    DispatchQueue.main.async {
      self.actionDelegate?.onActionResult(self, code: code, bundle: bundle)
    }
  }
  
}
