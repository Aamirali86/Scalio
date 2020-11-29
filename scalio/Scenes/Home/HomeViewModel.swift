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
    var isLoading: Driver<Bool> { get }
    func fetchData()
}

class HomeViewModel: HomeViewModelType {
    //MARK:- Properties
    
    private let service: TestAPI
    private let bag = DisposeBag()
    private let coordinator: HomeCoordinatorType
    private let _isLoading = PublishSubject<Bool>()
    
    var isLoading: Driver<Bool> {
        _isLoading
            .asDriver(onErrorJustReturn: false)
    }

    //MARK:- Init

    init(service: TestAPI, coordinator: HomeCoordinatorType) {
        self.service = service
        self.coordinator = coordinator
    }
        
    //MARK:- Functions
    
    func fetchData() {
        _isLoading.onNext(true)
        service.requestTestAPI()
            .filterSuccessfulStatusCodes()
            .map(TestElement.self)
            .subscribe(onNext: { [weak self] element in
                self?.coordinator.navigateToDetailScreen(with: element)
                self?._isLoading.onNext(false)
            })
            .disposed(by: bag)
    }
    
}
