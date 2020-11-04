//
//  SignupFormRequestModel.swift
//  MyApp_TDDExample
//
//  Created by NoelPoo on 3/11/20.
//

import Foundation

// conform to Encodable protocol as this struct will be encoded to JSON before sending as request. 
struct SignupFormRequestModel: Encodable {
    
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
}

