//
//  AuthViewController.swift
//  LoginPractice
//
//  Created by 藤田和磨 on 2019/01/08.
//  Copyright © 2019 藤田和磨. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // NavigationBar設定
        self.title = "確認コード入力"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ログイン", style: .done, target: self, action: #selector(handleLoginButton(_:forEvent:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))
    }

    // Navigation Barの確認ボタンがタップされた時に呼ばれるメソッド
    @objc func handleLoginButton(_ sender: UIButton, forEvent event: UIEvent) {
        let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        // Push遷移
        self.navigationController?.show(profileViewController, sender: nil)
    }
    
    // Navigation Barのキャンセルタップされた時に呼ばれるメソッド
    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.dismiss(animated: true, completion: nil)
    }
}
