//
//  OperationInfo.Post.Test.swift
//  OtpSecureTests
//
//  Created by Diego Sepúlveda Blanco on 14/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import XCTest
@testable import OtpSecure

class OperationInfoPostTest: XCTestCase {

    func testRetrieveOperationInfoOK() {
        
        // Create an expectation for a background request.
        let expectation = XCTestExpectation(description: "Retrieve operation information")

        let operationInfo = OperationInfo.Post(token: TestConstants.Token.ValidToken)
        let session = Session()
        
        session.send(request: operationInfo, completionHandler: {
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
    
    func testRetrieveOperationInfoWithInvalidToken() {
        
        // Create an expectation for a background request.
        let expectation = XCTestExpectation(description: "Retrieve operation information")

        let operationInfo = OperationInfo.Post(token: TestConstants.Token.InvalidToken)
        let session = Session()
    
        session.send(request: operationInfo, completionHandler: {
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
