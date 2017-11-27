//
//  Request.swift
//  Paygent
//
//  Created by Shuhei Kawaguchi on 2017/11/17.
//  Copyright © 2017年 Shuhei Kawaguchi. All rights reserved.
//

import Foundation

public protocol Request {
    associatedtype Response: Codable
    
    var merchantID: String { get }
    var tokenGenerateKey: String { get }
    var isSandbox: Bool { get }
    var url: String { get }
    
    func createBodyParameter() -> String
}

public extension Request {
    var isSandbox: Bool {
        return false
    }
    
    var url: String {
        if isSandbox {
            return "https://sandbox.paygent.co.jp/n/token/request"
        } else {
            return "https://token.paygent.co.jp/n/token/request"
        }
    }
}



public protocol PaygentTokenRequest: Request {
    var cardNumber: String { get set }
    var cardExpireYear: String { get set }
    var cardExpireMonth: String { get set }
    var cardCVC: String { get set }
    var cardName: String { get set }
}

public extension PaygentTokenRequest {
    typealias Response = PaygentCardTokenResponse
    
    func createBodyParameter() -> String {
        return "merchant_id=" + merchantID + "&token_generate_key=" + tokenGenerateKey + "&card_number=" + cardNumber + "&card_expire_year=" + cardExpireYear + "&card_expire_month=" + cardExpireMonth + "&card_cvc=" + cardCVC + "&card_name=" + cardName
    }
}



public protocol PaygentCVCTokenRequest: Request {
    var cardCVC: String { get set }
    var cvcOnlyFlg: String { get set }
}

public extension PaygentCVCTokenRequest {
    typealias Response = PaygentCVCTokenResponse
    
    func createBodyParameter() -> String {
        return "merchant_id=" + merchantID + "&token_generate_key=" + tokenGenerateKey + "&card_cvc=" + cardCVC + "&cvc_only_flg=" + cvcOnlyFlg
    }
}
