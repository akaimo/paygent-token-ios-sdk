//
//  Responses.swift
//  Paygent
//
//  Created by Shuhei Kawaguchi on 2017/11/20.
//  Copyright © 2017年 Shuhei Kawaguchi. All rights reserved.
//

import Foundation

public enum Response {
    case success(SuccessResponse)
    case failure(FailureResponse)
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

public struct FailureResponse {
    let result: String
}
