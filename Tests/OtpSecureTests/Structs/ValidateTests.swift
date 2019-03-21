//
//  ValidateTests.swift
//  OtpSecureTests
//
//  Created by Diego Sepúlveda Blanco on 13/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import XCTest
@testable import OtpSecure

class ValidateTests: XCTestCase {
    
    func testInput() {
        let pass = Validate.input("Hello World", against: "World")
        let fail = Validate.input("Hello World", against: "Foo")
        XCTAssertTrue(pass)
        XCTAssertFalse(fail)
        
        let badPattern = Validate.input("(", against: "(")
        XCTAssertFalse(badPattern)
    }
    
    func testNoCLRF() {
        for input in ["foo", "foo/bar"] {
            XCTAssertTrue(Validate.noCLRF(in: input), "'\(input)' validates successfully")
        }
        for input in ["foo bar", "foo;bar", "foo,bar", ""] {
            XCTAssertFalse(Validate.noCLRF(in: input), "'\(input)' fails validation")
        }
    }
    
}
