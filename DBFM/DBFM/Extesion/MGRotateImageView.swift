//
//  MGRotateImageView.swift
//  DBFM
//
//  Created by ming on 16/5/3.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGRotateImageView: UIImageView {
    
   required init?(coder aDecoder: NSCoder) {
    
        super.init(coder: aDecoder)
    
        setUpAttrs()
    
        startRotation()
   }
    
    /**
        图片圆形
    */
    private func setUpAttrs() {
        layer.cornerRadius = frame.width * 0.5
        layer.masksToBounds = true
        
        layer.borderWidth = 2;
        layer.borderColor = UIColor.grayColor().CGColor
    }

    /**
        旋转动画
    */
    func startRotation() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = 2 * M_PI
        
        rotateAnimation.duration = 10.0
        rotateAnimation.repeatCount = MAXFLOAT
        
        layer.addAnimation(rotateAnimation, forKey: nil)
    }
    
    func stopRotation(){
        layer.removeAllAnimations()
    }
}
