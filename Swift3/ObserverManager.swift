//
//  ObserverManager.swift
//  KVO
//
//  Created by Paul Aguilar on 1/23/18.
//  Copyright © 2018 aguilarpgc. All rights reserved.
//

import Foundation

class ObserverManager: NSObject {
    
    @objc var observed: Observed
    
    override init() {
        
        observed = Observed(title: "First Title")
    }
    
    func observ(_ observer: NSObject) {
        
        observed.addObserver(observer, forKeyPath: #keyPath(Observed.title), options: [.old, .new], context: nil)
    }
    
}

