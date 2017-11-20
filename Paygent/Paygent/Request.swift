//
//  Request.swift
//  Paygent
//
//  Created by Shuhei Kawaguchi on 2017/11/17.
//  Copyright © 2017年 Shuhei Kawaguchi. All rights reserved.
//

import Foundation

public protocol Request {
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

public protocol TokenRequest: Request {
    var cardNumber: String { get }
    var cardExpireYear: String { get }
    var cardExpireMonth: String { get }
    var cardCVC: String { get }
    var cardName: String { get }
}

public extension TokenRequest {
    func createBodyParameter() -> String {
        return "merchant_id=" + merchantID + "&token_generate_key=" + tokenGenerateKey + "&card_number=" + cardNumber + "&card_expire_year=" + cardExpireYear + "&card_expire_month=" + cardExpireMonth + "&card_cvc=" + cardCVC + "&card_name=" + cardName
    }
}

public protocol CVCTokenRequest: Request {
    var cvcOnlyFlg: String { get }
}

public extension CVCTokenRequest {
    func createBodyParameter() -> String {
        return "merchant_id=" + merchantID + "&token_generate_key=" + tokenGenerateKey + "&card_cvc=" + "&cvc_only_flg=" + cvcOnlyFlg
    }
}
