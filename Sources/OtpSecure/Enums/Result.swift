//
//  Result.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 14/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

/// Generic enum used to manage the results of the sdk operations
/// - The `success` enum will be called when the operation finishes successfully.
///   In this case the operation will return the model with which it was typed in the instantiation
/// - The `failure` enum will be called when the operation finishes erroneously
public enum Result<T: Decodable> {
    case success(T), failure(Error)
}
