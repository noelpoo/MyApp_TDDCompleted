//
//  SIgnupWebServiceProtocol.swift
//  MyApp_TDDExample
//
//  Created by NoelPoo on 2/11/20.
//

import Foundation


protocol SignupWebServiceProtocol {
    var processUserSignupCalled: Bool { get }
    var processUserSignupCalledNumberOfTime: Int { get }
}
