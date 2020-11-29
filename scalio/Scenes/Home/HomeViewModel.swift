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
    var showAlert: Observable<Bool> { get }
    var errorMessage: Driver<String> { get }
    func fetchData(with id: Int)
}

class HomeViewModel: HomeViewModelType {
    //MARK:- Properties
    
    private let service: TestAPI
    private let bag = DisposeBag()
    private let coordinator: HomeCoordinatorType
    private let _isLoading = PublishSubject<Bool>()
    private let _errorMessage = PublishSubject<String>()
    private let _showAlert = PublishSubject<Bool>()

    var isLoading: Driver<Bool> {
        _isLoading
            .asDriver(onErrorJustReturn: false)
    }
    
    var showAlert: Observable<Bool> {
        _showAlert
            .asObservable()
    }
    
    var errorMessage: Driver<String> {
        _errorMessage
            .asDriver(onErrorJustReturn: "Unknown error")
    }

    //MARK:- Init

    init(service: TestAPI, coordinator: HomeCoordinatorType) {
        self.service = service
        self.coordinator = coordinator
    }
    
    //MARK:- Functions
    
    func fetchData(with id: Int) {
        _isLoading.onNext(true)
        service.requestTestAPI(with: id)
            .filterSuccessfulStatusCodes()
            .map(TestElement.self)
            .subscribe(onNext: { [weak self] element in
                self?.coordinator.navigateToDetailScreen(with: element)
                self?._isLoading.onNext(false)
            }, onError: { [weak self] error in
                self?._isLoading.onNext(false)
                self?._errorMessage.onNext(error.localizedDescription)
                self?._showAlert.onNext(true)
            })
            .disposed(by: bag)
    }
}
