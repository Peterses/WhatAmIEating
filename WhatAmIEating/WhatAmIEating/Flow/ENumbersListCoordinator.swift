//
//  ENumbersListCoordinator.swift
//  WhatAmIEating
//
//  Created by Peterses on 12/04/2021.
//

import UIKit

class ENumbersListCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.start()
    }
    
    func start() {
        let vc = ENumbersListVC()
        vc.tabBarItem = UITabBarItem(title: "E-symbols", image: UIImage(systemName: "text.book.closed"), selectedImage: UIImage(systemName: "text.book.closed.fill"))
        navigationController.pushViewController(vc, animated: false)
    }
    
}
