//
//  SignupWebServiceTests.swift
//  MyApp_TDDExampleTests
//
//  Created by NoelPoo on 3/11/20.
//

import XCTest
@testable import MyApp_TDDCompleted

class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
//MARK: - unit test with REAL HTTP requests
    func testSignup_givenSuccessfulResponse_returnSuccess() {
        
        let sut = SignupWebService(urlString: "http://appsdeveloperblog.com:8080/signup-mock-service/users")
        let signupFormModel = SignupFormRequestModel(firstName: "Noel", lastName: "poo", email: "noel@poo.com", password:"12345678")
        let expectation = self.expectation(description: "Sign up web service response expectation")

        sut.signup(withForm: signupFormModel) { (signupResponseModel, error) in
            //{"status": "ok"}
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)

        // for unit testing Asynchronous operations, these operations do not execute directly with current flow of code. might be running on a different thread, delegate method or in a callback.
        //1. create one or more expectations within the test
        //2. fulfull those expectations when the asynchronous operations are completed successfully
        //3. test method to wait until all expectations are fulfilled or until timeout.
    }
    
//MARK: - unit test with MOCK http request
    func testSignup_givenSuccessfulMockedResponse_returnSuccess() {
        //Arrange
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        //Act
        let sut = SignupWebService(urlString: "http://appsdeveloperblog.com:8080/signup-mock-service/users", urlSession: urlSession)
        let signupFormModel = SignupFormRequestModel(firstName: "Noel", lastName: "poo", email: "noel@poo.com", password:"167abc")
        let expectation = self.expectation(description: "Sign up web service response expectation")

        sut.signup(withForm: signupFormModel) { (signupResponseModel, error) in
            
            //Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)
    }
}


