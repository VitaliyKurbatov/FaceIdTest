//
//  UIButton.swift
//  FaceId
//
//  Created by Vitaliy on 06.10.2020.
//  Copyright © 2020 Vitaliy. All rights reserved.
//

import UIKit

extension UIButton {
	func drawLightShadow() {
		layer.shadowColor = UIColor.darkGray.cgColor
		layer.shadowOffset = CGSize(width: 0.0, height: 2)
		layer.shadowOpacity = 0.4
		layer.shadowRadius = 2
	}
}
