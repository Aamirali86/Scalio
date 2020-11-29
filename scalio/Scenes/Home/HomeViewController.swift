//
//  HomeViewController.swift
//  scalio
//
//  Created by Amir on 27/11/2020.
//  Copyright © 2020 Scalio. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    //MARK:- Properties
    
    let viewModel: HomeViewModelType
    private let bag = DisposeBag()
    @IBOutlet private var textfield: UITextField!
    
    private lazy var loader: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .lightGray
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private lazy var alert: UIAlertController = {
        var alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        return alert
    }()

    //MARK:- Init
    
    init?(coder: NSCoder, viewModel: HomeViewModelType) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    //MARK:- Actions
    
    @IBAction private func didTapSendButton() {
        guard let text = textfield?.text, let id = Int(text) else { return }
        viewModel.fetchData(with: id)
    }
    
    //MARK:- Private
    
    private func setupUI() {
        textfield.keyboardType = .numberPad
        view.addSubview(loader)
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func bindViewModel() {
        viewModel
            .isLoading
            .drive(loader.rx.isAnimating)
            .disposed(by: bag)
        
        viewModel
            .errorMessage
            .drive(alert.rx.title)
            .disposed(by: bag)
        
        viewModel
            .showAlert
            .subscribe(onNext: { [unowned self] isShown in
                self.present(self.alert, animated: true)
            })
            .disposed(by: bag)
    }
}
