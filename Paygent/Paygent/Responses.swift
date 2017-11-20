//
//  Responses.swift
//  Paygent
//
//  Created by Shuhei Kawaguchi on 2017/11/20.
//  Copyright © 2017年 Shuhei Kawaguchi. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(Error)
}

public struct CreateTokenResponse: Codable {
    let result: String
    let tokenizedCard: TokenizedCard
    
    enum CodingKeys: String, CodingKey {
        case result
        case tokenizedCard = "tokenizedCardObject"
    }
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

public struct CreateCVCTokenResponse: Codable {
    let result: String
    let tokenizedCVC: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case tokenizedCVC = "tokenizedCardObject"
    }
}

public struct TokenizedCVC: Codable {
    let token: String
    let validUntil: String
    
    enum CodingKeys: String, CodingKey {
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
}
