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

public struct SuccessResponse {
    let result: String
}

public struct FailureResponse {
    let result: String
}
