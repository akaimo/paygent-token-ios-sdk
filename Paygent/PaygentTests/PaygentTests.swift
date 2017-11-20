//
//  PaygentTests.swift
//  PaygentTests
//
//  Created by Shuhei Kawaguchi on 2017/11/17.
//  Copyright © 2017年 Shuhei Kawaguchi. All rights reserved.
//

import XCTest
@testable import Paygent

class PaygentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        struct TestRequest: TokenRequest {
            var merchantID: String {
                return ""
            }
            var tokenGenerateKey: String {
                return ""
            }
            var cardNumber: String {
                return "4900123412341234"
            }
            var cardExpireYear: String {
                return "18"
            }
            var cardExpireMonth: String {
                return "10"
            }
            var cardCVC: String {
                return "000"
            }
            var cardName: String {
                return "test"
            }
            var isSandbox: Bool {
                return true
            }
        }
        
        let request = TestRequest()
        
        let imageDownloadExpectation: XCTestExpectation? = self.expectation(description: "paygent access")
        Paygent.createToken(request) { response in
            print(response)
            imageDownloadExpectation?.fulfill()
        }
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
