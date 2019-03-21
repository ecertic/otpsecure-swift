//
//  SessionTests.swift
//  OtpSecureTests
//
//  Created by Diego Sepúlveda Blanco on 13/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import XCTest
@testable import OtpSecure

class SessionTests: XCTestCase {
    
    func testSession() {
        let session = Session()
        let token = OperationInfo.Post(token: "test")
        session.send(request: token)
        XCTAssertTrue(true)
    }
    
}
