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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
