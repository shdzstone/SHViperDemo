//
//  QUserDefault.swift
//  QObjcTour
//
//  Created by cdzdev on 2017/7/1.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

import Foundation

@objc
public class Person: NSObject ,NSCoding{
    public var name : String
    public var age = 0
    
    
    required public init?(coder aCoder: NSCoder) {
        self.name = String(describing: aCoder.decodeObject(forKey: "name"))
        self.age = Int(aCoder.decodeInt32(forKey: "age"))
        super.init()
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.age, forKey: "age")
    }
    
}


