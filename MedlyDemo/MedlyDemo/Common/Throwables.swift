//
//  Throwables.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/7/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

enum PersistenceError: Error {
  case readFailed
  case saveFailed
  case deleteFailed
}
