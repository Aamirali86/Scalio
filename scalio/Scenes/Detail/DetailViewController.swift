//
//  DetailViewController.swift
//  scalio
//
//  Created by Amir on 27/11/2020.
//  Copyright © 2020 Scalio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK:- Properties
    
    @IBOutlet private var header: UILabel!
    @IBOutlet private var body: UITextView!
    private let viewModel: DetailViewModelType

    //MARK:- Init
    
    init?(coder: NSCoder, viewModel: DetailViewModelType) {
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
    
    //MARK:- Private
    
    private func setupUI() {
        title = viewModel.id
        header.text = viewModel.header
        body.text = viewModel.body
    }

}
