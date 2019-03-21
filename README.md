# OtpSecure Swift SDK

![swift4.2](https://img.shields.io/badge/swift-v4.2-green.svg) ![macOS](https://img.shields.io/badge/os-macOS-blue.svg) ![iOS](https://img.shields.io/badge/os-iOS-blue.svg)

This Swift library allows you to quickly and easily validate otps sent through OtpSecure Service using Swift.

## Setup

### Prerequisites

What things you need to install the software:

 - Swift 4.2
 - Xcode 10.1
 
 ## Installation

### With Cocoapods

Add the following to your Podfile:

```ruby
pod 'Otpsecure', :git => 'https://github.com/ecertic/otpsecure-swift.git'
```

 ## Usage

In order to use the library, developers must use `OtpSecure` module which exposes functions needed to 
retrieve operation info by token and to validate tokens against otps.


### Using `OtpSecure.retrieveOperationInfoByToken`

You can use retrieve operationInfo by token as shown in the following snippet. Also, sample-app 
contains examples of how to use it.


```swift
	OtpSecure.retrieveOperationInfoByToken(token: "INSERT_YOUR_TOKEN_HERE", completionHandler: {
	    result in
	    
	    switch result {
	    case .success(let operationInfo):
	    	// Add your logic here
	    case .failure(let error):
	        // Handle the error here
	    }
	})
```

### Using `OtpSecure.validateToken`

You can validate a token against otp as shown in the following snippet. Sample-app contains examples
 of how to use it.

```swift
	OtpSecure.validateToken(token: "INSERT_YOUR_TOKEN_HERE", otp: "INSERT_THE_OTP_HERE", completionHandler: {
	    result in
	    
	    switch result {
	    case .success(let validation):
	    	// Add your logic here
	    case .failure(let error):
	        // Handle the error here
	    }
	})
```

## Sample app

This repository includes one sample app inside "Examples" folder.


## License

This project is licensed under the MIT License - see the LICENSE.md file for details

