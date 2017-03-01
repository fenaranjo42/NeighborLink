//
//  ViewController.swift
//  NeighborLink
//
//  Created by Felipe Naranjo on 2/9/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set up tab bar controllers
        var viewControllers: [UIViewController] = []
        let postsVc = UIStoryboard(name: "Posts", bundle: nil).instantiateInitialViewController()
        viewControllers.append(postsVc!)
        self.viewControllers = viewControllers
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        if let loginViewController = storyboard.instantiateViewController(withIdentifier: "Login") as? LoginViewController {
            self.navigationController?.present(loginViewController, animated: false, completion: nil)
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

