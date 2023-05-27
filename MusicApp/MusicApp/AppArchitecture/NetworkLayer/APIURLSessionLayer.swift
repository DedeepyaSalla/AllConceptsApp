//
//  APIURLSessionLayer.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 26/04/23.
//

import Foundation

// MARK: - Type Alias
//
typealias JSONDictionary = [String: Any]

/*
 it means success, error has associated values
 consider associated values as the properties of the type
 eg: class Person { var name: String} -- here name is the property which is linked Person class
 Similarly in below example - property str(its data type is String) is linked to success type
 so when you get success case or object, you will have access to the String
 -- you can pass the value directly, or give argument name for more clarity
 */
enum ResultNativeTypes {
    case success(String)
    case error(Int)
    case successWithArg(data: String)
}

/*
 responseData, errorInfo are generics
 so the responseData - data type can contain strings, numbers or anything
 but for errorInfo generic we added one restriction which is it must conform to Error, it means that errorInfo datatype must be Error
 */
enum Result<responseData, errorInfo: Error> {
    case success(responseData)
    case error(errorInfo?)
}

/*
 why to use switch rather than if to handle enum cases, because compiler forces you to cover all cases. If you use "if", then you might miss any case
 That is why Result is so powerful - as it is enum with only two cases - you get either success or failure, then as we use switch we cover both cases for sure
 if you use (data, error, httpResponseCode) - completion - you need to handle 8 (2^3) cases and here you are forced to use if -- which might miss cases, not eaily readable
 */
enum APIErrors: Error {
    case httpError
    case invalidRequest
    case invalidParsing
    
    var desc: String {
        switch self {
        case .httpError :
            return "http status code is not 200"
        case .invalidRequest:
            return "API call is not success"
        case .invalidParsing:
            return "Parsing is not successfull"
        }
    }
}

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
    
    func getRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        return request
    }
    
    // MARK: - All session Methods
    
    func getAPIImprovised_1(url: URL?, completion: @escaping (Result<Any, Error>) -> Void) {
        guard let url = url else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: getRequest(url: url)) { data, responseType, err in

            if let error = err {
                completion(.error(error))
              return
            }
            
            guard let httpResponse = responseType as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.error(nil))
                return
            }
            
            guard let data = data else {
                completion(.error(nil))
                return
            }
            
            self.updateSearchResults(data) { tracks, errorMsg in
                completion(.success(tracks))
            }
        }
        task.resume()
    }
    
    func downloadStartTask(url: URL?) {
        guard let url = url else {
            return
        }
        
        let task = URLSession.shared.downloadTask(with: url)
        task.resume()
    }
    
    static func uploadTaskRequest() {
        
    }
    
    // MARK: - Private Methods
    //
    /*
     used non escaping completion n defer
     */
    private func updateSearchResults(_ data: Data, completion: ([Track]?, String?) -> Void) {
      var response: JSONDictionary?
        var tracks: [Track] = []
        var errorMessage: String?
        
        /*
         without defer you have to call completion before all returns
         */
        defer {
            completion(tracks, errorMessage)
        }
        
      do {
        response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
      } catch let parseError as NSError {
        errorMessage = "JSONSerialization error: \(parseError.localizedDescription)\n"
        return
      }
      
      guard let array = response!["results"] as? [Any] else {
        errorMessage = "Dictionary does not contain results key\n"
        return
      }
      
      var index = 0
      
      for trackDictionary in array {
        if let trackDictionary = trackDictionary as? JSONDictionary,
          let previewURLString = trackDictionary["previewUrl"] as? String,
          let previewURL = URL(string: previewURLString),
          let name = trackDictionary["trackName"] as? String,
          let artist = trackDictionary["artistName"] as? String {
            tracks.append(Track(name: name, artist: artist, previewURL: previewURL, index: index))
            index += 1
        } else {
          errorMessage = "Problem parsing trackDictionary\n"
        }
      }
    }
}
