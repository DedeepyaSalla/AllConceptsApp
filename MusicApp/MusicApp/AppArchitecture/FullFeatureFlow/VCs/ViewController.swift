//
//  ViewController.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 25/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   var test = check_without_Inti_calss
     //   print(test.age)
        initialSetUp()
        // Do any additional setup after loading the view.
    }
    
    func initialSetUp() {
        uiSetUp()
        getDataFromAllApis()
    }
    
    func uiSetUp() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: imageCell, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
       // tableView.register(ImageCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func getDataFromAllApis() {
        let network = TestNetwork()
        let urlStr = "https://api.unsplash.com/search/photos?query=puppies"
        /*
         network.getAPI_1(url: urlStr)
         network.getAPI_2(url: urlStr) { data, err in
             print("api call finished")
         }
         */
        network.downloadAPI_1(url:urlStr) { data, err in
            print("api call finished")
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = ImageCell()
       // let cellName = "testCell"//"ImageReuseCell"
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) //as! ImageCell
//        cell.textLabel?.text = "textla fdafd"
//        cell.detailTextLabel?.text = "fdasfds"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ImageCell
        cell.bigImageView.image = UIImage(named: "Flower.jpeg") //UIImageView(image: UIImage(named: "Flower"))
        cell.iconImageView.image = UIImage(named: "Flower.jpeg")//UIImageView(image: UIImage(named: "Flower"))
        cell.descriptionLabel.text = "keep one line for now"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}
