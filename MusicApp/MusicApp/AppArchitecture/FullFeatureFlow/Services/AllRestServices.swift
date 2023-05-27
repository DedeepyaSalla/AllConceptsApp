//
//  AllRestServices.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 27/05/23.
//

import Foundation

/*
 how the service is designed
 1.We cannot send hardcoded urls from the viewMOdel for mvvm, from viewcontroller for mvc for each service. Drawbacks for them include - > confidential network details are revealed in those files and its hard for developers to identify all the services which are involved in the project
 2.Can use enum with list of urls atleast for rest apis, but not all urls are straightforward and for them you need to write service
 3.Here as we wrote music service which gives us url by just using url and for initializing you just need to pass search term
 -- steps taken care here include
 started with basic implementation - tried to get url from url components
 as url components require domain n its constant always, declared domain in let,
 as search term needs to obtained from user, made it var
 as url can be calculated directly from all these variables, no need to call any function for url
 except search term, remaining variables does not need external visibility - so made them private
 */
struct MusicService {
    
    var url: URL? {
        var urlComponents = URLComponents(string: domain)
        urlComponents?.query = "media=music&entity=song&term=\(searchTerm)"
        return urlComponents?.url
    }
    
    private let domain: String = "https://itunes.apple.com/search"
    var searchTerm: String = ""
}
