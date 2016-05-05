//
//  HttpController.swift
//  DBFM
//
//  Created by ming on 16/5/3.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit
//import Alamofire

class HttpController: NSObject {
    
    var delegate: HttpControllerDelegate?

    /**
    根据URL从网络获取数据
    */
    func onSearch(url: String){
        let manager = AFHTTPSessionManager()
//        [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil]
        manager.responseSerializer.acceptableContentTypes = NSSet(objects: "text/html","text/plain","application/json") as? Set
        manager.GET(url, parameters: nil, progress: nil, success: { (_, data) -> Void in
                guard let dict = data else{
                    SVProgressHUD.showInfoWithStatus("data为空")
                    SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.Custom)
                    print("data为空")
                    return
                }
            
                SVProgressHUD.showSuccessWithStatus("请求成功")
                SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.Native)
//                print(dict)
                self.delegate?.receiveResults(dict as! [String : AnyObject])
            
            }) { (_, error) -> Void in
                SVProgressHUD.showErrorWithStatus("\(error)")
                SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.Flat)
                print(error)
        }
    }
    
    
    // 不使用代理，使用闭包(Block)的方法
//    func onSearch(url: String,finished:([String: AnyObject],error: NSError) -> ())
}


// 代理用于网络请求的返回结果，可以使用闭包(Block)代替
protocol HttpControllerDelegate: NSObjectProtocol {
    func receiveResults(results: [String: AnyObject])
}
