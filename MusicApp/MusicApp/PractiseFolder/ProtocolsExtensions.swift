//
//  ProtocolsExtensions.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 26/04/23.
//

import Foundation
import UIKit

//MARK: - Enums use cases

/*
 Enum use cases
 
 -- 1 avoid hardcoding through enums - advantage is avoids hardcoding, also does not allow developer to use names which aren't present in that group - gives compile error

 -- in 2, it is painful to always add rawvalue, but still its okay atleast. But what if you want to declare api urls whose string is very long, there its impossibel to use case. So in that case use static let
 Note: a. In enums, which does not have cases - init constructor is not possible, you cannot add string, Int to enum heading declaration
 b.if it is property - then it must be static
 Reason is simple, you can access instance properties like let, var only through instance and if enum does not support init constructor then instance cannot be created
 If instance cannot be created, then only possible way to access it is thorugh static
 */
//

enum UIElements_Eg {

    enum ImageNames_Eg: String {
        case appIcon
        case profileImage
    }
}

enum UINibTitlesEg: String {
    case Main
    case DownloadAudiosVC
}

enum AllGlobalVariables {
    enum AllUrls {
        static let devUrl = "https://dev.com"
        static let prodURL = "https://prod.com"
    }
    
    enum SystemColors {
        static let devUrl = UIColor(red: 20, green: 30, blue: 40, alpha: 0)
        static let prodURL = UIColor(red: 20, green: 30, blue: 40, alpha: 0)
    }
}

//MARK: - Extensions
//extension Color {
////  static let brand = Color(red: 75/255, green: 0, blue: 130/255)
////
////  static var settingsBackground: Color {
////    Color(UIColor { (trait) -> UIColor in
////      return trait.userInterfaceStyle == .dark ? .systemGray5 : .systemGray6
////    })
////  }
//}

/*
 to call extension
 eg: let str = "test"
 str.trimmed() --> allowed
 String.trimmed() --> not allwoed
 
 ie., you cannot use direct data type to call the extension function, you can only use its instance
 */
extension String {
    func trimmed() -> String {
        self.lowercased()
        //self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func trimmed_1(str: String) -> Int {
        return 123//"test" + "\(self.lowercased())"
        //self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

 extension String {
    var nilIfEmpty: String? {
        self.isEmpty ? nil : self
    }
}

extension UIColor {
  
    static var mainColor : UIColor {
        return UIColor(red: 20, green: 30, blue: 40, alpha: 0)
    }
    
    
    static var appGray : UIColor {
        return UIColor(red: 20, green: 30, blue: 40, alpha: 0)
    }
  
}

//MARK: - Protocols
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
