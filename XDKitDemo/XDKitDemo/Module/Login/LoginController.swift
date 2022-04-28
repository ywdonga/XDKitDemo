//
//  LoginController.swift
//  XDKitDemo
//
//  Created by dyw on 2022/4/27.
//

import UIKit
import TangramKit
import SnapKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        let loginView = TGLinearLayout(.vert)
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.textColor = UIColor.black
        titleLabel.text = "验证码登录"
        titleLabel.tg_width ~= .wrap
        titleLabel.tg_left ~= 30
        titleLabel.tg_height ~= 33
        
        loginView.addSubview(titleLabel)
        
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
    

}
