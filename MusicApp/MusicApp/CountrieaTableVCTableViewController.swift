//
//  CountrieaTableVCTableViewController.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 25/04/23.
//

import UIKit

class CountrieaTableVCTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        R_N_D_Properties()
    }
    
    func R_N_D_Properties() {
        let circle = circle()
        circle.radius = 10
        // storedProperty (can be let or var) - radius is  - because its just storing value , not computing anything
        
        print("radiuds")
    }
    
    func basicSyntaxes() {
        var constSample = 9 // - type inference - here type is set as Int, so you can only add Int while modifying
        print("radius \(constSample)") // - string interpolation - can use to insert constants, variables, literals, and expressions into longer strings.Makes it easy to create custom string values for display(UI), storage(store in local or db), and printing
        
        
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        return cell
        
        return cell
    }
}
