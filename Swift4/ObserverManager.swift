//
//  ObserverManager.swift
//  Swift4
//
//  Created by Paul Aguilar on 1/23/18.
//  Copyright © 2018 aguilarpgc. All rights reserved.
//

import Foundation

class ObserverManager: NSObject {
    
    @objc var observed: Observed
    var kvObserver: NSKeyValueObservation?
    
    override init() {
        
        observed = Observed(title: "First Title")
    }
    
    deinit {
        
        kvObserver?.invalidate()
    }
    
    func observ(_ trigger: @escaping (String?) -> ()) {
        
        kvObserver = observed.observe(\.title, options: [.old, .new]) { (object, change) in
            
            trigger(change.newValue)
        }
    }
    
}
