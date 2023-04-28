//
//  NetworkStatusNotifier.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 26/04/23.
//

/*
 1.sudo gem install cocoapods -- if cocoapods is not installed in ur system (enter macbook login pass if prompted)
 2.pod init
 
 //-- more details on cocoapods
 It is developed in Ruby language just like many other command line tools -- so
 */
/*
 Reachability --
 Swift comes with its own Reachability implementation for detecting connection issues, but we will be using a third-party library. We are doing this because it is easier and the API is more expressive than the one built in.
 */

import Foundation
//import Reachability

class NetworkStatusNotifier: NSObject {
    var reachability: String?
    
    static let sharedInstance: NetworkStatusNotifier = {
        return NetworkStatusNotifier()
    }()
}
