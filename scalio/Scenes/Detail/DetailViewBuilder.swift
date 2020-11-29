//
//  DetailViewBuilder.swift
//  scalio
//
//  Created by Amir on 29/11/2020.
//  Copyright © 2020 Scalio. All rights reserved.
//

import UIKit

class DetailViewBuilder: ViewControllerBuilder {
    private let element: TestElement
    
    init(element: TestElement) {
        self.element = element
    }
    
    func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle.main)
        
        let viewModel = DetailViewModel(element: element)
        let controller = storyboard.instantiateInitialViewController {
            DetailViewController(coder: $0, viewModel: viewModel)
        }
        
        guard let detailViewController = controller else {
            fatalError("Failed to load DetailViewController from storyboard.")
        }
        return detailViewController
    }
}
