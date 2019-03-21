//
//  XCTFailUnknownError.swift
//  OtpSecureTests
//
//  Created by Diego Sepúlveda Blanco on 13/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import XCTest

func XCTFailUnknownError(_ error: Error) {
    XCTFail("An unexpected error was thrown: \(error)")
}
