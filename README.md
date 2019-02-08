# paygent-token-ios-sdk
![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/PaygentTokenSDK.svg?style=flat)](http://cocoapods.org/pods/PaygentTokenSDK)
[![License](https://img.shields.io/cocoapods/l/PaygentTokenSDK.svg?style=flat)](http://cocoapods.org/pods/PaygentTokenSDK)
[![Platform](https://img.shields.io/cocoapods/p/PaygentTokenSDK.svg?style=flat)](http://cocoapods.org/pods/PaygentTokenSDK)  
This is not an official Paygent product.  

## Requirements
- Swift 3.0 or later
- iOS 8.0 or later


## Installation
#### [Carthage](https://github.com/Carthage/Carthage)
```
github "akaimo/paygent-ios-sdk" ~> 1.1.0
```

#### [CocoaPods](https://github.com/cocoapods/cocoapods)
```
pod 'PaygentTokenSDK', '~> 1.1.0'
```

## Usage
This can be used like [APIKit](https://github.com/ishkawa/APIKit)
```swift
extension PaygentTokenSDK.Request {
    var merchantID: String {
        return "marchant_id"
    }
    var tokenGenerateKey: String {
        return "token_generate_key"
    }
}

struct CardTokenRequest: PaygentTokenSDK.PaygentTokenRequest {
    var cardNumber: String
    var cardExpireYear: String
    var cardExpireMonth: String
    var cardCVC: String
    var cardName: String
    
    init(cardNumber: String, cardExpireYear: String, cardExpireMonth: String,
         cardCVC: String, cardName: String) {
        self.cardNumber = cardNumber
        self.cardExpireYear = cardExpireYear
        self.cardExpireMonth = cardExpireMonth
        self.cardCVC = cardCVC
        self.cardName = cardName
    }
}

let request = CardTokenRequest(cardNumber: "4900123412341234", cardExpireYear: "19",
                               cardExpireMonth: "10", cardCVC: "", cardName: "")
PaygentSession.send(request) { result in
    switch result {
    case .success(let response):
        // success code...
    case .failure(let error):
        // failure code...
    }
}
```
