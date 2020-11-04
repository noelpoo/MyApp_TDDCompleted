//
//  SignUpFormValidatorTest.swift
//  MyApp_TDDExampleTests
//
//  Created by NoelPoo on 2/11/20.
//

import XCTest
@testable import MyApp_TDDCompleted

class SignUpFormValidatorTests: XCTestCase {
    
    struct Const {
        static let validFirstName: String = "Noel"
        static let invalidFirstName: String = ""
        
        static let validLastName: String = "Poo"
        static let invalidLastName: String = ""
        
        static let notShortFirstNameLength: Int = SignUpFormValidator.Const.minNameLength
        static let isShortFirstNameLength: Int = SignUpFormValidator.Const.minNameLength - 1
        
        static let notLongFirstNameLenght: Int = SignUpFormValidator.Const.maxNameLenght
        static let isLongFirstNameLength: Int = SignUpFormValidator.Const.maxNameLenght + 1
        
        static let invalidEmail1 = "hellohellohello.com"
        static let invalidEmail2 = "hello@hellohello"
        static let validEmail = "hello@helloworld.com"
    }
    
    func generateRandomNameByLenght(length: Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        var randomString: String = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }

        return randomString
    }
    
    var sut: SignUpFormValidator!
    static var setUpCount: Int = 0
    static var tearDownCount: Int = 0
    
    //method level setup method
    override func setUpWithError() throws {
        sut = SignUpFormValidator()
        SignUpFormValidatorTests.setUpCount += 1
        print("**** setUpWithError called \(SignUpFormValidatorTests.setUpCount) times")
    }

    override func tearDownWithError() throws {
        sut = nil
        SignUpFormValidatorTests.tearDownCount += 1
        print("**** tearDownWithError called \(SignUpFormValidatorTests.tearDownCount) times")
    }

    
    func testIsFirstNameValid_validFirstNameProvided_shouldShowTrue() {
        //Act
        let firstNameValid = sut.isFirstNameValid(firstName: Const.validFirstName)
        
        //Assert
        XCTAssertTrue(firstNameValid, "the isFirstNameValid should have returned TRUE")
        
    }
    
    func testIsFirstNameValid_invalidFirstNameProvided_shouldShowFalse() {
        let firstNameInvalid = sut.isFirstNameValid(firstName: Const.invalidFirstName)
        
        XCTAssertFalse(firstNameInvalid, "the isFistNameValid should have returned FALSE")
    }
    
    func testIsFirstNameLengthOK_tooShortFirstName_shouldShowFalse() {
        let firstNameLenghtCheck = sut.isFirstNameLengthOk(firstName: self.generateRandomNameByLenght(length: Const.isShortFirstNameLength))
        
        XCTAssertFalse(firstNameLenghtCheck)
    }
    
    func testIsFirstNameLengthOK_notShortFirstName_shouldShowTrue() {
        let firstNameLengthCheck = sut.isFirstNameLengthOk(firstName: self.generateRandomNameByLenght(length: Const.notShortFirstNameLength))
        
        XCTAssertTrue(firstNameLengthCheck)
    }
    
    func testIsFirstNameLengthOK_tooLongFirstName_shouldShowFalse() {
        let firstNameLengthCheck = sut.isFirstNameLengthOk(firstName: self.generateRandomNameByLenght(length: Const.isLongFirstNameLength))
        
        XCTAssertFalse(firstNameLengthCheck)
        
    }
    
    func testIsFirstNameLengthOK_notLongFirstName_shouldShowTrue() {
        let firstNameLengthCheck = sut.isFirstNameLengthOk(firstName: self.generateRandomNameByLenght(length: Const.notLongFirstNameLenght))
        
        XCTAssertTrue(firstNameLengthCheck)
    }
    
    func testIsEmailValid_invalidEmail1_shouldShowFalse() {
        let emailCheck = sut.isEmailValid(email: Const.invalidEmail1)
        
        XCTAssertFalse(emailCheck)
    }
    
    func testIsEmailValid_invalidEmail2_shouldShowFalse() {
        let emailCheck = sut.isEmailValid(email: Const.invalidEmail2)
        
        XCTAssertFalse(emailCheck)
    }
    
    func testIsEmailValid_validEmail_showShowTrue() {
        let emailCheck = sut.isEmailValid(email: Const.validEmail)
        
        XCTAssertTrue(emailCheck)
    }
    
    func testIsPasswordMatch_matchingPasswords_shouldShowTrue() {
        let passwordCheck = sut.isPasswordMatch(password1: "1234abcd", password2: "1234abcd")
        
        XCTAssertTrue(passwordCheck)
    }
    
    func testIsPasswordMatch_notMatchingPasswords_shouldShowFalse() {
        let passwordCheck = sut.isPasswordMatch(password1: "1234abcd", password2: "1s4abcd")
        
        XCTAssertFalse(passwordCheck)
    }


}
