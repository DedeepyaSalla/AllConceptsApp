//
//  UnitTestSamples.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 12/05/23.
//

import Foundation

class Greetings: NSObject {
    
    final func finalFunction(x : Int)->Int {
          return x + 1
      }
      
      func notFinalFunction(x : Int)->Int {
          return x + 1
      }
    
    func printFunction(x : Int)->Int {
        print("")
        return x + 1
    }
    
    func stackFunction(x : Int)->Int {
            return checkX(y: x)
        }
        
        func inlineFunction(x : Int)->Int {
            return 1
        }
        
        func checkX(y : Int)->Int {
            return 1
        }
    
    func greetMsg(firstName: String?, lastName: String?) -> String? {
        
        var msg: String?
        defer {
            print("message value", msg)
        }
        if let firstName = firstName, let lastName = lastName {
            msg = "Good to see you \(firstName) \(lastName)"
        } else if let firstName = firstName {
            msg = "Hi \(firstName)"
        } else if let lastName = lastName {
            msg = "Hello \(lastName)"
        }
        return msg
    }
    
    //--trying to improvise code
    //--added enum n
    enum GreetMsgs: String {
        case hi = "Hi"
        case hello = "Hello"
        case goodToSeeYou = "Good to see you "
    }
    func greetMsg_1(firstName: String?, lastName: String?) -> String? {
        
        var msg = ""
        if let firstName = firstName, let lastName = lastName {
            msg = "\(GreetMsgs.goodToSeeYou.rawValue) + \(firstName) + \(lastName)"
        } else if let firstName = firstName {
            msg = "\(GreetMsgs.hi.rawValue) + \(firstName)"
        } else if let lastName = lastName {
            msg = "\(GreetMsgs.hello.rawValue) + \(lastName)"
        }
        return msg
    }
    
    //--trying to improvise code
    enum GreetMsgs_1 {
       // let hi = "Hi" // err: Enums must not contain stored properties
        static let hello = "Hello"
        static let goodToSeeYou = "Good to see you "
    }
    func greetMsg_2(firstName: String?, lastName: String?) -> String? {
        
        var msg = ""

        if let firstName = firstName, let lastName = lastName {
            msg = "\(GreetMsgs.goodToSeeYou.rawValue) + \(firstName) + \(lastName)"
        } else if let firstName = firstName {
            msg = "\(GreetMsgs.hi.rawValue) + \(firstName)"
        } else if let lastName = lastName {
            msg = "\(GreetMsgs.hello.rawValue) + \(lastName)"
        }
        
        return msg
    }
}
