//
//  Logger.swift
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


// SETUP/INSTRUCTIONS/NOTES:
//
//   * You can conditionally disable log levels by setting the log level
//     yourself
//

import Foundation

public enum LogLevel : Int {
	
	case debug   = 100
	case todo    = 101
	case info    = 200
	case warning = 300
	case error   = 400
	case wtf     = 500
	
	public func simpleDescription() -> String {
		switch self {
		case .debug:
			return "debug"
		case .todo:
			return "todo"
		case .info:
			return "info"
		case .warning:
			return "warning"
		case .error:
			return "error"
		case .wtf:
			return "wtf"
		}
	}
	
	public func label() -> String {
		switch self {
		case .debug:
			return "[DEBUG]"
		case .todo:
			return " [TODO]"
		case .info:
			return " [INFO]"
		case .warning:
			return " [WARN]"
		case .error:
			return "[ERROR]"
		case .wtf:
			return "  [WTF]"
		}
	}
}

open class Logger {
	
	private var minimumLevel: LogLevel = .debug
	private var printMethodName: Bool = true
	
	
	// MARK: - Static instance
	open class var logger: Logger {
		struct Singleton {
			static let instance = Logger()
		}
		return Singleton.instance;
	}
	
	
	// MARK: - Configuration
	open func setLogLevel(_ logLevel: LogLevel) {
		self.minimumLevel = logLevel
	}
	
	open func printMethodName(_ printFlag: Bool) {
		self.printMethodName = printFlag
	}
	
	
	// MARK: - Instance methods
	open func log<T>(_ logLevel: LogLevel, message: @autoclosure () -> T, _
		filename: String? = #file, line: Int? = #line,  function: String? = #function) {
		if (logLevel.rawValue >= self.minimumLevel.rawValue) {
			var logCurrentFile: String = "UNKNOWN"
			if filename != nil {
				let url: URL = URL(fileURLWithPath: filename!)
				logCurrentFile = url.lastPathComponent
			}
			var logMessage = ""
			logMessage += "\(logLevel.label()) "
			logMessage += "[\(logCurrentFile):\(line!)"
			if (self.printMethodName) {
				logMessage += "|\(function!)"
			}
			logMessage += "] "
			logMessage += "\(message())"
			
			Swift.print(logMessage)
		}
	}
	
	open func debug<T>(_ message: @autoclosure () -> T, _
		filename: String? = #file, line: Int? = #line,  function: String? = #function) {
		if self.minimumLevel == .debug {
			self.log(.debug, message: message, filename, line: line, function: function)
		}
	}
	
	open func info<T>(_ message: @autoclosure () -> T, _
		filename: String? = #file, line: Int? = #line,  function: String? = #function) {
		self.log(.info, message: message, filename, line: line, function: function)
	}
	
	open func warning<T>(_ message: @autoclosure () -> T, _
		filename: String? = #file, line: Int? = #line,  function: String? = #function) {
		self.log(.warning, message: message, filename, line: line, function: function)
	}
	
	open func error<T>(_ message: @autoclosure () -> T, _
		filename: String? = #file, line: Int? = #line,  function: String? = #function) {
		self.log(.error, message: message, filename, line: line, function: function)
	}
	
	open func wtf<T>(_ message: @autoclosure () -> T, _
		filename: String? = #file, line: Int? = #line,  function: String? = #function) {
		self.log(.wtf, message: message, filename, line: line, function: function)
	}
	
	open func print<T>(_ message: @autoclosure () -> T) {
		Swift.print(message())
	}
	
	
	// MARK: - Class methods
	open class func debug<T>(_ message: @autoclosure () -> T, _
		filename: String? = #file, line: Int? = #line,  function: String? = #function) {
		Logger.logger.log(.debug, message: message, filename, line: line, function: function)
	}
	
	open class func info<T>(_ message: @autoclosure () -> T, _
		filename: String? = #file, line: Int? = #line,  function: String? = #function) {
		Logger.logger.log(.info, message: message, filename, line: line, function: function)
	}
	
	open class func warning<T>(_ message: @autoclosure () -> T, _
		filename: String? = #file, line: Int? = #line,  function: String? = #function) {
		Logger.logger.log(.warning, message: message, filename, line: line, function: function)
	}
	
	open class func error<T>(_ message: @autoclosure () -> T, _
		filename: String? = #file, line: Int? = #line,  function: String? = #function) {
		Logger.logger.log(.error, message: message, filename, line: line, function: function)
	}
	
	open class func wtf<T>(_ message: @autoclosure () -> T, _
		filename: String? = #file, line: Int? = #line,  function: String? = #function) {
		Logger.logger.log(.wtf, message: message, filename, line: line, function: function)
	}
	
	open class func print<T>(_ message: @autoclosure () -> T) {
		Logger.logger.print(message)
	}
	
	
	// MARK: - Informational
	open class func appInfo() {
		Swift.print(" Build Information:")
		Swift.print("  • Project Configuration = \(AppInfo.currentBuildConfiguration())")
		Swift.print("  • App Version = \(AppInfo.infoValue(forKey: InfoKeys.VersionString)!)")
		Swift.print("  • Build # = \(AppInfo.infoValue(forKey: InfoKeys.BuildNumberString)!)")
		Swift.print("\n")
	}
	
	
	// MARK: - Fun Times
	open class func posse() {
		return posse("NYC")
	}
	open class func posse(_ city: String) {
		var out: String = "\n" +
			" ████ ████ ████ ████ █████\n" +
			" █  █ █  █ █    █    █    \n" +
			" ████ █  █  ██   ██  ███  \n" +
			" █    █  █    █    █ █    \n" +
		    " █    ████ ████ ████ █████\n\n"
		out += " The following is a Posse production\n http://goposse.com | \(city.uppercased())\n ----\n"
		Swift.print(out)
	}
}
