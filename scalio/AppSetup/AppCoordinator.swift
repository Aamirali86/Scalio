//
//  AppCoordinator.swift
//  scalio
//
//  Created by Amir on 27/11/2020.
//  Copyright © 2020 Scalio. All rights reserved.
//

import UIKit

/// `AppCoordinator` is responsible to manage transition at windows level.
final class AppCoordinator: BaseCoordinator<UINavigationController> {
    // MARK: - Init

    private let window: UIWindow

    // MARK: - Init

    init(window: UIWindow) {
        self.window = window
        super.init(rootViewController: .init())
    }

    // MARK: - Override

    override func start() {
        startChild(self)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
