//
//  HomeViewController.swift
//  scalio
//
//  Created by Amir on 27/11/2020.
//  Copyright © 2020 Scalio. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK:- Properties
    
    let viewModel: HomeViewModelType
    @IBOutlet private var textfield: UITextField!

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
    }

    //MARK:- Actions
    
    @IBAction private func didTapSendButton() {
        viewModel.fetchData()
    }
    
    //MARK:- Private
    
    private func setupUI() {
        textfield.keyboardType = .numberPad
    }
}
