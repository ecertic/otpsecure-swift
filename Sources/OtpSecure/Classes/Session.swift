//
//  Session.swift
//  OtpSecure
//
//  Created by Diego Sepúlveda Blanco on 12/03/2019.
//  Copyright © 2019 Ecertic. All rights reserved.
//

import Foundation

/// The `Session` class is used to faciliate the HTTP request to the Otpsecure
/// API endpoints.  When starting out, you'll want to configure `Session` with
/// your authentication information, whether that be credentials or an API Key.
/// A class conforming to the `Resource` protocol is then used to provide
/// information about the desired API call.
///
/// You can also call the `sharedInstance` property of `Session` to get a
/// singleton instance.  This will allow you to configure the singleton once,
/// and continually reuse it later without the need to re-configure it.
class Session {
    
    // MARK: - Properties
    //=========================================================================
    
    /// The `URLSession` to make the HTTPRequests with.
    let urlSession = URLSession.shared

    // MARK: - Initialization
    //=========================================================================
    
    /// A shared singleton instance of SGSession.  Using the shared instance
    /// allows you to configure it once with the desired authentication method,
    /// and then continually reuse it without the need for re-configuration.
    public static let shared: Session = Session()
    
    
    /// Default initializer.
    public init() {}
    
    // MARK: - Methods
    //=========================================================================
    
    /// Makes the HTTP request with the given `Request` object.
    ///
    /// - Parameters:
    ///   - request:            The `Request` instance to send.
    ///   - completionHandler:  A completion block that will be called after the
    ///                         API call completes.
    open func send<ModelType>(request: Request<ModelType>, completionHandler: @escaping (Response<ModelType>?) -> Void = { _ in }) {
        
        var payload: URLRequest
        
        do {
            try request.validate()
        
            // Get the NSURLRequest
            payload = try request.generateUrlRequest()
            payload.addValue("otpsecure/\(Constants.API.Version);swift", forHTTPHeaderField: "User-Agent")
            
        } catch let error {
            let resp = Response<ModelType>(data: nil, response: nil, error: error, decodingStrategy: request.decodingStrategy)
            return completionHandler(resp)
        }
        
        // Make the HTTP request
        let task = self.urlSession.dataTask(with: payload) { (data, response, error) in
            let resp = Response<ModelType>(data: data, response: response, error: error, decodingStrategy: request.decodingStrategy)
            completionHandler(resp)
        }
        task.resume()
    }
}
