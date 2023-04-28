//
//  Properties_NBasics.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 26/04/23.
//

/*
 topics covered here -
 -- all kinds of properties - stored, computed, lazy, property observers
 -- struct - mutable, immutable n mutating
 -- functions - default parameters (need not have argument), optional parameters (must have argument), inout
 */

/*
 
 lazy --
 Real-time applications -
 Sorting a collection of elements can be expensive so use lazy - if you want to compute it only once.
 But if think it must be computed multiple times, with different properties within that instance then use computed or funtion - so you don't have option
 */

/*
 //
 storedProperty (can be let or var) - > constant or variable that's stored, because its just storing value , not computing anything
 Computed properties - > It is a value that can be derived from other stored value. If you don't provide set then block is considered as get by default
 lazy - > property whose initial value isn't calculated until the first time it's used. When its used, value is calculated but later its not calculateed again.
 A lazy var in Swift allows you to delay the initialization of values until it's used. This can be great for performance optimization
 Observation: lazy calcualtes value only once n from next time, that same value is returned n no computation is performed. Reason: we use lazy for heavy computations - to optimizw performance, so that is why -- swift computes only once n optimizes
 Optimization happends -- because - 1.only once its computed (so even if its expensive task - you compute only once,) - 2.Its computed only when use first time and if you don't use then its not computed at all -- so big advantage here

 closure -
 
 https://medium.com/the-andela-way/property-observers-didset-and-willset-in-swift-4-c3730f26b1e9
 //-- to all above proeprties you can add proeprty observers
 proeprty observers - Note: During initialization, will set, did set won't work -- only from second time this will work
 Note: Property observers are declared as a variable and not as constants because it is only a mutable property that can be tracked by property observers
 Note: The need for property observers arises when you have to keep a track on a property to determine when the value changes in order to perform some logic. So, instead of having some functions that checks the value of the property to perform some action, you can abstract that into the willSet and have it perform the logic when the value is set to the value you want
 
 https://medium.com/@rguruonline/swift-computed-properties-and-property-observers-56374675c9e2#:~:text=Property%20observer%20is%20used%20to,in%20subclass%20except%20lazy%20properties.
 didSet : It is called right after the value is set. didSet uses old property value in the default parameter name oldValue when no custom parameter name is given.
 
 -- on Lazy -- more details - (except for computed all other types (stored, closure) - why not for computed because the core functionality of computed is to calculate everytime its access and core functionality of lazy is to calculate only once -- that is why you can do it
 
 why not declare lazy for all properties ?
 Yes you might think why can't we declare all properties only when they are used, in that lot of performance can be improved and also stored properties n any properties can be decalared as lazy.
 But in the first place, -- if you don't need it to use much and want to access only once then why set it in initialization, --only simple and really needed once should be in initialization
 
 Difference between computed and lazy - computed calculated everytime its used, lazy calculated only once and it becomes constant
 -- syntaz wise -> lazy is like closure - so has equal, --> = and () exists, for computed they don't exist and get is mandatory and for computed () does not exist because we are referring it as property
 
 --   // - only lazy, computed proeprties - we can use properties within it, because lazy does not get initialized when that instance is initialized, but rest all properties gets initialized at that time itself - even computed getes initialized with the instance
 Note: you cannot use computed property in other computed or closure properties - because those might get initialised first n if compiler does not have values on which these are dependent on some other computed properties which did not get initiated then it will be a problem.
 As for lazy, that issue wil never arise as it will be initialised only when we try to access it and we can access it only after entire instance is initialized, which all computed, closures n stored properties are already initialized by that time so no issue at all--
 */

/*
 different kinds of functions -- mutating (applies only for struct, enums)
 parameters ways to pass -- default paramaters, optional paramaters, non-optional (standrad - as you do for every func) paramaters, inout, completion handlers with escapae and nonEscape
 */

import UIKit

class circle {

    //-stored property
    var radius: Int = 10

    //-- computed property with get, set. Note: lazy cannot be used on computed property
    var area: Double {
        get {
            return Double(radius * radius) * Double.pi
        } set (areaVal) {
            print("new value")
            radius = Int(sqrt(areaVal / Double.pi))
        }
    }
    
    //computed property - with only get - as set is not available - it considers the block as get by default
    var areaDefault: Double {
        return Double(radius * radius) * Double.pi
    }

    //- as its lazy 'get' does not exist, requires bracket like closure
    //- no error for using 'areaDefault', but in next closure property, it throws error becoz areaDefault also does not hav proerty n you want label to get initialized right away
    lazy var lazyArea: Double = {
        //get {
        print("lazy area initialized---")
            return Double(areaDefault * areaDefault) * Double.pi
        //}
    }()
    
    lazy var lazyOptionalArea: Double? = {
        //get {
            return Double(areaDefault * areaDefault) * Double.pi
        //}
    }()
    
    //-closure
    //--closure n lazy both are initialized only once - but lazy is initialized while accessing, closure is done when its class/struct is initialized n in closure you cannot use computed/ stored properties but lazy can use
    var lazyArea_closure = {
        //get {
        print("lazyArea_closure initialized---")
           // return Double(radius * radius) * Double.pi
        //}
    }()
    
    var label: UILabel = {
       let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        lbl.text = "area value" //+ 
       return lbl
    }()

    
    //-property observers -- can be added for stored properties only -- they must be var n either initialized or optional just like stored pro
    //https://medium.com/@rguruonline/swift-computed-properties-and-property-observers-56374675c9e2#:~:text=Property%20observer%20is%20used%20to,in%20subclass%20except%20lazy%20properties.
    //- Note: even if its property observer, you can 
    
    //-here we added for stored property
    var radiusObserver: Int = 10 {
        willSet {
            print("about to assing the new value")
        }
        didSet {
            if radius > 0 {
                //calculate area only if radius is > 0
                print("area from observer --",area)
            }
        }
    }
    
    //when added property observesr, get is not supported
    // - 'let' declarations cannot be observing properties, because if they are constants no need to observer at all
    var areaObserver_Default: Double = 0 {
        willSet {
            print("about to assing the new value")
        }
        didSet {
            if radius > 0 {
                //calculate area only if radius is > 0
                print("area from observer --",area)
            }
        }
    }
    
    var areaObserver_Default_1: Int? {
        willSet {
            print("about to assing the new value")
        }
        didSet {
            if radius > 0 {
                //calculate area only if radius is > 0
                print("area from observer --",area)
            }
        }
    }
}

class Pokemon {//: CustomDebugStringConvertible {
  let name: String
  init(name: String) {
    self.name = name
  }
  var debugDescription: String { return "<Pokemon \(name)>" }
  deinit { print("\(self) escaped!") }
}

// ---- Designing a viewModel n above lazy property application
struct Note {
    let noteId: UUID?
    var fieldName: String
    let observationInField: String
    let notePriority: Int
}

//--basically viewModel contains all its view's Model data, performs operations with that model -- instead of doing it in controller, we are doing it here
//-- use case 1 --eg: Person, Company, Home -- all this models are part of a ViewModel - so if you jsut pass the viewModel, all this models data can be circulated within that feature. If you store this models in controlelr - then you need to pass each model
//usecase 2 - you can write common logic in one place, so duplicate logic can be avoided and circulated within that feature (the repeatable code useful for that feature can be written here)
//-- you can do all operations in this one single place -- db saving, api calling

struct check_without_Inti {
    
    var name: String
    var age: Int
}

class check_without_Inti_calss {

    var name: String = ""
    var age: Int = 0
}

struct NotesViewModel {
    //--here list out all models which you require for the feature
    var notes:[Note] = []
    lazy var highPriorityNote_lazy: Note? = {
        print("highest priority note from all the notes")
        return notes.max(by: { $0.notePriority < $1.notePriority })
    }()
    
     var highPriority_computed: Note? {
        print("highest priority note from all the notes")
         return notes.max { note1, note2 in
             return note1.notePriority < note2.notePriority
         }
         // or -- both these returns have same functionality -- arguments are referred as $0, $1 -- so inputs can be omitted, then as its just one line code return -- that also can be ommitted
        // return notes.max(by: { $0.notePriority < $1.notePriority })
    }
    
    init(notes: [Note]) {
        self.notes = notes
        
        //-- here you don't to pass value in "deleteOld", because already value exists - so if you want to override it then you can pass the value
        savePhotosInDisk_DefaultParams(photoLinks: ["photoLink 1", "photo Link 2"])
        
        //here eventhough maxLimit is optional, you have to pass value -- optional param means it does not mean you have choice to omit it, it means you can either pass value or you can pass nil. But its mandatory to pass value
        savePhotosInDisk_Optionals(photoLinks: ["photoLink 1"], maxLimit: 9)
    }
    
    func savePhotosInDisk_DefaultParams(photoLinks: [String], deleteOld: Bool = true) {
       print(deleteOld)
    }
    
    func savePhotosInDisk_Optionals(photoLinks: [String], maxLimit: Int?) {
        print(maxLimit)
    }
    
    func savePhotosInDisk_InOut(photoLinks: [String], maxLimit: Int?) {
        print(maxLimit)
    }
    
    mutating func modifyNotes() {
        // notes.remove(at: 0) err: // -- Cannot use mutating member on immutable value: 'self' is immutable (for non-mutating functions
        print(notes.count)
        if notes.count > 0 {
            notes.remove(at: 0)
        }
    }
}

//exten
//max, identifieable
//-genrics


//protocola -- identifi, compare, equa, hasha,
//-subscripy
