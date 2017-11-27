//
//  Errors.swift
//  PaygentTokenSDK
//
//  Created by akaimo on 2017/11/27.
//  Copyright © 2017 Shuhei Kawaguchi. All rights reserved.
//

import Foundation


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
