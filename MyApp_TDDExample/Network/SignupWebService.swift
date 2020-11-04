//
//  SignupWebService.swift
//  MyApp_TDDExample
//
//  Created by NoelPoo on 3/11/20.
//

import Foundation


class SignupWebService {
    
    private var urlSession: URLSession
    private var urlString: String
    
    // provide option to initialise urlSession in this object, with real session as default
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
//    init(urlString: String) {
//        self.urlString = urlString
//    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupErrors?) -> Void) {
        guard let url = URL(string: self.urlString) else {
            // TODO - write unit test for invalid url
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        // if this datatask is used in Unit tests, it will send out a real request to webserver, it will no longer be a unit test but an integration-test.
        // hence we have to mock the behavior or URLSession
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                //TODO: create new unit test to handle error here
            }
        }
        dataTask.resume()
    }
}


