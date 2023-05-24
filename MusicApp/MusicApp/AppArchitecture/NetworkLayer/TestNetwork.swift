//
//  TestNetwork.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 21/05/23.
//

import Foundation


struct test: Equatable {
    
}

struct TestNetwork {
    
    //MARK: - data task calls
    /*
     -- no completion handler - so even if we call api, the obtained data is not used anywhere
     -- after receing response from api - we are not checking for error and http status - because 0 error and 200 status code is must - otherwise it means, something is not right and that should be handled
     --
     */
    private let accessKey = "bbc33cc9f86e189e1387e31a57dbd74a2dba4a5f4540f7a0dbcb599fd72f61f2"
    func getAPI_1(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Client-ID \(accessKey)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { resData, responseType, err in
            print(responseType)
            print(err)
        }
        task.resume()
    }
    
    /*
     improvements here:
     --add completion, send parsed data, handle all errors
     -- add common function for request, urlsession
     Note: here we are using optionals for data, error because api might give errors or it might give data
     Observations -
    1. except network error, we have data , status code, parsing errors - so better to create a dataType which groups all this (yes, enum is the best way to do this)
     Why enum?
     you can declare a global variable with err = "" and assign whatever you want, but here its hardcoded and while checking in calling function there also its hardcode
     -- so use enums when you don't want to hardcode and when only one case statisfies there
     -- why global - because both in called func and calling function it must be used - so the only way for it is by giving global access
     
     2.Add global function for parsing - because it might be used anywhere
     ways - declare it globally (but global space is overloaded n its becomes messy)
     -- declare it inside a class (make it final for optimization), struct or enum with static keyword. In that way, its avaialble globally through that class (yes when code is compiled, that function is made available globally - but its accessible only through its class and not directly)
     -- extension is also one more possibility - but not here
     
     3.After receiving response, you are expected to pass the parsed data( which is convereted Post) and not the Data which is received from server/ API
     but it won't be Post object everytime, so you need to add geenric
     */
    func getRequest(url: String) -> URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.addValue("Client-ID \(accessKey)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    func getAPI_2(url: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let req = getRequest(url: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: req) { data, responseType, err in
          /*
           //err:Cannot find 'error' in scope
           guard let error = err else {
               completion(nil, error)
               return
           }
           yes you can use guard and do other operations before returning that is possible
           what using the unwrapped optional value is not possible in guard, because only when the optional does not exist it goes to else -- so you cannot use optional in else
           -- so use if let here and add return at the end
           */
            
            if let error = err {
              completion(nil, error)
              return
            }
            
            guard let httpResponse = responseType as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(nil, nil)
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(Post.self, from: data)
                /*
                 err:Cannot convert value of type 'Post' to expected argument type 'Data?'
                 completion(response, nil)
                 
                 even if you want to pass the response which Post object now - you cannot because in completion you have mentioned as data
                 so it does not accept Post object
                 */
                
            } catch {
                completion(nil, nil)
            }
            
            do {
                let parsedRes = try JSONDecoder().decode(Post.self, from: data)
                print(parsedRes)
            } catch var parseError {
                completion(nil, parseError)
            }
            
            do {
                let parsedRes =  try Parsers.decodedObject(Post.self, from: data)
                print(parsedRes)
            } catch var parseError {
                completion(nil, parseError)
            }
        }
        task.resume()
    }
    
    /*
     improvements: added generic for returned parsed data
     */
    func getAPI_3<T: Decodable>(url: String, completion: @escaping (T?, Error?) -> Void) {
        guard let req = getRequest(url: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: req) { data, responseType, err in

            if let error = err {
              completion(nil, error)
              return
            }
            
            guard let httpResponse = responseType as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(nil, nil)
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            do {
                let parsedRes =  try Parsers.decodedObject(T.self, from: data)
                completion(parsedRes, nil)
                print(parsedRes)
            } catch var parseError {
                completion(nil, parseError)
            }
        }
        task.resume()
    }
    /*
     Define context by telling implementors of your method that it can fail
     
    -- we can define custom error types -- 
     The failure error type identifies the potential errors that can occur
     
     (T?, Error?)
     Instead of returning an optional Error and result value we can now simply switch two cases and get an unwrapped value
     */
    
    //MARK: - download task calls
    
    func downloadAPI_1(url: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let req = getRequest(url: url) else {
            return
        }

        let task =  URLSession.shared.downloadTask(with: req) { fileUrl, responseType, err in

            if let error = err {
              completion(nil, error)
              return
            }
            
            guard let httpResponse = responseType as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(nil, nil)
                return
            }
            
            guard let fileUrl = fileUrl else {
                completion(nil, nil)
                return
            }
            
            print(fileUrl)
        }
        task.resume()
    }
}


struct Parsers {
    
    static func decodedObject<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
