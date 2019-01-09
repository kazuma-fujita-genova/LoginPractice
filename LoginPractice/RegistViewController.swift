//
//  RegistViewController.swift
//  LoginPractice
//
//  Created by 藤田和磨 on 2019/01/08.
//  Copyright © 2019 藤田和磨. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields

class RegistViewController: UIViewController {

    var allTextFieldControllers = [MDCTextInputControllerUnderline]()
    
    @IBOutlet weak var nicknameTextField: MDCTextField! {
        didSet {
            // nicknameTextField.autocapitalizationType = .words
            let nicknameFieldController = MDCTextInputControllerUnderline(textInput: nicknameTextField)
            nicknameFieldController.placeholderText = "ニックネーム"
            // nicknameFieldController.helperText = "10文字以内"
            self.allTextFieldControllers.append(nicknameFieldController)
        }
    }
    
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
        self.title = "新規アカウント作成"
        // self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "作成", style: .done, target: self, action: #selector(handleCreatelButton(_:forEvent:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "戻る", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))
    }
    
    // ナビゲーションバーの作成ボタンがタップされた時に呼ばれるメソッド
    @objc func handleCreatelButton(_ sender: UIButton, forEvent event: UIEvent) {
        let authViewController = AuthViewController(nibName: "AuthViewController", bundle: nil)
        self.navigationController?.show(authViewController, sender: nil)
    }
    
    // ナビゲーションバーのキャンセルタップされた時に呼ばれるメソッド
    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.navigationController?.popViewController(animated: true)
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
