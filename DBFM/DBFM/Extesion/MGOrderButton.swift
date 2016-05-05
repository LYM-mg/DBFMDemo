//
//  MGOrderButton.swift
//  DBFM
//
//  Created by ming on 16/5/5.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGOrderButton: UIButton {
    var orderIndex: UInt = 1

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: "onClick", forControlEvents: .TouchUpInside)
    }
    
    @objc func onClick()
    {
        self.enabled = false
        self.addSubview(tipLabel)
        tipLabel.alpha = 0.0
        let scale = CGAffineTransformMakeScale(0, 0)
        let translation  = CGAffineTransformMakeTranslation(0, -100)
        tipLabel.transform = CGAffineTransformConcat(scale, translation)
        
        orderIndex++
        if orderIndex > 3 {
            orderIndex = 1
        }
        switch(orderIndex)
        {
            case 1:
                setBackgroundImage(UIImage(named: "order1"), forState: .Normal)
                tipLabel.text = "顺序播放"
            case 2:
                setBackgroundImage(UIImage(named: "order2"), forState: .Normal)
                tipLabel.text = "随机播放"
            case 3:
                setBackgroundImage(UIImage(named: "order3"), forState: .Normal)
                tipLabel.text = "单曲播放"
            default:
                "default"
        }
        
        UIView.animateWithDuration(2.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 8, options: UIViewAnimationOptions.TransitionFlipFromTop, animations: { () -> Void in
                self.tipLabel.alpha = 1.0
                self.tipLabel.transform = CGAffineTransformIdentity
            }) { (_) -> Void in
                self.enabled = true
                self.tipLabel.removeFromSuperview()
        }
    }
    
    // MARK:- lazy
    /** */
    private lazy var tipLabel: UILabel = {
        let lb = UILabel(frame: CGRectMake(-30, -30, 100, 30))
        lb.backgroundColor = UIColor.blackColor()
        lb.textAlignment = NSTextAlignment.Center
        lb.textColor = UIColor.whiteColor()
        return lb
    }()

}
