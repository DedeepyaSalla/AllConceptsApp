import UIKit

var greeting = "Hello, playground"
// MARK: - Comparable, HAshable, Equatable
/*
 struct Person: Comparable {
    //err:Type 'Person' does not conform to protocol 'Comparable'
    var name: String
}*/

/*
 //-- basic level 1 eg: Strings and numbers already confirm to Conparable protocol, that is why we are able to compare them with the compare operators like >, <, <=
 
 Many types in the standard library already conform to the Comparable protocol
 */
let currentTemp = 73
 
if currentTemp >= 90 {
    print("It's a scorcher!")
}

struct Employee: Equatable {
   let department: String
   let name: String
   let happinessIndex: Double
   static func == (lhs: Employee, rhs: Employee) -> Bool {
      return lhs.name == rhs.name &&
             lhs.department == rhs.department
   }
}

func isSamePerson(lhs: Employee, rhs: Employee) -> Bool {
   return lhs.name == rhs.name && lhs.department == rhs.department
}

///employee we want to compare
let johnFromIT = Employee(department: "IT", name: "John Doe", happinessIndex: 0.8)
let johnFromHR = Employee(department: "HR", name: "John Doe", happinessIndex: 0.8)
let alsoJohnFromIT = Employee(department: "IT", name: "John Doe", happinessIndex: 0.3)

isSamePerson(lhs: johnFromIT, rhs: johnFromHR) //false
print("came here")

struct Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs > rhs
    }
    
   var name: String
}

let taylor = Person(name: "Taylor Swift")
let justin = Person(name: "Justin Bieber")

//if taylor > justin {
//    print("lhs > rhs -- ie., as per sorting name in lhs is at highest point")
//}

print("if finished")

// MARK: - enums, structs -- when to use each to declare static let
/*
 https://stackoverflow.com/questions/38585344/swift-constants-struct-or-enum
 https://forums.swift.org/t/static-let-in-enum-vs-struct/36152/12
 
 https://github.com/kodecocodes/swift-style-guide#extending-object-lifetime
 
 1.
 One difference between the two is that structs can be instantiated where as enums cannot. So in most scenarios where you just need to use constants, it's probably best to use enums to avoid confusion.

 For example:

 struct Constants {
     static let someValue = "someValue"
 }

 let _ = Constants()
 The above code would still be valid.

 If we use an enum:

 enum Constants {
     static let someValue = "someValue"
 }

 let _ = Constants() // error
 
 Here's a short answer: Do your constants need to be unique? Then use an enum, which enforces this.

 Want to use several different constants to contain the same value (often useful for clarity)? Then use a struct, which allows this.

 
 2.Constants
 
 Constants are defined using the let keyword and variables with the var keyword. Always use let instead of var if the value of the variable will not change.

 Tip: A good technique is to define everything using let and only change it to var if the compiler complains!

 You can define constants on a type rather than on an instance of that type using type properties. To declare a type property as a constant simply use static let. Type properties declared in this way are generally preferred over global constants because they are easier to distinguish from instance properties. Example:

 Preferred:

 enum Math {
   static let e = 2.718281828459045235360287
   static let root2 = 1.41421356237309504880168872
 }

 let hypotenuse = side * Math.root2
 Note: The advantage of using a case-less enumeration is that it can't accidentally be instantiated and works as a pure namespace.

 Not Preferred:

 let e = 2.718281828459045235360287  // pollutes global namespace
 let root2 = 1.41421356237309504880168872

 let hypotenuse = side * root2 // what is root2?
 
 3.
 Static Methods and Variable Type Properties

 Static methods and type properties work similarly to global functions and global variables and should be used sparingly. They are useful when functionality is scoped to a particular type or when Objective-C interoperability is required.
 */


// MARK: - Some helpful code styling tips
/*
 https://github.com/kodecocodes/swift-style-guide#extending-object-lifetime
 Extending object lifetime ?? -- find out with
 weak self, unowned self -- also try to create ur own dead locks and memory leaks with the strong reference cylce and check how the code gets fixed when used weak and when used unowned
 */
// MARK: Modifiers in Swift
/*
 Modifiers list -- Static, class,
 */


/*
 why is swift called protocol - oriented programming
 1.Because we can not only confirm to protocols like otehr languages, but we can decalre default implementaion -- so that all classes, structs which confirm to this protocol automatically gets this functionality n they can directly use thsi function
 2.In addition, not only to ur own custom protcols but you can add default custom functions to existing native classes or structs or to all classes or structs which confirm to one protocol or more
 3.For Structs, inheritance is not possible. But that limit is balanced with protocol inheritance n its default implementation
 
 
 https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-protocol-extensions
 
 More importantly, by extending the protocol we’re adding functionality that would otherwise need to be done inside individual structs. This is really powerful, and leads to a technique Apple calls protocol-oriented programming – we can list some required methods in a protocol, then add default implementations of those inside a protocol extension. All conforming types then get to use those default implementations, or provide their own as needed.
 no need to even declare methods in signature, if only implementation is there n if there is no chance of overriding
 
 */
class Employer: protocol1, protocol2 {
    static var employerClassCount = 0
    
//    var computedCount: Int {
//        return employerClassCount
//    }
    
    init() {
        objectsCount = objectsCount + 1
    }
    
    func count() -> Int {
        return objectsCount
    }
    
    static func count() -> Int {
        return employerClassCount
    }
    
    deinit {
        objectsCount = objectsCount - 1
    }
    
    func display() {
        print("Employer - display")
    }
}

var objectsCount = 0

//err:static var objectsCount = 0
//reason: you cannot declare global properties as static


let employer1 = Employer()
print(employer1.count())
let employer2 = Employer()
print(employer2.count())

Employer.employerClassCount = 6
print(Employer.count())

protocol protocol1 {
    func display()
}

extension protocol1 {
    func display() {
        print("protocol1 - display")
    }
}

protocol protocol2 {
    func display()
}

extension protocol2 {
    func display() {
        print("protocol2 - display")
    }
}
employer1.display()



internal enum testAccessLvels {
    case one
    case two
}
enum staticEnums {
    static let notesNib = "NotesNib"
    static var ratingCell = "RatingCell"
    
  /*  //err: 'self.init' isn't called on all paths before returning from initializer
    init() {
        
    } */
}

print(staticEnums.notesNib)
print(staticEnums.ratingCell)

staticEnums.ratingCell = "Rating 22"
print(staticEnums.ratingCell)

enum enumType {
    case Friend
    case Family
    case Coworker
    case Other

    init() {
        self = .Friend
    }
}

print(enumType.self)
// MARK: Computed property
/*
 Use cases
 1.Computed properties can be used either when you have a property which needs has always dependency on other propertye
 2.When you want to declare object and add configuration to itself -> eg: UI Objects, URLComponets
 */
class properties_Researches {
    static var shared = properties_Researches()
    var num = 2
    var checkComputed_Intitiazation : Int {
        print("called computed")
        return num + 5
    }
    
    private var urlComp: URLComponents {
        var comp = URLComponents()
        comp.scheme = "https"
        return comp
    }
    
    var checkClosure_Intitiazation : Int = {
        print("called closure")
        return 5
    }()

    func testing_properties() {
        print("testing_properties")
//        print(checkComputed_Intitiazation)
//        print(checkClosure_Intitiazation)
    }
}

let propertyObj = properties_Researches()
//propertyObj.testing_properties()
//propertyObj.testing_properties()
//propertyObj.testing_properties()

propertyObj.checkComputed_Intitiazation
propertyObj.checkComputed_Intitiazation
propertyObj.checkClosure_Intitiazation
propertyObj.checkClosure_Intitiazation

//propertyObj.checkComputed_Intitiazation

//print(properties_Researches.shared)
//print(properties_Researches.shared)
//print(properties_Researches.shared)

// MARK: generic theory
/*
 1.Why arrays and dictionnaries are called gnerics
 you’ve been using generics throughout the Language Guide, even if you didn’t realize it. For example, Swift’s Array and Dictionary types are both generic collections. You can create an array that holds Int values, or an array that holds String values, or indeed an array for any other type that can be created in Swift. Similarly, you can create a dictionary to store values of any specified type, and there are no limitations on what that type can be.
 
 eg: Dictionary<Key, Value> and in Array<Element>
 here Key, Value, Element -- are generic - because they can be any datatype
 you can declare dictionary n array as
 Dictionary<T, U> and in Array<K>
 
 T, U, K are generics
 
 2.Why generic -
 with generic you can use reusable functions for multiple types --
 reduces duplicate code
 */

// MARK: generic example
struct IntStack {
    
    typealias IntItem = Int
    var items: [IntItem]
    
   /* //err:Cannot use mutating member on immutable value: 'self' is immutable
    func append(val: Int) {
        items.append(val)
    }*/
    
    mutating func append(val: IntItem) {
        items.append(val)
    }
    
    mutating func remove(val: IntItem) {
        items.removeLast()
    }
}

var objIntStack = IntStack(items: [1,2,4,5])
objIntStack.append(val: 8)
print(objIntStack.items)


struct GenericStack<T> {
    var items: [T]
    
    mutating func append(val: T) {
        items.append(val)
    }
    
    mutating func remove(val: T) {
        items.removeLast()
    }
}

var objGenericStack = GenericStack(items: [1,2,4,5])
objGenericStack.append(val: 8)
print(objGenericStack.items)

// MARK: Extensions theor
/*
 Extensions in Swift can:
 --  Make an existing type conform to a protocol : - for code separation by declarin separate sections for each protocol confirmance
 --Add computed instance properties and computed type properties
 && Define instance methods and type methods
 Provide new initializers
 Define subscripts
 Define and use new nested types
 */


// MARK: Extensions  - examples
//1.code separation
/*
class someVC: UIViewController {
    
}

extension SomeType: UITableViewDelegate { // can confirm to predefined or custom defined protocols
    // implementation of protocol requirements goes here
}*/

protocol ListData {
    var id: Int { get }
    var displayName: String { get }
    var subtitleText: String { get }
    var nameValue: String { get }
}

// 2.add computed property or additional functionality with functions (instance methods) - can be used for default properties declared in protocol
extension ListData {
    var subtitleText: String {
        return ""
    }
    
    var nameValue: String { return ""}
}

// 2.add computed property - for existing types data types, or other NSObjects
//-data types
extension Double {
    // it is taking the double and calling func or the computed property on its self
    var kmValue: Double { self*1000.0 }
    var meterValue: Double { self*100.0}
    
    func description() -> String {
        return "\(self) + units"
    }

    //-- prefer simple computed property, as its simple computation here
    var desc: String {
        return "\(self) + units"
    }
}
let givenValue: Double = 10
let meterValue = givenValue.meterValue
//or
let kmVal = 30.kmValue.desc // -- here you r calling that computed property or function

// 2a. adding additional functionality for existing NSObjects
// MARK: Extensions + generic + protocol + Any
//it shows when to use Any and when to use generics
extension UserDefaults {
    //- NSObjects -- extension + generic
    //@discardableResult
    func getUserDefault(forKey key: String) -> Any {
        return UserDefaults.standard.object(forKey: key) as Any
//        guard let val = UserDefaults.standard.object(forKey: key) else { return nil }
//        return val as? T ?? nil
    }
    
    func setUserDefault<T>(for key: String, value: T) {
        let userDefault = UserDefaults.standard
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    //-other NSObjects -- Extensions + generic + protocol + multiple generics
    //--yes T is generic, but you want the generic which only confirms to ur protocol
    func setJSONInUserDefaults<T: Encodable, U> (key: U, value: T) {
        let userDefault = UserDefaults.standard
        
        do {
            guard let keyStr = key as? String else { return }
            let data = try JSONEncoder().encode(value) // here you are trying to convert ur swift dictionr or struct to streaming data
            userDefault.set(data, forKey: keyStr)
            userDefault.synchronize()
        } catch {}
    }
}

//3 -- nested types -- ie., you can add class, struct or enums within the extension --
//eg: you want an enum which tells if number is pos, neg or 0 - but you don't want that enum to be global - instead you want it only for Integer - so include that enum within the Int extension only
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self { // here self is Int
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

//blunder
enum Kind_1: Int {
    case negative, zero, positive
    
    func getKind(intValue: Int) -> Self {
        switch intValue {
            case 0:
                return .zero
            case let x where x > 0:
                return .positive
            default:
                return .negative
        }
    }
}

//understood thatn enum functions can be called only thorugh its values - basically this functions or computed properties to manipulate the existing case or return a data which depends on this case type
//--here its useless to use enum
var checkIntType = Kind_1.negative.getKind(intValue: 9)
print(checkIntType)

//better way
enum Kind_2: Int {
    case negative, zero, positive
}

func getKind(intValue: Int) -> Kind_2 {
    switch intValue {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
    }
}

var checkIntType_1 = getKind(intValue: 9)
print(checkIntType_1)

//--logical
func fibonacci(_ n: Int) -> Int {
    var arr = [0,1]
    for i in 2...n {
        let val = arr[i-1] + arr[i-2]
        arr.append(val)
    }
    return arr[arr.count-1]
}

print(fibonacci(9))

//--logical
func fibonacci_simplified(_ n: Int) -> Int {
    var arr = [0,1]
    for _ in 2...n {
        let seconnValue = arr[1]
        arr[1] = arr[0] + arr[1]
        arr[0] = seconnValue
    }
    return arr[1]
}

print("simplified",fibonacci_simplified(9))

let arrSum = [1,2,3,4,56]
let reduceSum = arrSum.reduce(0) { partialResult, intValue in
    partialResult + intValue
}

//or shortcuts
let reduceSum_1 = arrSum.reduce(0) { $0 + $1}

//or shortcuts
let reduceSum_2 = arrSum.reduce(0, +)

print(reduceSum)
print(reduceSum_1)
print(reduceSum_2)


func reverseString_1(_ str: String) -> String {
    var reversedStr = ""
    for char in str {
        print(char)
        reversedStr = String(char) + reversedStr
    }
    return reversedStr
}

// Example usage
let str = "hello world"
let reversed = reverseString_1(str)
print("The reversed string of '\(str)' is '\(reversed)'")

//let char_1: Character = Character("")
//let str_1 = "hello world".reduce(into: char_1) {$1+$0}
//print(str_1)

let strNum = 780809808
let numConvert = String(strNum)

func sumOFnums(str: String) {
    var sum = 0
    for char in numConvert {
        print(char)
        //let toInt = Int(char)
        print("")
        //reversedStr = String(char) + reversedStr
    }
    
    return
}

//anagrams -- find revered string n check if both are equal

//MARK: - Singletons
//basic template for singleton setup

/*
 let shared = NetworkManager_1() //err: while accessing NetworkManager_1.shared err will be -> instance property -- so only instance use it, not class type
 */

/*
 static var shared: NetworkManager_1!
 eg: NetworkManager_1.shared.number = 9 --
 err: Thread 1: Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value
 */

/* can use multiple static intiations and all will work
 
 static let shared_1 = NetworkManager_1()
 NetworkManager_1.shared.number = 9
 
 static let shared_2 = NetworkManager_1()
 NetworkManager_1.shared.number = 10
 var number = 3
 
 //call this function n see n it will return difference values for each initiated class type
 func makeDataTaskApiCall() {
     print("note down step by step", number)
 }
 
 */

/*
 without private restriction -- external initiazaiton is also possible eventhough shared exists
      let instanceType_NetworkManager = NetworkManager_1()
       instanceType_NetworkManager.number = 20
       instanceType_NetworkManager.makeDataTaskApiCall()
 */

/*
 -- disadvantages of singleton are mentioned -
 https://cocoacasts.com/are-singletons-bad/
 https://www.swiftbysundell.com/articles/avoiding-singletons-in-swift/
 1.esp - its hard to track all the fiels where the singleton data is changed, so its hard to debug n there is high chance of errors
 They are global mutable shared state. Their state is automatically shared across the entire app, and bugs can often start occurring when that state changes unexpectedly.
 2.As any screen or feature can access this -- you cannot add any restriction for any feature to access this signleton
 The relationships between singletons and the code that depends on them is usually not very well defined. Since singletons are so convenient and easy to access - using them extensively usually leads to very hard to maintain "spaghetti code" that doesn't have clear separations between objects.
 3.Managing their lifecycle can be tricky. Since singletons are alive during the entire lifespan of an application, managing them can be really hard, and they usually have to rely on optionals to keep track of values. This also makes code that relies on singletons really hard to test, since you can't easily start from a "clean slate" in each test case.
 --alternatives for singleton -- viewModel -- so that data stays only till that feature is opened --
//--ofcourse again, we are not creating viewModel as singleTon - we just create class viewModel() { init() {contains any dependencies} }
it means you can create more than one viewModel from other place also, but thats okay -- that is the intention here - if you want single data for current views, use only this one viewModel thats it - problem solved
 */
class NetworkManager {

    // MARK: - Properties

    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager(baseURL: URL(string: "https://api.unsplash.com/search/photos?query=puppies")!)

        // Configuration
        // ...

        return networkManager
    }()

    // MARK: -

    let baseURL: URL

    // Initialization

    private init(baseURL: URL) {
        self.baseURL = baseURL
    }

    // MARK: - Accessors

    class func shared() -> NetworkManager {
        return sharedNetworkManager
    }
}


// MARK: - Protocols

//DataManagerInjector.swift
protocol DataManagerInjector {
    var strGetOnly: String { get }
}

extension DataManagerInjector {
    var strGetOnly: String {
        return "default value"
    }
}
