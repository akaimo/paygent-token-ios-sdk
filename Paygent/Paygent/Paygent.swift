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
    
    open class func createToken(_ request: Request, handler: @escaping (Bool) -> Void = { _ in }) {
        var urlRequest = URLRequest(url: URL(string: request.url)!)

        urlRequest.setValue("text/plain;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = request.createBodyParameter().data(using: .utf8)

        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let response = String(data: data!, encoding: .utf8)!
            print(response)
            handler(true)
        }
        task.resume()
    }
    
}
