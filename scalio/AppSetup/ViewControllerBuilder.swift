//
//  ViewControllerBuilder.swift
//  scalio
//
//  Created by Amir on 27/11/2020.
//  Copyright © 2020 Scalio. All rights reserved.
//

import UIKit

/// `ViewControllerBuilder` is responsible to create view controllers.
protocol ViewControllerBuilder {
    func build() -> UIViewController
}
