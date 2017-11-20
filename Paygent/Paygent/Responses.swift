//
//  Responses.swift
//  Paygent
//
//  Created by Shuhei Kawaguchi on 2017/11/20.
//  Copyright © 2017年 Shuhei Kawaguchi. All rights reserved.
//

import Foundation

public enum Result {
    case success(SuccessResponse)
    case failure(Error)
}

public struct SuccessResponse: Codable {
    let result: String
    let tokenizedCardObject: TokenizedCard
}

public struct TokenizedCard: Codable {
    let maskedCardNumber: String
    let token: String
    let validUntil: String
    
    enum CodingKeys: String, CodingKey {
        case maskedCardNumber = "masked_card_number"
        case token
        case validUntil = "valid_until"
    }
}

public struct PagentErrorResponse: Codable {
    let result: String
}

public enum ResponseError: Error {
    case nonHTTPURLResponse(URLResponse?)
    case unacceptableStatusCode(Int)
    case unexpectedObject(Any)
    case paygentErrorCode(String)
}

public enum SessionTaskError: Error {
    case connectionError(Error)
    case responseError(Error)
}
