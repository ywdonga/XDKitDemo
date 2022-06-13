//
//  HomeController.swift
//  XDKitDemo
//
//  Created by dyw on 2022/4/27.
//

import UIKit
import RxDataSources
import SnapKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        let label = XDLabel()
        label.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
        label.backgroundColor = UIColor.red
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.top.equalTo(100)
        }
        
        label.text = "asdaidhaudhasydfas"
        
    }
    

    lazy var tableView: UITableView = {
       let view = UITableView()
        return view
    }()

}
