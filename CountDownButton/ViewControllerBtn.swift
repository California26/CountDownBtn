//
//  ViewControllerBtn.swift
//  CountDownButton
//
//  Created by 徐孟林 on 2018/9/14.
//  Copyright © 2018年 徐孟林. All rights reserved.
//

import UIKit

class ViewControllerBtn: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "添加倒计时"
        let getCode = QBCountDownButton.init(dutation: 60, buttonClicked: { [weak self] (sender) in
            self?.onClickGetCode(sender)
            }, countDownStart: { (_) in
        }, countDownUnderway: { (_, count) in
            print(count)
        }, countDownCompletion: { (_) in
            print("倒计时完成")
        })
        
        getCode.frame = CGRect(x: 150, y: 350, width: 100, height: 40)
        getCode.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        getCode.setTitleColor(UIColor.gray, for: .normal)
        getCode.setTitle("获取验证码", for: .normal)
        view.addSubview(getCode)
        
    }

    
    func onClickGetCode(_ sender: QBCountDownButton) {
        print("倒计时开始")
        sender.startCountDown()
    }
    
    deinit {
        print("倒计时结束，控制器销毁")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
