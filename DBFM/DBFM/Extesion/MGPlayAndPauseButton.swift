//
//  MGPlayAndPauseButton.swift
//  DBFM
//
//  Created by ming on 16/5/5.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGPlayAndPauseButton: UIButton {
    var isPlay: Bool = true
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: "setPlayAndPauseButtonBackImage", forControlEvents: .TouchUpInside)
    }
    
    @objc func setPlayAndPauseButtonBackImage() {
        isPlay = !isPlay
        if isPlay {
            setBackgroundImage(UIImage(named: "player_btn_pause_normal"), forState: .Normal)
            setBackgroundImage(UIImage(named: "player_btn_pause_highlight"), forState: .Highlighted)
        }else {
            setBackgroundImage(UIImage(named: "player_btn_play_normal"), forState: .Normal)
            setBackgroundImage(UIImage(named: "player_btn_play_highlight"), forState: .Highlighted)
        }
    }

}
