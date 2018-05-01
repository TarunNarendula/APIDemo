//
//  APiHandler.swift
//  
//
//  Created by Sierra 4 on 09/03/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import Foundation
import Alamofire

class ApiHandler {
    
    class func fetchData(urlStr:String, parameters:[String:Any], completionHandler: @escaping (Any?) -> ())  {
        
        let basepath = "http://dev.onata.com:3000/"
        Alamofire.request(basepath+urlStr, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    do{
                        let json : Any! = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        
                        
                        completionHandler(json)
                    }
                    catch {
                        print("error occured")
                        print("Simple error ")
                    }
                }
                break
                
            case .failure(_):
                print(response.result.error ?? "error")
                
                break
                
            }
        }
        
    }
    
    
    
    
    
}
