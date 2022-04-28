//
//  MineTabBarController.swift
//  XDKitDemo
//
//  Created by dyw on 2022/4/27.
//

import UIKit

class MineTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let homeNav = { () -> UINavigationController in
            let nav = UINavigationController(rootViewController: HomeController())
            nav.tabBarItem = UITabBarItem(title: "首页", image: nil, selectedImage: nil)
            return nav
        }()
        
        let settingNav = { () -> UINavigationController in
            let nav = UINavigationController(rootViewController: SettingController())
            nav.tabBarItem = UITabBarItem(title: "设置", image: nil, selectedImage: nil)
            return nav
        }()
        
        let vcList = [homeNav, settingNav]
        setViewControllers(vcList, animated: true)
    }

}
