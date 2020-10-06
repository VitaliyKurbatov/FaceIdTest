//
//  AuthView.swift
//  FaceId
//
//  Created by Vitaliy on 06.10.2020.
//  Copyright © 2020 Vitaliy. All rights reserved.
//

import UIKit

class AuthView: UIView {
	@IBOutlet weak var label: UILabel! {
		didSet {
			label.isHidden = true
			label.font = UIFont(name: "TimesNewRomanPSMT", size: 23)
		}
	}
	@IBOutlet weak var button: UIButton! {
		didSet {
			button.setTitle("Authenticate me", for: .normal)
			button.setTitleColor(.white, for: .normal)
			button.backgroundColor = .systemOrange
			button.layer.cornerRadius = 8
			button.drawLightShadow()
		}
	}
	
	func setAuthResult(_ error: BiometricError?) {
		label.isHidden = false
		button.isUserInteractionEnabled = false
		
		if let error = error {
			label.text = error.localizedDescription
		} else {
			label.text = "Success"
		}
		
		UIView.animate(withDuration: 0.5, delay: 2, options: .allowAnimatedContent) { [weak self] in
			self?.label.alpha = 0
		} completion: { _ in
			self.label.isHidden = true
			self.label.alpha = 1
			self.button.isUserInteractionEnabled = true
		}
	}
}
