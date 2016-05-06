//
//  MGChannelViewController.swift
//  DBFM
//
//  Created by ming on 16/5/3.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

// MARK:- <MGChannelViewControllerDelegate>
protocol MGChannelViewControllerDelegate: NSObjectProtocol{
    func onChangeChannelForSelectRow(channel_id_str: String)
}



class MGChannelViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var channelData = []
    var delegate: MGChannelViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.alpha = CGFloat(0.7)

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: channelCellIdentifier)
    }

}

// MARK:- <UITableViewDataSource,UITableViewDelegate>
let channelCellIdentifier = "channelCellIdentifier"
extension MGChannelViewController: UITableViewDataSource,UITableViewDelegate{
    // MARK:- UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.channelData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(channelCellIdentifier)
        let rowData = self.channelData[indexPath.row] as! [String: AnyObject]
    
        if let name = rowData["name"] as? String {
            cell?.textLabel!.text = name
        }
        
        return cell!
    }
    
    // MARK:- UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let rowData = self.channelData[indexPath.row] as! [String: AnyObject]
        if let channel_id = rowData["channel_id"] as? String{
            delegate?.onChangeChannelForSelectRow(channel_id)
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /**
    *   添加cell滚动的动画
    */
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        // 防止重复添加动画
        cell.layer.removeAnimationForKey("music");
        let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.y")
        keyframeAnimation.values = [(-2),(-1),(1),(2)];
        keyframeAnimation.duration = 0.3
        
        cell.layer.addAnimation(keyframeAnimation, forKey: "music")
    }
}