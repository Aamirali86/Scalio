//
//  TestAPIResource.swift
//  scalio
//
//  Created by Amir on 29/11/2020.
//  Copyright © 2020 Scalio. All rights reserved.
//

import Foundation
import Moya

class TestAPIResource: TargetType {
    private let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com/posts/")!
    }
    
    var path: String { "\(id)" }
    
    var method: Moya.Method { .get }
    
    var sampleData: Data { return Data() }
    
    var task: Task { .requestPlain }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}
