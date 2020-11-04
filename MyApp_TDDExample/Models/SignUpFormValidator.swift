//
//  SignUpFormValidator.swift
//  MyApp_TDDExample
//
//  Created by NoelPoo on 2/11/20.
//

import Foundation


public class SignUpFormValidator: SignUpFormValidatorProtocol {
    
    struct Const {
        static let minNameLength: Int = 3
        static let maxNameLenght: Int = 20
    }
    
    func isFirstNameValid(firstName name: String) -> Bool {
        var returnValue = true
        
        if name.isEmpty {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isFirstNameLengthOk(firstName name: String) -> Bool {
        var returnValue = true
        
        if name.count < Const.minNameLength || name.count > Const.maxNameLenght {
            returnValue = false
        }
        return returnValue
    }
    
    func isEmailValid(email: String) -> Bool {
        var returnValue = true
        
        if email.contains("@") && email.contains(".com") {
            returnValue = true
        } else {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isPasswordMatch(password1: String, password2: String) -> Bool {
        return password1 == password2
    }
    
}





