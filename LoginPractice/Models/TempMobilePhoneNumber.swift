//
//  TempMobilePhoneNumber.swift
//  LoginPractice
//
//  Created by 藤田和磨 on 2019/01/09.
//  Copyright © 2019 藤田和磨. All rights reserved.
//

import RealmSwift

class TempMobilePhoneNumber: Object {
    
    @objc dynamic var tempMobilePhoneNumber = ""
    
    // tempMobilePhoneNumberは永続的に保存しない
    override static func ignoredProperties() -> [String] {
        return ["tempMobilePhoneNumber"]
    }
}
