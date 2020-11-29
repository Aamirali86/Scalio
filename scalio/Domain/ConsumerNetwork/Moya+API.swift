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

/// `TestAPI` is a wrapper over Moya provider.
protocol TestAPI {
    func requestTestAPI(with id: Int) -> Observable<Response>
}

extension MoyaProvider: TestAPI {
    func requestTestAPI(with id: Int) -> Observable<Response> {
        let targetType = TestAPIResource(id: id)
        return self.rx.request(targetType as! Target)
            .asObservable()
    }
}
