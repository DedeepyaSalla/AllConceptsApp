//
//  HomeViewController.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 24/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    var storyboardName: String {
        return String(describing: self.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("home")
        print(storyboardName)
        print(String(describing: self.self))
        print(String(describing: self))
        print(self)
    }
    
    // MARK: - IBActions
    @IBAction func DownloadPageClick(_ sender: Any) {
       // pushToNextVC()
        pushToNextVC_0()
    }
    @IBAction func collectionVcClick(_ sender: Any) {
    }
    
    @IBAction func SwiftBasicsPage(_ sender: Any) {
    }
    
}

// MARK: - UI Events
extension HomeViewController: storyboardLoadable {
   

    //improvised
    func pushToNextVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: "DownloadAudiosVC")
       // self.present(vc, animated: true)
        
//        let newVC = UIViewController()
//        newVC.view.backgroundColor = UIColor.red
        self.navigationController?.pushViewController(newVC, animated:
        true)
    }
    
    //hardcoded
    func pushToNextVC_0() {
        
        // Basic approach 1
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: "DownloadAudiosVC")
        //self.navigationController?.pushViewController(newVC, animated: true)
        
        // 2 -- avoid hardcoding through enums - advantage is avoids hardcoding, also does not allow developer to use names which aren't present in that group - gives compile error
        let storyboard1 = UIStoryboard(name: UINibTitles.Main.rawValue, bundle: nil)
        let newVC1 = storyboard.instantiateViewController(withIdentifier: UINibTitles.DownloadAudiosVC.rawValue)
        
        //-- 2 is better than 1st approach, string hardcoding is avoid. But loading storyboard and vc will also become duplicate code because it will be used thorghout the app for sure in many places. So if you add reusable code it will be easy - reusable code avoids errors - because only one single approach would be followed by all developers and obviously duplicate code can be avoided
        /*
         solution 3 -
         Yes you can create signlton and add all common functions there eg: trimmed string to get that - we need to call that function through singleton and pass the parameter. So extensio is more effective and it nicely divides the code
         
         Signleton -- singleton.trimmed(Str: "fdasf")
         Extension -- "fdasf".trimmed()
         
         But we have advanced extensions and protocols. So make use of them. First try to use just extensions. Because even though protocol gives default implementations, one dependency here is you must inherit that protocol or else it won't work. If you keep on creating protocol like that, after some point app becomes complicated to understand and a single class/ struct will be filled with so many protocol confirmations
         
         so first try to add reusable code with extensions and only if necessary add generic also to that extension
         
         so lets try with extension first
         */
        let testExtensionVC = self.fetch_eg(storyboardName: UINibTitles.Main.rawValue, VCId: UINibTitles.DownloadAudiosVC.rawValue)
    /*
     solution 4 -
     above solution 3 does not have duplicate code and no hardcoded values. But we add extension to extend the functionality of current type ie., we would need the type instance (current vc) inside the extension, so that we can manipulate the current instance or do something else with current vc
     But here, in above function we are don't need current vc in anyway ie., to get new vc which we are loading from storyboard does not have any dependency on current vc. So why do we need to add an extension for it. It gives the wrong message
     Also, by adding the function call in extension of vc, if we want to load that vc from anywhere else then we won't be able to load it or else unnecessarily we need create one dummy uiviewcontroller instance and call this function from it there. So this is not clean code and unnecessarily we are burding memory with unnecessary dependencies
     so next best solution is use to protocols
     */
        let testProtocolVC = fetchVC(storyboardName: UINibTitles.Main.rawValue, VCId: UINibTitles.DownloadAudiosVC.rawValue)
        self.navigationController?.pushViewController(testExtensionVC, animated: true)
    }
}

protocol storyboardLoadable {
    func fetchVC(storyboardName: String, VCId: String) -> UIViewController
}

extension storyboardLoadable {
    func fetchVC(storyboardName: String, VCId: String) -> UIViewController {
        let storyboard = self.fetchStorboard(id: storyboardName)
        return storyboard.instantiateViewController(withIdentifier: VCId)
    }
    
    func fetchStorboard(id: String) -> UIStoryboard {
        return UIStoryboard(name: id, bundle: nil)
    }
}


extension UIViewController {
    func fetchStorboard(id: String) -> UIStoryboard {
        return UIStoryboard(name: id, bundle: nil)
    }
    
    func fetch_eg(storyboardName: String, VCId: String) -> UIViewController {
        
        /*
         err: Type 'UIStoryboard' has no member 'fetch'
         reason: you cannot use direct data type to call the extension function, you can only use its instance
         let storyboard = UIStoryboard.fetch(id: storyboardId)
         */
        let storyboard = self.fetchStorboard(id: storyboardName)
        return storyboard.instantiateViewController(withIdentifier: VCId)
    }
}

enum UINibTitles: String {
    case Main
    case DownloadAudiosVC
}

//Repeated code -
class commonUIfunctions {
    
    // MARK: - Properties
    
    private static var sharedObj: commonUIfunctions = {
        let obj = commonUIfunctions()
        
        /*NetworkManager(baseURL: API.baseURL)
        
        // Configuration
        // ...
        */
        return obj
    }()
    
    private init() {}
    
    //advantage of keeping shared as separate property or function and doing initialization in private -- hides configuration visiblity to external classes
    class func shared() -> commonUIfunctions {
        return sharedObj
    }
}

