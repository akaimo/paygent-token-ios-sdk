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
    
    open class func createToken(handler: @escaping (Bool) -> Void = { _ in }) {
//        var request = URLRequest(url: URL(string: "https://token.paygent.co.jp/n/token/request")!)
        var request = URLRequest(url: URL(string: "https://sandbox.paygent.co.jp/n/token/request")!)
        let postString = ""

        request.setValue("text/plain;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let response = String(data: data!, encoding: .utf8)!
            print(response)
            handler(true)
        }
        task.resume()
    }
    
}
