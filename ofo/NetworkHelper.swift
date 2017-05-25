//
//  NetworkHelper.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/24.
//  Copyright © 2017年 mzc. All rights reserved.
//

import AVOSCloud


struct NetworkHelper
{
    
}

extension NetworkHelper
{
    static func getPassword(bikeNo: String, completion: @escaping (String?)  -> Void )
    {
        
        let query = AVQuery(className: "BikePassword")
        query.whereKey("BikeNo", equalTo: bikeNo)
        query.getFirstObjectInBackground { (result, e) in
            
            if let e = e {
                print("出错了",e.localizedDescription)
                completion(nil)
            }
            
            if let result = result, let password = result["Password"] as? String {
                completion(password)
            }
        }
    }
}
