//
//  LoginViewModel.swift
//  LoginPractice
//
//  Created by 藤田和磨 on 2019/01/09.
//  Copyright © 2019 藤田和磨. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift
import Moya

class LoginViewModel {
    
    private func validate() -> Bool {
        // TODO: validation処理
        return false
    }
    
    func sendShortMessage(_ mobilePhoneNumber: String?) {
        
        guard let tmpMobilePhoneNumber = mobilePhoneNumber else {
            return
        }
        
        if validate() {
            return
        }
        
        // let disposeBag = DisposeBag()
        _ = Api.shared.request(RestApi.SendShortMessage(mobilePhoneNumber: tmpMobilePhoneNumber))
         .subscribe(onSuccess: { (shortMessage) in
            print(shortMessage)
            print(shortMessage.mobileTel)
            
            // Realmインスタンス取得
            let realm = try! Realm()
            let obj = TempMobilePhoneNumber()
            // obj.tempMobilePhoneNumber = tempMobilePhoneNumber
            // データを更新
            //try! realm.write() {
            //    obj.name = "First"
            //}

            //let mobilePhoneNumberClass = TempMobilePhoneNumber()
            //mobilePhoneNumber.tempMobilePhoneNumber =
         // let endUser = EndUser()
         
        }) { (error) in
            // TODO: Alertエラー処理
            print(error.localizedDescription)
        }
        //.disposed(by: disposeBag)
 
        /*
        let disposeBag = DisposeBag()
        let provider = MoyaProvider<MultiTarget>()
        provider.rx.request(MultiTarget(
                RestApi.SendShortMessage(mobilePhoneNumber: tmpMobilePhoneNumber))
            ).subscribe { event in
            switch event {
            case let .success(response):
                let data = response.data
                do {
                    let shortMessage:ShortMessage = try JSONDecoder().decode(ShortMessage.self, from: data)
                    print("mobile tel:\(shortMessage.mobileTel)")
                } catch let error {
                    print("json error: \(error.localizedDescription)")
                }
                
                // TODO: DEBUG
                // let statusCode = response.statusCode
                // if let stringString = String(bytes: data, encoding: .utf8) {
                //    print("data: \(stringString)")
                // }
                // print("success: \(statusCode)")

            case let .error(error):
                print("error: \(error.localizedDescription)")
            }
        }.disposed(by: disposeBag)
        */
    }
}
