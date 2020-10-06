//
//  ViewController.swift
//  FaceId
//
//  Created by Vitaliy on 05.10.2020.
//  Copyright © 2020 Vitaliy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet var authView: AuthView!

	@IBAction func authenticateButtonClick(_ sender: UIButton) {
		BiometricAuthentication().authenticateUser { error in
			self.authView.setAuthResult(error)
		}
	}
}
