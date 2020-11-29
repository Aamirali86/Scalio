//
//  File.swift
//  scalio
//
//  Created by Amir on 29/11/2020.
//

import Foundation
import RxSwift
import RxMoya
import Moya

protocol TestAPI {
    func requestTestAPI() -> Observable<Response>
}

extension MoyaProvider: TestAPI {
    func requestTestAPI() -> Observable<Response> {
        let targetType = TestAPIResource(id: 2)
        return self.rx.request(targetType as! Target)
            .asObservable()
    }
}
