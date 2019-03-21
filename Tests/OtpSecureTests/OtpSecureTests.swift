//
//  OtpSecureTests.swift
//  OtpSecureTests
//
//  Created by Diego Sepúlveda Blanco on 07/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import XCTest
@testable import OtpSecure

class OtpSecureTests: XCTestCase {}

// MARK: - retrieve token tests
extension OtpSecureTests {
    
    func testRetrieveOperationInfoByTokenOK() {
        // Create an expectation for a background request.
        let expectation = XCTestExpectation(description: "Retrieve token operation")
        
        OtpSecure.retrieveOperationInfoByToken(token: TestConstants.Token.ValidToken, completionHandler: {
            result in
            
            switch result {
            case .success(let token):
                XCTAssertNotNil(token)
                XCTAssertNotNil(token.uuid)
                XCTAssertNotNil(token.html)
                XCTAssertNotNil(token.status)
            case .failure(let error):
                XCTFailUnknownError(error)
            }
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
            
        })
        
        // Wait until the expectation is fulfilled, with a timeout of 3 seconds.
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testRetrieveOperationInfoByTokenWithInvalidToken() {
        // Create an expectation for a background request.
        let expectation = XCTestExpectation(description: "Retrieve token operation")
        
        OtpSecure.retrieveOperationInfoByToken(token: TestConstants.Token.InvalidToken, completionHandler: {
            result in
            
            switch result {
            case .success(_):
                XCTFail("Token should not be provided")
            case .failure(let error):
                XCTAssertEqual(error as? Exception.OTPSecure, Exception.OTPSecure.notFound)
            }
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
        })
        
        // Wait until the expectation is fulfilled, with a timeout of 3 seconds.
        wait(for: [expectation], timeout: 3.0)
    }
}

// MARK: - validate token tests
extension OtpSecureTests {
    
    func testValidateTokenOK() {
        // Create an expectation for a background request.
        let expectation = XCTestExpectation(description: "Validate token operation")
        
        OtpSecure.validateToken(token: TestConstants.Token.ValidToken, otp: TestConstants.Otp.InvalidOtp, completionHandler: {
            result in
            
            switch result {
            case .success(let validation):
                XCTAssertNotNil(validation)
                XCTAssertNotNil(validation.status)
                XCTAssertNotNil(validation.msg)
            case .failure(let error):
                XCTFailUnknownError(error)
            }
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
            
        })
        
        // Wait until the expectation is fulfilled, with a timeout of 3 seconds.
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testValidateTokenWithInvalidToken() {
        // Create an expectation for a background request.
        let expectation = XCTestExpectation(description: "Validate token operation")
        
        OtpSecure.validateToken(token: TestConstants.Token.InvalidToken, otp: TestConstants.Otp.InvalidOtp, completionHandler: {
            result in
            
            switch result {
            case .success(_):
                XCTFail("Validation should not be provided")
            case .failure(let error):
                XCTAssertEqual(error as? Exception.OTPSecure, Exception.OTPSecure.notFound)
            }
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
        })
        
        // Wait until the expectation is fulfilled, with a timeout of 3 seconds.
        wait(for: [expectation], timeout: 3.0)
    }
}
