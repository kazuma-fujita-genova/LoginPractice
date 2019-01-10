//
//  Api.swift
//  LoginPractice
//
//  Created by 藤田和磨 on 2019/01/08.
//  Copyright © 2019 藤田和磨. All rights reserved.
//

import Moya
import RxSwift

extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

class Api {
    static let shared = Api()
    // Stabを返却
    // private let provider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.immediatelyStub)
    // n秒後にStabを返却
    // private let provider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.delayedStub(n))
    // 通常のAPI通信
    private let provider = MoyaProvider<MultiTarget>()
    
    func request<R>(_ request: R) -> Single<R.Response> where R: RestApiTargetType {
        let target = MultiTarget(request)
        return provider.rx.request(target)
            .filterSuccessfulStatusCodes()
            .map(R.Response.self)
    }
}

protocol RestApiTargetType: TargetType {
    associatedtype Response: Codable
}

extension RestApiTargetType {
    var baseURL: URL { return URL(string: "http://172.16.0.236:8000/v1")! }
    var headers: [String : String]? {
        return ["X-API-Key":"r01zuB9dr2tc07JXZnrFyAeQ3PH9YS7CIcNQs1t0aqRxIAlN2w4LxBaGBm6NPo2e"]
    }
    var sampleData: Data {
        let path = Bundle.main.path(forResource: "short_message", ofType: "json")!
        return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
    }
}

enum RestApi {
    
    struct SendShortMessage: RestApiTargetType {
        
        typealias Response = ShortMessage
        
        var method: Moya.Method { return .post }
        var path: String { return "/users/short_message/" }
        // var task: Task { return .requestPlain }
        var task: Task {
            return .requestParameters(parameters: ["mobile_tel": mobilePhoneNumber], encoding: URLEncoding.default)
        }
        
        let mobilePhoneNumber: String

        init(mobilePhoneNumber: String) {
            self.mobilePhoneNumber = mobilePhoneNumber
        }
    }
}
