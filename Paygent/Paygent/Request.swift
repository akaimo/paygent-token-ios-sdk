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
    
    func createBodyParameter() -> String
}

public protocol TokenRequest: Request {
    var cardNumber: String { get }
    var cardExpireYear: String { get }
    var cardExpireMonth: String { get }
    var cardCVC: String { get }
    var cardName: String { get }
}

public protocol CVCTokenRequest: Request {
    var cvcOnlyFlg: Int { get }
}
