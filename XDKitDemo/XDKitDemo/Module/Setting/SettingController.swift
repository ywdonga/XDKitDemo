//
//  SettingController.swift
//  XDKitDemo
//
//  Created by dyw on 2022/4/27.
//

import UIKit
import TangramKit
import RxCocoa

class SettingController: UIViewController {
    let scrollView = UIScrollView()
    let listView = TGLinearLayout(.vert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
        let loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("登录", for: UIControl.State.normal)
        loginBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        _ = loginBtn.rx.tap.subscribe {[weak self] _ in
            self?.navigationController?.pushViewController(LoginController(), animated: true)
        }

        loginBtn.tg_left ~= 10
        loginBtn.tg_right ~= 10
        loginBtn.tg_height ~= 40
        listView.addSubview(loginBtn)
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        scrollView.addSubview(listView)
        listView.snp.makeConstraints { make in
            make.edges.equalTo(0)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView.snp_height).offset(0)
        }
    }
    
}
