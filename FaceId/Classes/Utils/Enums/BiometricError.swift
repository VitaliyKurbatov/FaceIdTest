//
//  BiometricError.swift
//  FaceId
//
//  Created by Vitaliy on 06.10.2020.
//  Copyright © 2020 Vitaliy. All rights reserved.
//

enum BiometricError {
	case biometryNotAvailable
	case biometryNotEnrolled
	case biometryLockout
	case authenticationFailed
	case pressedPassword
	case pressedCancel
	case unknown
	
	var localizedDescription: String {
		switch self {
		case .biometryNotAvailable:
			return "Face ID/Touch ID is not available"
		case .biometryNotEnrolled:
			return "Face ID/Touch ID is not set up"
		case .biometryLockout:
			return "Face ID/Touch ID is locked"
		case .authenticationFailed:
			return "There was a problem verifying your identity"
		case .pressedPassword:
			return "User pressed password"
		case .pressedCancel:
			return "User pressed cancel"
		case .unknown:
			return "Face ID/Touch ID may not be configured"
		}
	}
}
