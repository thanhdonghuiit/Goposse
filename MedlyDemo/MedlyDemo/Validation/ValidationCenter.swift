//
//  ValidationCenter.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/20/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import UIKit

struct ValidationResult {
  var view: UIView!
  var validator: Validator!
  var validatorResult: ValidatorResult!
}

// Maps a UIView type to a function that returns a value to validate
typealias TypeMapping = (viewType: AnyClass, mappingFunc: (_ view: UIView) -> AnyObject?)
typealias TypeResultMapping = (viewType: AnyClass, mappingFunc: (_ view: UIView, _ results: [ValidationResult]) -> ())

final class ValidationCenter {
  
  private var viewsToValidate: [UIView : [Validator]] = [:]
  private var typeMaps: [TypeMapping] = []
  private var typeFailureMaps: [TypeResultMapping] = []
  private var typeSuccessMaps: [TypeResultMapping] = []
  
  static let requiredFieldNotificationName = NSNotification.Name(rawValue: "requiredFieldNotificationName")
  
  init() {
    NotificationCenter.default.addObserver(self,
        selector: #selector(requiredFieldNotificationTriggered(sender:)),
        name: ValidationCenter.requiredFieldNotificationName, object: nil)
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  @objc private func requiredFieldNotificationTriggered(sender: Notification?) {
    if let presenter = sender?.object as? UIViewController,
      presenter.presentedViewController == nil {
      let alert = UIAlertController(title: "Please complete all required fields",
                                    message: "", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "Ok", style: .default) { alert in

      }
      alert.addAction(okAction)
      let alertWindow = UIWindow(frame: UIScreen.main.bounds)
      alertWindow.rootViewController = UIViewController()
      alertWindow.windowLevel = UIWindowLevelAlert + 1;
      alertWindow.makeKeyAndVisible()
      alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
      // REMOVE
//      presenter.present(alert, animated: true, completion: nil)
    }
  }
  
  func attach(view: UIView, validators: Validator...) {
    var validationsArray: [Validator] = []
    for validation in validators {
      validationsArray.append(validation)
    }
    attach(view: view, validatorArray: validationsArray)
  }
  
  func attach(view: UIView, validatorArray: [Validator]) {
    if var validators: [Validator] = viewsToValidate[view] {
      validators.append(contentsOf: validatorArray)
      viewsToValidate.updateValue(validators, forKey: view)
    } else {
      viewsToValidate.updateValue(validatorArray, forKey: view)
    }
  }

  func viewClassToValueMapping(viewType: AnyClass, mappingFunc: @escaping (UIView) -> AnyObject?) {
    let typeMap: TypeMapping = (viewType: viewType, mappingFunc: mappingFunc)
    typeMaps.append(typeMap)
  }
  
  func viewClassToFailureMapping(viewType: AnyClass, mappingFunc: @escaping (UIView, [ValidationResult]) -> ()) {
    let typeFailureMap: TypeResultMapping = (viewType: viewType, mappingFunc: mappingFunc)
    typeFailureMaps.append(typeFailureMap)
  }
  
  func viewClassToSuccessMapping(viewType: AnyClass, mappingFunc: @escaping (UIView, [ValidationResult]) -> ()) {
    let typeSuccessMap: TypeResultMapping = (viewType: viewType, mappingFunc: mappingFunc)
    typeSuccessMaps.append(typeSuccessMap)
  }
  
  func check(viewsToCheck views: [UIView]? = nil, silent: Bool = false) -> (passed: [ValidationResult], failed: [ValidationResult]) {
    var passedResults: [ValidationResult] = []
    var failedResults: [ValidationResult] = []
    for (view, validators) in viewsToValidate {
      if views != nil {
        if views!.contains(view) == false {
          continue
        }
      }
      var viewFailedOneOrMoreValidations: Bool = false
      for validator: Validator in validators {
        var validationResult: ValidationResult = ValidationResult()
        
        // Check if we can map the view to a value
        var value: AnyObject? = nil
        var customTypeMapping: TypeMapping? = nil
        for typeMap in typeMaps {
          let checkType: AnyClass = typeMap.viewType
          if type(of: view) == checkType {
            customTypeMapping = typeMap
            break
          }
        }
        
        if customTypeMapping != nil && type(of: view) == customTypeMapping!.viewType {
          value = customTypeMapping!.mappingFunc(view)
        } else if type(of: view) == UITextField.self {
          value = (view as! UITextField).text as AnyObject?
        }
        
        // Get results from the Validator, and create a ValidationResult
        let validatorResult: ValidatorResult = validator.validate(items: [value])
        validationResult.validatorResult = validatorResult
        validationResult.view = view
        validationResult.validator = validator
        
        // Check if the result passed or failed
        var passed: Bool = true
        for resultVal: Int in validationResult.validatorResult.results {
          if resultVal < 0 {
            passed = false
          }
        }
        if passed {
          passedResults.append(validationResult)
        } else {
          viewFailedOneOrMoreValidations = true
          failedResults.append(validationResult)
          // Call the failure mapping function if there is one
          for typeFailureMap in typeFailureMaps {
            let checkType: AnyClass = typeFailureMap.viewType
            if type(of: view) == checkType && silent == false {
              typeFailureMap.mappingFunc(view, [validationResult])
            }
          }
        }
      }
      if viewFailedOneOrMoreValidations == false {
        // Call the success mapping function if there is one
        for typeSuccessMap in typeSuccessMaps {
          let checkType: AnyClass = typeSuccessMap.viewType
          if type(of: view) == checkType && silent == false {
            typeSuccessMap.mappingFunc(view, passedResults)
          }
        }
      }
    }
    return (passedResults, failedResults)
  }
  
  func isValid(viewsToValidate views: [UIView]? = nil, silent: Bool = false) -> Bool {
    let validationResults: (passed: [ValidationResult], failed: [ValidationResult]) = check(viewsToCheck: views, silent: silent)
    if validationResults.failed.count > 0 {
      return false
    }
    return true
  }
}
