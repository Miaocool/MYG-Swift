//
//  MDNetworkTool.swift
//  MYG
//
//  Created by Apple on 16/8/28.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class MDNetworkTool: NSObject {
    
    static let shareInstance = MDNetworkTool()
 
    typealias NetCallBack = (Result<AnyObject, NSError>) -> ()

    private func baseRequestData(method: Alamofire.Method, urlString: String, parameters: [String: AnyObject], callBack: NetCallBack? = nil) {
        Alamofire.request(method, urlString, parameters: parameters).responseJSON { (response) in
            
           if response.result.isFailure {
                
                callBack?(.Failure((response.result.error)!))
                
                SVProgressHUD.showErrorWithStatus(Message.failure.rawValue)
                return
            }
            guard let responseResult = response.result.value else {
            
                callBack?(.Failure((response.result.error)!))
                
                SVProgressHUD.showErrorWithStatus(Message.failure.rawValue)
                return
          }
            SVProgressHUD.showWithStatus(Message.success.rawValue)
            callBack?(.Success((responseResult)))
        }
    }
    func netGetRequest(urlString: String, para: [String: AnyObject]? = nil, callBack:  NetCallBack? = nil) -> () {
        guard let canshu = para else {
         
            print("para is nil")
            return
        }
    
        baseRequestData(.GET, urlString: urlString, parameters: canshu) { (result) in
            callBack?(result)
        }
    }

    func netPostRequest(urlString: String, para: [String: AnyObject]? = nil, callBack: NetCallBack? = nil) -> () {
        guard let canshu = para else {
            
            print("para is nil")
            return
        }
        baseRequestData(.POST, urlString: urlString, parameters: canshu) { (result) in
            callBack?(result)
        }
    }
}
// MARK: - Result 扩展
extension Result {
    func success(@noescape closure: (Value -> Void)) -> Result {
        switch self {
        case .Success(let value):
            closure(value)
        default:
            break
        }
        return self
    }
    func failure(@noescape closure: (Error -> Void)) -> Result {
        switch self {
        case .Failure(let error):
            closure(error)
        default:
            break
        }
        return self
    }
}
enum Message: String{
    case success = "aa"
    case failure = "bb"
}
