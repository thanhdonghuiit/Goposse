//
//  UIImage+PosseExt.swift
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
import CoreGraphics

public extension UIImage {
	
	// MARK: Initializers
	convenience init?(named name: String, tintColor: UIColor) {
		if let image: UIImage = UIImage(named: name) {
			if let tintedImage: UIImage = image.tintImage(color: tintColor) {
				self.init(cgImage: tintedImage.cgImage!)
			} else {
				self.init()
			}
		} else {
			self.init()
		}
	}
	
	// MARK: - Tint / color functions
	public func tintImage(color: UIColor, alpha: Double = 1.0) -> UIImage? {
		let imageRect: CGRect = CGRect(x: 0.0, y: 0.0, width: self.size.width, height: self.size.height)
		UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
		color.setFill()
		UIRectFill(imageRect)
		self.draw(in: imageRect, blendMode: CGBlendMode.destinationIn, alpha: CGFloat(alpha))
		let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image
	}
	
	
	// MARK: - Scaling functions
	public func scaleImage(longestSide: Double, scaleUp: Bool = true) -> UIImage? {
		let imageSize: CGSize = self.size
		let maxSide: Double = fmax(Double(imageSize.width), Double(imageSize.height))
		let scaleFactor: Double = longestSide / maxSide
		if (!scaleUp && scaleFactor > 1.0) {
			return self
		} else {
			return self.scaleImage(percentage: scaleFactor)
		}
	}
	
	public func scaleImage(percentage: Double) -> UIImage? {
		var imageSize: CGSize = self.size
		let cgPercentage = CGFloat(percentage)
		imageSize.width *= cgPercentage
		imageSize.height *= cgPercentage
		return scaleImage(size: imageSize, scaleUp: true)
	}
	
	public func scaleImage(size: CGSize, scaleUp: Bool = true) -> UIImage? {
		let imageSize: CGSize = self.size
		if size.equalTo(CGSize.zero) {
			return self
		}
		if !scaleUp && (size.width > imageSize.width || size.height > imageSize.height) {
			return self
		} else {
			UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
			let cgImage = self.cgImage
			var scaledImage: UIImage? = UIImage(cgImage: cgImage!, scale: 0.0, orientation: self.imageOrientation)
			if scaledImage != nil {
				scaledImage!.draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
				scaledImage = UIGraphicsGetImageFromCurrentImageContext()
				UIGraphicsEndImageContext()
				return scaledImage
			}
		}
		return nil
	}
}
