//
//  Request.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 11/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//
import Foundation

/// The `Request` class should be inherited by any class that represents an API
/// request and sent through the `send` function in `Session`.
///
/// This class contains a `ModelType` generic, which is used to map the API
/// response to a specific model that conforms to `Codable`.
open class Request<ModelType : Decodable>: Validatable {
    
    // MARK: - Properties
    //=========================================================================
    
    /// The HTTP verb to use in the call.
    open var method: HTTPMethod
    
    /// The Content-Type of the call.
    open var contentType: ContentType
    
    /// The Accept header value.
    open var acceptType: ContentType = .json
    
    /// The full URL endpoint for the API call.
    open var endpoint: URLComponents?
    
    /// The decoding strategy.
    open var decodingStrategy: DecodingStrategy
    
    /// The encoding strategy.
    open var encodingStrategy: EncodingStrategy

    
    // MARK: - Initialization
    //=========================================================================
    
    /// Initializes the request.
    ///
    /// - Parameters:
    ///   - method:     The HTTP verb to use in the API call.
    ///   - contentType: The request content-type header.
    ///   - path:       The path portion of the API endpoint, such as
    ///                 "/token". The path *must* start with a forward
    ///                 slash (`/`).
    ///   - encoding:   The encoding stratagy used to encode the request data
    ///   - decoding:   The decoding strategy used to decode the response data
    public init(method: HTTPMethod, contentType: ContentType, path: String?, encoding: EncodingStrategy = EncodingStrategy(), decoding: DecodingStrategy = DecodingStrategy()) {
        self.method = method
        self.contentType = contentType
        var components = URLComponents(string: Constants.API.BaseUrl)
        if let p = path { components?.path = p }
        self.endpoint = components
        self.encodingStrategy = encoding
        self.decodingStrategy = decoding
    }
    
    
    // MARK: - Methods
    //=========================================================================
    /// Generates a `URLRequest` representation of the request.
    ///
    /// - Returns:  A `URLRequest` instance.
    /// - Throws:   Errors can be thrown if there was a problem encoding the
    ///             parameters or constructing the API URL endpoint.
    open func generateUrlRequest() throws -> URLRequest {
        guard let url = self.endpoint?.url else {
            throw Exception.Request.couldNotConstructUrlRequest
        }
        var req = URLRequest(url: url)
        req.httpMethod = self.method.rawValue
        req.addValue(self.contentType.description, forHTTPHeaderField: "Content-Type")
        req.addValue(self.acceptType.description, forHTTPHeaderField: "Accept")
        if self.method.hasBody, let enc = self as? AutoEncodable {
            req.httpBody = enc.encode()
        }
        return req
    }
    
    /// Validates that the content and accept types are valid.
    /// - Throws:   Some validation errors
    public func validate() throws {
        try self.contentType.validate()
        try self.acceptType.validate()
    }
    
}
