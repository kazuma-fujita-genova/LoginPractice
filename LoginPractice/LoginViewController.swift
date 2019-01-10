//
//  LoginViewController.swift
//  LoginPractice
//
//  Created by 藤田和磨 on 2019/01/08.
//  Copyright © 2019 藤田和磨. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields

class LoginViewController: UIViewController {

    var allTextFieldControllers = [MDCTextInputControllerUnderline]()
    private let loginViewModel = LoginViewModel()
    
    @IBOutlet weak var mobilePhoneNumberTextField: MDCTextField! {
        didSet {
            // 10キー表示
            mobilePhoneNumberTextField.keyboardType = UIKeyboardType.numberPad
            let mobileTelFieldController = MDCTextInputControllerUnderline(textInput: mobilePhoneNumberTextField)
            mobileTelFieldController.placeholderText = "携帯電話番号"
            // mobileTelFieldController.helperText = "ハイフンなし"
            self.allTextFieldControllers.append(mobileTelFieldController)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        // NavigationBar設定
        self.title = "ログイン"
        // self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "送信", style: .done, target: self, action: #selector(handleSendCodeButton(_:forEvent:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "戻る", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))
    }

    // ナビゲーションバーの送信ボタンがタップされた時に呼ばれるメソッド
    @objc func handleSendCodeButton(_ sender: UIButton, forEvent event: UIEvent) {
        
        // SMS送信処理
        // loginViewModel.sendShortMessage(mobilePhoneNumberTextField.text)
        loginViewModel.sendShortMessage("09036404732")
        
        // 確認コード入力画面へプッシュ遷移
        //let authViewController = AuthViewController(nibName: "AuthViewController", bundle: nil)
        //self.navigationController?.show(authViewController, sender: nil)
    }
    
    
    // ナビゲーションバーのキャンセルタップされた時に呼ばれるメソッド
    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.navigationController?.popViewController(animated: true)
    }
}
