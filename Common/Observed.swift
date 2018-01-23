//
//  Observed.swift
//  KVO
//
//  Created by Paul Aguilar on 1/23/18.
//  Copyright © 2018 aguilarpgc. All rights reserved.
//

import Foundation

class Observed: NSObject {
    
    @objc dynamic var title: String
    
    init(title: String) {
        
        self.title = title
    }
}
