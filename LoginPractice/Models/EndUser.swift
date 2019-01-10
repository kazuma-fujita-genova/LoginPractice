//
//  EndUser.swift
//  LoginPractice
//
//  Created by 藤田和磨 on 2019/01/09.
//  Copyright © 2019 藤田和磨. All rights reserved.
//

import RealmSwift

class EndUser : Object {
    // プライマリーキー
    // @objc dynamic var id = 0

    // id をプライマリーキーとして設定
    // override static func primaryKey() -> String? {
    //    return "id"
    // }

    @objc dynamic var authorization = ""
    
    @objc dynamic var mobilePhoneNumber = ""
    
    // mobilePhoneNumber をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "mobilePhoneNumber"
    }
}
