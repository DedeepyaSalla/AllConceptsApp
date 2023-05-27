//
//  DownloadAudiosVC.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 24/05/23.
//

import UIKit

class DownloadAudiosVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
        // Do any additional setup after loading the view.
    }
    
    func initialSetUp() {
        uiSetUp()
    }
    
    /*
     no need of global access, so why outlet n why make it global
     */
    func uiSetUp() {
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SongCelllTableViewCell", bundle: nil), forCellReuseIdentifier: "songcell")
       // tableView.register(ImageCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    @IBAction func DownloadAudioClick(_ sender: Any) {
        let musicService = MusicService(searchTerm: "Do")
        let network = APIURLSessionLayer()
        network.getAPIImprovised_1(url: musicService.url) { result in
            print(result)
        }
    }
}


extension DownloadAudiosVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = ImageCell()
       // let cellName = "testCell"//"ImageReuseCell"
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) //as! ImageCell
//        cell.textLabel?.text = "textla fdafd"
//        cell.detailTextLabel?.text = "fdasfds"
        let cell = tableView.dequeueReusableCell(withIdentifier: "songcell", for: indexPath) as! SongCelllTableViewCell
//        cell.bigImageView.image = UIImage(named: "Flower.jpeg") //UIImageView(image: UIImage(named: "Flower"))
//        cell.iconImageView.image = UIImage(named: "Flower.jpeg")//UIImageView(image: UIImage(named: "Flower"))
//        cell.descriptionLabel.text = "keep one line for now"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}
