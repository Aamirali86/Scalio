//
//  DetailViewModel.swift
//  scalio
//
//  Created by Amir on 30/11/2020.
//  Copyright © 2020 Scalio. All rights reserved.
//

import Foundation

protocol DetailViewModelType {
    var id: String? { get }
    var header: String { get }
    var body: String { get }
}

class DetailViewModel: DetailViewModelType {
    private var element: TestElement
    
    //MARK:- Init
    
    init(element: TestElement) {
        self.element = element
    }
    
    var id: String? {
        String(element.id)
    }
    
    var header: String {
        element.title
    }
    
    var body: String {
        element.body
    }
}
