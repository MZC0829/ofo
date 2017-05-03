//
//  MyAnnotation.swift
//  ofo
//
//  Created by 麦志超 on 2017/5/2.
//  Copyright © 2017年 mzc. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class MyAnnotation : NSObject, MKAnnotation
{
    var coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    
    
    init(coordinate:CLLocationCoordinate2D)
    {
        self.coordinate = coordinate
    }
    
}
