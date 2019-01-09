//
//  TabBarViewController.swift
//  LoginPractice
//
//  Created by 藤田和磨 on 2019/01/08.
//  Copyright © 2019 藤田和磨. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let registViewController = RegistViewController(nibName: "RegistViewController", bundle: nil)
        let registRootViewController = UINavigationController(rootViewController: registViewController)
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        let loginRootViewController = UINavigationController(rootViewController: loginViewController)
        setViewControllers([loginRootViewController, registRootViewController], animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
