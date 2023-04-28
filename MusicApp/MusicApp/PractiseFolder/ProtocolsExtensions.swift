//
//  ProtocolsExtensions.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 26/04/23.
//

import Foundation


protocol custom_Comparable {
    func check_Equal(lhs: String, rhs: String) -> Bool
    func check_LHS_isLess(lhs: Int, rhs: Int) -> Bool
    func check_LHS_isGreater(lhs: Int, rhs: Int) -> Bool
}

extension custom_Comparable {
    func check_Equal(lhs: String, rhs: String) -> Bool {
        return lhs == rhs
    }

    func check_LHS_isLess(lhs: Int, rhs: Int) -> Bool {
        return lhs < rhs
    }
    
    func check_LHS_isGreater(lhs: Int, rhs: Int) -> Bool {
        return lhs > rhs
    }
}

protocol custom_Comparable_generic{
    associatedtype T
    associatedtype H
   // static func ==(lhs: Self, rhs: T) -> Bool
    static func ==<H>(lhs: Self, rhs: H) -> Bool
    func check_LHS_isLess(lhs: T, rhs: T)
//    func check_LHS_isGreater(lhs: String, rhs: String)
}

extension custom_Comparable_generic {
}

//-- you can inherit as many no of other protocols here as you wish
//-- class, struct, enum which confirms custom_Equatable must implement functions of all involved protocols
protocol custom_Equatable: custom_Comparable {
    func checkIfEqual()
}

protocol custom_Identifiable {
    func compareTwoObjects()
}

struct protocol_tests: custom_Comparable {
  
    
//    typealias T =
//
//    typealias H =
//
    
    var name1 = "Sara"
    var name2 = "Lara"
    var val1 = 9
    var val2 = 70
    
    func printAll_ProtocolsFunctions() {
        print("are strings equal ---",check_Equal(lhs: name1, rhs: name2))
        print("is lhs < rhs ---",check_LHS_isLess(lhs: val1, rhs: val2))
        print("is lhs > rhs ---",check_LHS_isGreater(lhs: val1, rhs: val2))
        
     //  print("are generics equal ---", check_Equal_generic(lhs: "fdas", rhs: "fdsafdsa"))
      //  check_Equal_generic(lhs: "fdas", rhs: "fdsafdsa")
       // printAll_Protocols_GenericFunctions()
    }
    
//    func printAll_Protocols_GenericFunctions() {
//        print("are strings equal ---", check_Equal_generic<T, H>(lhs: 8, rhs: 9))
//    }
//
//    func check_Equal_generic(lhs: String, rhs: String) -> Bool {
//        return lhs == rhs
//    }
    
//    func check_LHS_isLess(lhs: String, rhs: String) {
//        print("jhl")
//    }
//
//    static func == <H>(lhs: protocol_tests, rhs: H) -> Bool {
//        return lhs == rhs
//    }
////
//    typealias T = String
//
//    typealias H = Int
}
