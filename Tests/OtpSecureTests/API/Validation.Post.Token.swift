//
//  Validation.Post.Token.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 19/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import XCTest
@testable import OtpSecure

class ValidatePostTest: XCTestCase {
    
    func testValidateTokenOK() {
        
        // Create an expectation for a background request.
        let expectation = XCTestExpectation(description: "Validate token operation")

        let validatePostOperation = Validation.Post(token: TestConstants.Token.ValidToken, otp: TestConstants.Otp.InvalidOtp)
        let session = Session()
        
        session.send(request: validatePostOperation, completionHandler: {
            response in
            
            XCTAssertNotNil(response)
            XCTAssertNil(response!.error)
            XCTAssertNotNil(response!.model)
            XCTAssertNotNil(response!.urlResponse)
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
        })
        
        // Wait until the expectation is fulfilled, with a timeout of 3 seconds.
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testValidateTokenWithInvalidToken() {
        
        // Create an expectation for a background request.
        let expectation = XCTestExpectation(description: "Validate token operation")

        let validatePostOperation = Validation.Post(token: TestConstants.Token.InvalidToken, otp: TestConstants.Otp.InvalidOtp)
        let session = Session()
        
        session.send(request: validatePostOperation, completionHandler: {
            response in
            
            XCTAssertNotNil(response)
            XCTAssertNil(response!.error)
            XCTAssertNil(response!.model)
            XCTAssertNotNil(response!.urlResponse)
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
        })
        
        // Wait until the expectation is fulfilled, with a timeout of 3 seconds.
        wait(for: [expectation], timeout: 3.0)

    }
    
}
