//
//  HTTPMethodTests.swift
//  OtpSecureTests
//
//  Created by Diego Sepúlveda Blanco on 13/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import XCTest
@testable import OtpSecure

class HTTPMethodTests: XCTestCase {
    
    func testDescription() {
        let map: [String : HTTPMethod] = [
            "GET": .GET,
            "POST": .POST,
            "PUT": .PUT,
            "PATCH": .PATCH,
            "DELETE": .DELETE
        ]
        map.forEach { (method) in
            XCTAssertEqual(method.key, method.value.description)
        }
    }
    
    func testHasBody() {
        XCTAssertFalse(HTTPMethod.GET.hasBody)
        
        XCTAssertTrue(HTTPMethod.POST.hasBody)
        XCTAssertTrue(HTTPMethod.PUT.hasBody)
        XCTAssertTrue(HTTPMethod.PATCH.hasBody)
        XCTAssertTrue(HTTPMethod.DELETE.hasBody)
    }
    
}

