//
//  TabBarController.swift
//  Bartainment
//
//  Created by Zack Esm on 4/27/19.
//  Copyright © 2019 HackFest. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let barVC = UINavigationController(rootViewController: BarViewController())
        barVC.tabBarItem = UITabBarItem(title: "Bar", image: nil, tag: 0)
        
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EntertainerViewController")
        
        let entertainerVC = UINavigationController(rootViewController: viewController)
        entertainerVC.tabBarItem = UITabBarItem(title: "Entertainer", image: nil, tag: 1)
        
        let viewControllerList = [barVC, entertainerVC]
        viewControllers = viewControllerList
        
        selectedIndex = 0
    }

}
