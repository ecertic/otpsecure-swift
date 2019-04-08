# OtpSecure Swift SDK

[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/ecertic/otpsecure-swift/master/LICENSE)
![swift5](https://img.shields.io/badge/swift-v5.0-green.svg)
![macOS](https://img.shields.io/badge/os-macOS-blue.svg)
![iOS](https://img.shields.io/badge/os-iOS-blue.svg)
[![GitHub release](https://img.shields.io/github/release/ecertic/otpsecure-swift.svg)](https://github.com/ecertic/otpsecure-swift/releases)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

This Swift library allows you to quickly and easily validate otps sent through OtpSecure Service using Swift.

## Setup

### Prerequisites

Things needed to install the software:

 - Swift 5.0
 - Xcode 10.2
 
 ## Installation

### With Cocoapods

Add the following pod to your Podfile:

```ruby
pod 'OtpSecure', '2.0.0'
```

### With Carthage

Add the following statement in your Cartfile:

```ruby
github "ecertic/otpsecure-swift" "2.0.0"
```

 ## Usage

In order to use the library, developers must use `OtpSecure` module which exposes functions needed to 
retrieve operation info by token and to validate tokens against otps.

```swift
	import OtpSecure
```

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

This repository includes one sample app inside `Examples` folder. To run the sample project execute the following command:

### With Cocoapods

```ruby
cd /path/to/otpsecure-swift/Examples/OtpSecureShowcase && pod install
```

### With Carthage
```ruby
cd /path/to/otpsecure-swift/Examples/OtpSecureShowcase && carthage update
```

Then open the file `OtpSecureShowcase.xcworkspace` and run the project with the desired emulator.

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://raw.githubusercontent.com/ecertic/otpsecure-swift/master/LICENSE) file for details.

