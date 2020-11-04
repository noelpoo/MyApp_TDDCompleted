//
//  SignUpFormValidatorProtocol.swift
//  MyApp_TDDExample
//
//  Created by NoelPoo on 2/11/20.
//

import Foundation


protocol SignUpFormValidatorProtocol {
    
    func isFirstNameValid(firstName name: String) -> Bool
    func isFirstNameLengthOk(firstName name: String) -> Bool
    func isEmailValid(email: String) -> Bool
    func isPasswordMatch(password1: String, password2: String) -> Bool
    
}
