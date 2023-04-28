//
//  APIURLSessionLayer.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 26/04/23.
//

import Foundation

class APIURLSessionLayer {
    
    typealias apiCompletion = (String, Error) -> Void
    // -- always check network error
    //-- input validations
    //create final request
    //-- return response or else error
    static func makeAPIRequest(provider: URLComponents, completion: apiCompletion) {
        let session = URLSession.shared
        guard let url = URL(string: "") else { return }
        let request = URLRequest(url: url) //, timeoutInterval: .)
        let task = session.dataTask(with: request) { apiData, httpResponses, error in
            print(apiData)
            print(httpResponses)
            print(error)
        }
        
    }
    
    static func downloadTaskRequest() {
        
    }
    
    static func uploadTaskRequest() {
        
    }
}
