//
//  BiometricAuthentication.swift
//  FaceId
//
//  Created by Vitaliy on 05.10.2020.
//  Copyright © 2020 Vitaliy. All rights reserved.
//

import LocalAuthentication

class BiometricAuthentication {
	private let context = LAContext()
	
	var biometricType: BiometricType {
		guard canEvaluatePolicy() else { return .notAvailable }
		switch context.biometryType {
		case .none:
			return .notAvailable
		case .touchID:
			return .touchID
		case .faceID:
			return .faceID
		@unknown default:
			return .notAvailable
		}
	}
	
	func canEvaluatePolicy() -> Bool {
		if #available(iOS 11.0, *) {
			return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
		}
		return false
	}
	
	func authenticateUser(completion: @escaping (BiometricError?) -> Void) {
		guard biometricType != .notAvailable else {
			completion(.biometryNotAvailable)
			return
		}
		
		context.localizedFallbackTitle = "Enter password"
		
		context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
		   localizedReason: "authentication failed") { (success, evaluateError) in
			var error: BiometricError?
			
			if !success {
				switch evaluateError {
				case LAError.authenticationFailed?:
					error = .authenticationFailed
				case LAError.userCancel?:
					error = .pressedCancel
				case LAError.userFallback?:
					error = .pressedPassword
				case LAError.biometryNotAvailable?:
					error = .biometryNotAvailable
				case LAError.biometryNotEnrolled?:
					error = .biometryNotEnrolled
				case LAError.biometryLockout?:
					error = .biometryLockout
				default:
					error = .unknown
				}
			}
			
			DispatchQueue.main.async {
				completion(error)
			}
		}
	}
}
