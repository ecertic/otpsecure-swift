//
//  Validate.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 11/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation


/// The `Validate` struct provides static methods for validating common
struct Validate {
    
    /// Takes a given input and regex pattern and returns a `Bool` indicating if
    /// there were any matches.
    ///
    /// - parameter input:      The `String` to search.
    /// - parameter pattern:    The regular expression pattern, expressed as a
    ///                         `String` to use.
    ///
    /// - returns: A `Bool` indicating if there were any matches.
    static func input(_ input: String, against pattern: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
            else { return false }
        let range = input.startIndex..<input.endIndex
        return regex.numberOfMatches(in: input, range: NSRange(range, in: input)) > 0
    }
    
}

extension Validate {
    
    /// Validates that a string does contain CLRF characters.
    static func noCLRF(in input: String) -> Bool {
        return self.input(input, against: "^([^;,\\s]+)$")
    }
    
}
