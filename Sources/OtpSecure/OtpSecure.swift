//
//  OtpSecure.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 07/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

/// The `OtpSecure` class is the main SDK class through which requests are made to the OtpSecure API
public class OtpSecure: NSObject {
    
    /// Retrieve an existing OperationInfo from the OtpSecure API.
    /// - Parameters:
    ///   - token: the token id of the operation.
    ///   - completionHandler: the function that will be invoked once the call to the OtpSecure API ends
    public class func retrieveOperationInfoByToken(token: String, completionHandler: @escaping (Result<OperationInfo, Error>) -> Void = { _ in }) {
        let operationInfo = OperationInfo.Post(token: token)
        let session = Session()

        session.send(request: operationInfo, completionHandler: {
            response in

            if let e = response?.error {
                return completionHandler(.failure(e))
            }
            
            guard let httpResponse = response?.urlResponse as? HTTPURLResponse else {
                return completionHandler(.failure(Exception.OTPSecure.unknownError))
            }
            
            if(httpResponse.statusCode == 400) {
                return completionHandler(.failure(Exception.OTPSecure.notSent))
            } else if (httpResponse.statusCode == 404) {
                return completionHandler(.failure(Exception.OTPSecure.notFound))
            }
            
            guard let operationInfo = response?.model else {
                return completionHandler(.failure(Exception.OTPSecure.notFound))
            }

            return completionHandler(.success(operationInfo))
        })
    }

    /// Validate an existing operation by sending the user provided otp to the OtpSecure API.
    /// - Parameters:
    ///   - token: the token id of the operation.
    ///   - otp: the user provided otp
    ///   - completionHandler: the function that will be invoked once the call to the OtpSecure API ends
    public class func validateToken(token: String, otp: String, completionHandler: @escaping (Result<Validation, Error>) -> Void = { _ in }) {
        
        DispatchQueue.global().async {
            let validatePostOperation = Validation.Post(token: token, otp: otp, env: Environment.build())
            let session = Session()

            session.send(request: validatePostOperation, completionHandler: {
                response in
                
                if let e = response?.error {
                    return completionHandler(.failure(e))
                }
                
                guard let httpResponse = response?.urlResponse as? HTTPURLResponse else {
                    return completionHandler(.failure(Exception.OTPSecure.unknownError))
                }
                
                if(httpResponse.statusCode == 400) {
                    return completionHandler(.failure(Exception.OTPSecure.notSent))
                } else if (httpResponse.statusCode == 404) {
                    return completionHandler(.failure(Exception.OTPSecure.notFound))
                }
                
                guard let validationRetrieved = response?.model else {
                    return completionHandler(.failure(Exception.OTPSecure.notFound))
                }
                
                return completionHandler(.success(validationRetrieved))
            })
        }
    }

}
