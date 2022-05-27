//
//  HomeController.swift
//  XDKitDemo
//
//  Created by dyw on 2022/4/27.
//

import UIKit
import RxDataSources

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
     
        
    }
    

    lazy var tableView: UITableView = {
       let view = UITableView()
        return view
    }()

}
