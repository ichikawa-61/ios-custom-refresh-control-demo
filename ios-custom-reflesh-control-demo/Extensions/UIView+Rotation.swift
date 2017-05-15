//
//  UIView+Rotation.swift
//  ios-custom-reflesh-control-demo
//
//  Created by Eiji Kushida on 2017/05/15.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

extension UIView {

    func addRotationAnimation() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = CGFloat(Double.pi / 180) * 360
        rotationAnimation.duration = 1
        rotationAnimation.repeatCount = Float.infinity
        rotationAnimation.isRemovedOnCompletion = false
        self.layer.add(rotationAnimation, forKey: nil)
    }

    func removeRotateAnimation() {
        self.layer.removeAnimation(forKey: "transform.rotation.z")
    }
}
