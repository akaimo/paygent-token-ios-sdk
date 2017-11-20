//
//  Paygent.swift
//  Paygent
//
//  Created by Shuhei Kawaguchi on 2017/11/17.
//  Copyright © 2017年 Shuhei Kawaguchi. All rights reserved.
//

import Foundation

open class Paygent {
    private static let privateShared = Paygent()
    
    open class var shared: Paygent {
        return privateShared
    }
    
    @discardableResult
    open class func createToken(_ request: Request, handler: @escaping (Result) -> Void = { _ in }) -> URLSessionDataTask {
        var urlRequest = URLRequest(url: URL(string: request.url)!)

        urlRequest.setValue("text/plain;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = request.createBodyParameter().data(using: .utf8)

        let task = URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            let result: Result
            
            switch (data, urlResponse, error) {
            case (_, _, let error?):
                result = .failure(SessionTaskError.connectionError(error))
                
            case (let data?, let urlResponse as HTTPURLResponse, _):
                guard 200..<300 ~= urlResponse.statusCode else {
                    result = .failure(ResponseError.unacceptableStatusCode(urlResponse.statusCode))
                    break
                }
                
                if let response = try? JSONDecoder().decode(SuccessResponse.self, from: data) {
                    result = .success(response)
                } else if let response = try? JSONDecoder().decode(PagentErrorResponse.self, from: data) {
                    result = .failure(ResponseError.paygentErrorCode(response.result))
                } else if let response = String(data: data, encoding: .utf8) {
                    result =  .failure(ResponseError.unexpectedObject(response))
                } else {
                    // FIXME: change error
                    result =  .failure(ResponseError.unexpectedObject(data))
                }
                
                
            default:
                result = .failure(ResponseError.nonHTTPURLResponse(urlResponse))
            }
            
            handler(result)
        }
        
        task.resume()
        return task
    }
    
}
