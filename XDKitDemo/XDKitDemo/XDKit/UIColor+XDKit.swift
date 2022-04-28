//
//  UIColor+XDKit.swift
//  XDKitDemo
//
//  Created by dyw on 2022/4/27.
//

import UIKit

extension UIColor{
    
    /// 颜色变换（可控制变换进度）
    /// - Parameters:
    ///   - fromColor: 初始颜色
    ///   - toColor: 目标颜色
    ///   - progress: 变换进度
    /// - Returns: 结果颜色
    static func color(fromColor:UIColor, toColor:UIColor, progress:CGFloat) -> UIColor {
        let progress = min(progress, 1.0)
        
        let fromRed = fromColor.xdRed()
        let fromGreen = fromColor.xdGreen()
        let fromBlue = fromColor.xdBlue()
        let fromAlpha = fromColor.xdAlpha()

        let toRed = toColor.xdRed()
        let toGreen = toColor.xdGreen()
        let toBlue = toColor.xdBlue()
        let toAlpha = toColor.xdAlpha()

        let finalRed = fromRed + (toRed - fromRed) * progress
        let finalGreen = fromGreen + (toGreen - fromGreen) * progress
        let finalBlue = fromBlue + (toBlue - fromBlue) * progress
        let finalAlpha = fromAlpha + (toAlpha - fromAlpha) * progress
        return UIColor(red: finalRed, green: finalGreen, blue: finalBlue, alpha: finalAlpha)
    }
    
    
    /// 获取红色rgb值
    /// - Returns: rbg值
    func xdRed() -> CGFloat {
        var r :CGFloat = 0
        var g :CGFloat = 0
        var b :CGFloat = 0
        var a :CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &a){
            return r
        }
        return 0
    }
  
    /// 获取绿色rgb值
    /// - Returns: rbg值
    func xdGreen() -> CGFloat {
        var r :CGFloat = 0
        var g :CGFloat = 0
        var b :CGFloat = 0
        var a :CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &a){
            return g
        }
        return 0
    }
    
    /// 获取蓝色rgb值
    /// - Returns: rbg值
    func xdBlue() -> CGFloat {
        var r :CGFloat = 0
        var g :CGFloat = 0
        var b :CGFloat = 0
        var a :CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &a){
            return b
        }
        return 0
    }
    
    /// 获取透明度rgb值
    /// - Returns: rbg值
    func xdAlpha() -> CGFloat {
        var r :CGFloat = 0
        var g :CGFloat = 0
        var b :CGFloat = 0
        var a :CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &a){
            return a
        }
        return 0
    }
}

