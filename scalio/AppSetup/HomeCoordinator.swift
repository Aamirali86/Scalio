//
//  HomeCoordinator.swift
//  scalio
//
//  Created by Amir on 27/11/2020.
//  Copyright © 2020 Scalio. All rights reserved.
//

import UIKit

protocol HomeCoordinatorType: class {
    func navigateToDetailScreen(with element: TestElement)
}

/// `HomeCoordinator` is responsible to manage transition for home flow.
class HomeCoordinator: BaseCoordinator<UINavigationController> {
    override func start() {
        let viewController = HomeViewBuilder(coordinator: self).build()
        rootViewController.pushViewController(viewController, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorType {
    func navigateToDetailScreen(with element: TestElement) {
        let viewController = DetailViewBuilder(element: element).build()
        rootViewController.pushViewController(viewController, animated: true)
    }
}
