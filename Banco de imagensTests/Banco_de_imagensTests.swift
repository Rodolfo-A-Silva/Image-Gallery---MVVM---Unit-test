//
//  Banco_de_imagensTests.swift
//  Banco de imagensTests
//
//  Created by Reedy on 25/11/21.
//

import XCTest
@testable import Banco_de_imagens

class Banco_de_imagensTests: XCTestCase {
    
    private var resource: APIService!
    
    override func setUp() {
        super.setUp()
        resource = APIService()
    }
    
    func test_verification_not_nil_return(){
        let expectation = self.expectation(description: "waiting")
        resource.load(resource: ImagensModel.Get){ (loginResponse) in
            XCTAssertNotNil(loginResponse)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func test_verification_return_is_url(){
        let expectation = self.expectation(description: "waiting")
        resource.load(resource: ImagensModel.Get){ (loginResponse) in
            XCTAssertNotNil(loginResponse)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
   
}







