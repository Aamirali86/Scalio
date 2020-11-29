//
//  HomeViewBuilder.swift
//  scalio
//
//  Created by Amir on 27/11/2020.
//  Copyright © 2020 Scalio. All rights reserved.
//

import UIKit
import Moya

class HomeViewBuilder: ViewControllerBuilder {
    private weak var coordinator: HomeCoordinatorType?
    
    init(coordinator: HomeCoordinatorType) {
        self.coordinator = coordinator
    }
    
    func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        
        let apiService = MoyaProvider<TestAPIResource>()
        guard let coordinator = coordinator else { return UIViewController() }
        let viewModel = HomeViewModel(service: apiService, coordinator: coordinator)
        let controller = storyboard.instantiateInitialViewController {
            HomeViewController(coder: $0, viewModel: viewModel)
        }
        
        guard let homeViewController = controller else {
            fatalError("Failed to load HomeViewController from storyboard.")
        }
        return homeViewController
    }
}
