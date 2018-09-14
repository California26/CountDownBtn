
//
//  Timer+Extention.swift
//  CountDownButton
//
//  Created by 徐孟林 on 2018/9/13.
//  Copyright © 2018年 徐孟林. All rights reserved.
//  https://www.jianshu.com/p/3551d45427a4


import Foundation
fileprivate class TimerAction {
    var timeHandler: (Timer) -> Void
    
    init(handler: @escaping (Timer) -> Void) {
        self.timeHandler = handler
    }
}

/// 不用考虑循环引用的计时器
extension Timer {
    class func newScheduledTimer(interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Void) -> Timer {
        if #available(iOS 10.0, *) {
            return Timer.scheduledTimer(withTimeInterval: interval, repeats: repeats, block: block)
        }
        return Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(app_timerAction(_:)), userInfo: TimerAction(handler: block), repeats: repeats)
    }
    
    @objc class func app_timerAction(_ sender: Timer) {
        if let block = sender.userInfo as? TimerAction {
            block.timeHandler(sender)
        }
    }
}



