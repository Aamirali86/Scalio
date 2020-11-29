//
//  HomeViewModel.swift
//  scalio
//
//  Created by Amir on 27/11/2020.
//  Copyright © 2020 Scalio. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeViewModelType {
    func fetchData()
}

class HomeViewModel: HomeViewModelType {
    private let service: TestAPI
    private let bag = DisposeBag()
    private let coordinator: HomeCoordinatorType

    init(service: TestAPI, coordinator: HomeCoordinatorType) {
        self.service = service
        self.coordinator = coordinator
    }
    
    func fetchData() {
        service.requestTestAPI()
            .filterSuccessfulStatusCodes()
            .map(TestElement.self)
            .subscribe(onNext: { [weak self] element in
                self?.coordinator.navigateToDetailScreen(with: element)
            })
            .disposed(by: bag)
    }
}
