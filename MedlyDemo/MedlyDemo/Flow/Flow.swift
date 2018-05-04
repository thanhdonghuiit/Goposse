//
//  Flow.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/12/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
import UIKit


protocol FlowDelegate : class {
  func onFlowResult(_ code: Int, bundle: [String : AnyObject]?)
}


/**
 * NavigationFlow
 * Represents a flow via a UINavigationController
 */
class NavigationFlow : UINavigationController, ActionDelegate {
  
  weak var flowDelegate: FlowDelegate?
  weak var window: UIWindow!
  
  convenience init(rootAction action: Action, appWindow: UIWindow?) {
    self.init()
    action.actionDelegate = self
    viewControllers = [ action ]
    window = appWindow
  }
  
  func moveToAction(action: Action, bundle: [String : AnyObject]?) {
    action.actionDelegate = self
    if bundle != nil {
      action.bundle = bundle!
    }
    pushViewController(action, animated: true)
  }
  
  func presentFlow(_ flow: NavigationFlow) {
    present(flow, animated: true, completion: nil)
  }
  
  
  func finish(_ code: Int, bundle: [String : AnyObject]? = nil) {
    flowDelegate?.onFlowResult(code, bundle: bundle)
  }
  
  func onActionResult(_ action: Action, code: Int, bundle: [String : AnyObject]?) {
  }
  
  func popAction(animated: Bool, bundle: [String : AnyObject]?) {
    let viewControllers: [UIViewController] = self.viewControllers
    let n: Int = viewControllers.count
    
    if viewControllers.count > 1 && bundle != nil {
      if let previousAction: Action = viewControllers[n - 2] as? Action {
        previousAction.bundle = previousAction.bundle?.union(dictionaries: bundle!)
      }
    }
    popViewController(animated: animated)
  }
}
