//
//  ViewController.swift
//  DBFM
//
//  Created by ming on 16/5/3.
//  Copyright © 2016年 ming. All rights reserved.
/** 网址
"http://www.douban.com/j/app/radio/channels"
"http://douban.fm/j/mine/playlist?type=n&channel=0&from=mainsite"
*/

/// 获取到的数据
/*
channels =     (
{
"abbr_en" = My;
"channel_id" = 0;
name = "\U79c1\U4eba\U5146\U8d6b";
"name_en" = "Personal Radio";
"seq_id" = 0;
}

song =     (
{
aid = 2780049;
album = "/subject/2780049/";
albumtitle = "\U73a9\U9177(\U7279\U522b\U7248)";
"alert_msg" = "";
artist = "\U6f58\U73ae\U67cf";
"file_ext" = mp4;
kbps = 128;
length = 221;
like = 0;
picture = "http://img3.doubanio.com/lpic/s2970817.jpg";
"public_time" = 2007;
sha256 = f82fa41bf917c4ec075b4cc7dd44225f08d14edf8a8c3d370de0adbded743ef5;
sid = 1393358;
singers =             (
{
id = 15994;
"is_site_artist" = 0;
name = "\U6f58\U73ae\U67cf";
"related_site_id" = 0;
}
);
ssid = 56bb;
status = 0;
subtype = "";
title = "\U8def\U592a\U5f2f";
url = "http://mr7.doubanio.com/828e1d2f80b00df70bda1a1a7083e4b7/0/fm/song/p1393358_128k.mp4";
}
*/

import UIKit
import AVFoundation

class ViewController: UIViewController{
    // MARK:- storyboard拖出来的属性
    /** 背景 */
    @IBOutlet weak var backImageView: UIImageView!
    /** 旋转的专辑图片的ImageView */
    @IBOutlet weak var rotateImageView: MGRotateImageView!
    /** 负责歌曲进度时间 */
    @IBOutlet weak var playTimeLabel: UILabel!
    
    /** 负责歌曲进度的显示的View的宽度的约束 */
    @IBOutlet weak var progressWidth: NSLayoutConstraint!
    /** 负责歌曲进度的显示的View */
    @IBOutlet weak var progressView: UIImageView!
    
    /** 播放顺序按钮 */
    @IBOutlet weak var orderBtn: MGOrderButton!
    /** 播放暂停按钮 */
    @IBOutlet weak var playORpauseBtn: UIButton!
    /** 负责展示电台歌曲的View */
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- 自定义出来的属性
    /** 电台歌曲数组 */
    var songData = []
    /** 频道数组 */
    var channelData = []
    /** 负责播放音效的播放器 */
    var player: AVPlayer = {
        let playerItem = AVPlayerItem(URL: NSURL(string: "http://mr7.doubanio.com/325fc1313dcffb256a2104c57f6619da/0/fm/song/p727015_128k.mp4")!)
        let player = AVPlayer(playerItem: playerItem)
        return player
    }()
//    var player: AVAudioPlayer = AVAudioPlayer()
    
    /** 当前在播放第几首 */
    var currentSongIndex:Int = 0
    /** 是否自动播放到下一首 */
    var isAutoFinish:Bool = true
    /** 定时器 */
    var timer: NSTimer?
    /** 网络操作类的实例 */
    var httpControl: HttpController = HttpController()
    
    // MARK:- 控制器生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.clearColor()
       
        rotateImageView.startRotation()
        
        // 设置图片模糊(毛玻璃)效果（自定义一个控件，iOS8.0以后的属性）
        let effect = UIVisualEffect()
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame.size = CGSizeMake(view.frame.width, view.frame.height)
        backImageView.addSubview(effectView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
//        tableView.tableFooterView = UIView()
        
        httpControl.delegate = self
        // 获取频道数据
        httpControl.onSearch("http://www.douban.com/j/app/radio/channels")
        httpControl.onSearch("http://douban.fm/j/mine/playlist?type=n&channel=0&from=mainsite")
        
        //播放结束通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "songPlayFinish", name: AVPlayerItemTimeJumpedNotification , object: player)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "songPlayFinish", name: AVPlayerItemDidPlayToEndTimeNotification , object: player)
    }
    
    /** 人为结束的三种情况
        1 点击上一首，下一首按钮  2 选择了频道列表的时候  3 点击了歌曲列表中的某一行的时候
    */
    // 歌曲播放完毕的通知
    func songPlayFinish() {
        if isAutoFinish { // 自动播放至下一首
            switch(orderBtn.orderIndex){
                case 1: //顺序播放
                    currentSongIndex++
                    if currentSongIndex >= songData.count {
                        currentSongIndex = 0
                    }
                    onSelectRowIndex(currentSongIndex)
                case 2: //随机播放
                    currentSongIndex = random() % songData.count
                    onSelectRowIndex(currentSongIndex)
                case 3: //单曲循环
                    onSelectRowIndex(currentSongIndex)
                default:
                    "default"
                
            }
        }else{ // 人为使播放结束
            isAutoFinish = true
        }
    }
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    /** rewrite，顺传（当前控制器给频道控制器传数据）*/
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let channelVC = segue.destinationViewController as! MGChannelViewController
        channelVC.delegate = self
        channelVC.channelData = self.channelData
    }
    
    // MARK:- 按钮点击操作
    /** 上一首按钮操作 */
    @IBAction func preBtnClick(btn: UIButton) {
        isAutoFinish = false
        currentSongIndex--
        if currentSongIndex < 0{
            currentSongIndex = songData.count - 1
        }
         onSelectRowIndex(currentSongIndex)
    }
    
    /** 下一首按钮操作 */
    @IBAction func nextBtnClick(btn: UIButton) {
        isAutoFinish = false
        currentSongIndex++
        if currentSongIndex > songData.count - 1 {
            currentSongIndex = 0
        }
        onSelectRowIndex(currentSongIndex)
    }
    
    /** 播放暂停按钮操作 */
    @IBAction func playORpauseClick(btn: MGPlayAndPauseButton) {
        btn.selected = !btn.selected
        // 设置按钮背景图片
        if btn.selected {
            player.pause()
            rotateImageView.stopRotation()
        }else {
            player.play()
            rotateImageView.startRotation()
        }
    }
}


// MARK:- <UITableViewDataSource,UITableViewDelegate>
let cellIdentifier = "cellIdentifier"
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    // MARK:- <UITableViewDataSource>
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)

        cell?.backgroundColor = UIColor.clearColor()
        
        let rowData = self.songData[indexPath.row] as! [String : AnyObject]
        if let title = rowData["title"] as? String {
            cell?.textLabel?.text = title
        }
        
        if let artist = rowData["artist"] as? String{
            cell?.detailTextLabel?.text = artist
        }
        
        if let urlStr = rowData["picture"] as? String {
            onGetCacheImage(urlStr, imageView: (cell?.imageView)!)
        }
        
        return cell!
    }
    
    
    // MARK:- <UITableViewDelegate>
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
         isAutoFinish = false
         onSelectRowIndex(indexPath.row)
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    //设置cell的显示动画
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        //设置cell的显示动画为3d缩放，xy方向的缩放动画，初始值为0.1 结束值为1
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animateWithDuration(0.2) { () -> Void in
            cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        }
    }
    
    // MARK:- 自定义方法
    /** 当前选中的某一行的cell */
    func onSelectRowIndex(index: Int){
        if index < 0 {
            return
        }
        
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
        
        let rowData = songData[indexPath.row] as! [String : AnyObject]
        
        // 设置图片
        if let picture_url = rowData["picture"] as? String {
            onGetCacheImage(picture_url, imageView: backImageView)
            onGetCacheImage(picture_url, imageView: rotateImageView)
        }
        
        // 播放音效
        if let audio_url = rowData["url"] as? String {
             onSetPlayAudio(audio_url)
        }
    }
    
    // 缓存图片
    private func onGetCacheImage(url: String, imageView: UIImageView) {
        if let img = SDWebImageManager.sharedManager().imageCache.imageFromDiskCacheForKey(url){
            imageView.image = img
        }else {
            imageView.sd_setImageWithURL(NSURL(string: url), placeholderImage: UIImage(named: "defaultUserIcon"))
        }
    }
    
    // 播放电台音乐
    private func onSetPlayAudio(url: String){
        guard let url = NSURL(string: url) else{
            return
        }
        let playerItem = AVPlayerItem(URL: url)
        player.replaceCurrentItemWithPlayerItem(playerItem)
//        player.setValue(url, forKey: "url")
//        player.currentItem

//        try! AVAudioPlayer(contentsOfURL: url)
        
        player.play()
        
        // 清除定时器
        timer?.invalidate()
        playTimeLabel.text = "00:00"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        
        isAutoFinish = true
    }
    
    // 时间的处理
    @objc private func updateTime() {
        let currentTime = player.currentItem?.currentTime
        let totalTime = (player.currentItem?.duration)
        print("currentTime=\(currentTime!)")
        print("totalTime=\(totalTime)")
        /**
        currentTime=(Function)
        totalTime=Optional(C.CMTime(value: 25541485, timescale: 90000, flags: C.CMTimeFlags(rawValue: 1), epoch: 0))
        */
//        var timeText: String = ""
//        if currentTime > 0.0 {
//            let totalTime = (player.currentItem?.duration)
//            let factor: CGFloat = CGFloat(currentTime/totalTime)
//            progressWidth.constant = view.frame.width * factor
//            
//            let all: Int = Int(currentTime!)
//            
//            let min = all/60
//            let sec = all%60
//            
//            if min<10 {
//                timeText = "0\(min):"
//            }else {
//                timeText = "\(min):"
//            }
//            
//            if sec<10 {
//                timeText += "0\(sec)"
//            }else{
//                timeText += "\(sec)"
//            }
//        }
//        
//        playTimeLabel.text = timeText
    }
}


// MARK:- <HttpControllerDelegate>
extension ViewController: HttpControllerDelegate{
    func receiveResults(results: [String : AnyObject]) {
        if let channels = results["channels"] {
            self.channelData = channels as! NSArray
            
            // 默认选中第一组数据
            self.onChangeChannelForSelectRow("\(0)")
        }else if let songs = results["song"]  {
            isAutoFinish = false
            self.songData = songs as! NSArray
            self.tableView.reloadData()
            onSelectRowIndex(0)
        }
    }
}

// MARK:- <MGChannelViewControllerDelegate>
extension ViewController: MGChannelViewControllerDelegate {
    /** 逆传（频道控制器给当前控制器传数据）*/
    func onChangeChannelForSelectRow(channel_id_str: String){
        // 获取频道为0的数据
        //        httpControl.onSearch("http://douban.fm/j/mine/playlist?type=n&channel=0&from=mainsite")
        let urlStr = "http://douban.fm/j/mine/playlist?type=n&channel=\(channel_id_str)&from=mainsite"
        httpControl.onSearch(urlStr)
    }
}

