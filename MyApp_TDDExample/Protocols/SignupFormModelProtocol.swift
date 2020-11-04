//
//  SignupFormModelProtocol.swift
//  MyApp_TDDExample
//
//  Created by NoelPoo on 2/11/20.
//

import Foundation


protocol SignupFormModelProtocol {
    var firstName: String { get  }
    var lastName: String { get  }
    var email: String { get  }
    var password: String { get  }
}
