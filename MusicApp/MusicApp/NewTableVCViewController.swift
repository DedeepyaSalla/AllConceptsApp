//
//  NewTableVCViewController.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 25/04/23.
//

import UIKit

class NewTableVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        discoverBundleAPI()
        //findAllScenarios_forProtocols()
        print("")
    }
    
    func discoverBundleAPI() {
        let bundleObj = URLSnBundles()
        bundleObj.getResource()
    }
    
    func TestCases_TDD() {
        let greetings = Greetings()
        greetings.greetMsg(firstName: nil, lastName: nil)
    }
    
    func all_TestCases() { //don't delete any function from here, whatever function you want to test -- just copy n paste in viewDidLoad
        R_N_D_Properties()
        basicSyntaxes()
        test_structs()
        findAllScenarios_forProtocols()
    }
    
    func findAllScenarios_forProtocols() {
        let strctObj = protocol_tests()
        strctObj.printAll_ProtocolsFunctions()
    }

    func test_structs() {
        /*
         -- short - immutable structs (declared with let), mutable structs (declared with var)
         -- mutating - even it its mutable struct (you can only change the properties of it from outside, not within it -- so add this to the function which tries to change its own properties
         -- struct provides default initiazer - so its okay even if you don't initialize when you declare struct
         eg: let note = Note(noteId: UUID(), fieldName: "", observationInField: "", notePriority: 10)
         you cannot declare -- let note = Note()
         you will get compiler error - so value initialization will happen eventually
         -- but for clases, default init is not provided. so compiler forces you to initialize either within init or outside, but must be initialized or must be optional
         */
        
        //----immutable structs -- these are called as immutable structs
        let note = Note(noteId: UUID(), fieldName: "", observationInField: "", notePriority: 10)
        print(note.notePriority)
        
        //-- just like properties, when you declare struct as let, its state can be set only once - it means once its initializatio is finished, you can modify its proprties (even if its property is var -- its property is var, but its parent is not var - so you cannot modify it through its parent. Below err occurs if you do that
       // note.fieldName = "changing" // Err- Cannot assign to property: 'fieldName' is a 'let' constant
        
        //-- Note: immutable structs does not lazy - because lazy means initializing them when using, so when we use struct instance -- already its state is set and once set you cannot modify it in anywayv(in that state all properties are initilzd n lazy is not initilzd -- so that is the state -- so if are using lazy it means you are trying to change that struct state (setting value to lazy property, but in 1st state lazy does not have property so it should be like that only-- that is why lazy proeprties are not supported
        
        var notesList: [Note] = []
        for item in 0...10 {
             let note = Note(noteId: UUID(), fieldName: "", observationInField: "", notePriority: item)
            notesList.append(note)
        }
        
        var notesViewModel = NotesViewModel(notes: notesList)
        print(notesViewModel.highPriorityNote_lazy) // Note:10
        print(notesViewModel       .highPriority_computed) // Note: 10
        
        notesViewModel.notes.append(Note(noteId: UUID(), fieldName: "", observationInField: "", notePriority: 40))
        
        //--if you observe, once lazy is set its same whenever we call but for computed it computes every single time
        print(notesViewModel.highPriorityNote_lazy) // Note:10
        print(notesViewModel       .highPriority_computed) // Note:40
        
        //--mutating functions
        notesViewModel.modifyNotes()
        print(notesViewModel.notes.count)
        print("")
    }

    func R_N_D_Properties() {
        let circle = circle()
        circle.radius = 25
        circle.area = 40
        circle.radiusObserver = 5
        print(circle.lazyArea)
        print(circle.lazyArea_closure)
        print(circle.radius)
        print(circle.area)
        print(circle.lazyArea)
        print(circle.lazyOptionalArea)
    }
    
    func basicSyntaxes() {
        var constSample = 9 // - type inference - here type is set as Int, so you can only add Int while modifying
        
        //-- data type conversions, property declaration syntax
        let radius: Int = 10
        let doubleRadius = Double(radius * radius)
        let str = "abcdef"
        let strArray = Array(str)
        print(strArray) //- ["a", "b", "c", "d", "e", "f"]
        
        print("radius \(constSample)") // - string interpolation - can use to insert constants, variables, literals, and expressions into longer strings.Makes it easy to create custom string values for display(UI), storage(store in local or db), and printing
        
    }
    
    func keyword_Syntaxes() {
       //--CustomDebugStringConvertible
    }
}
