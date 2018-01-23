//
//  ViewController.swift
//  KVO
//
//  Created by Paul Aguilar on 1/23/18.
//  Copyright © 2018 aguilarpgc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var observerManager = ObserverManager()
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var buttonChange: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        #if SWIFT4
            observerManager.observ { (newVale) in
                
                self.trigger(newVale)
            }
        #else
            observerManager.observ(self)
        #endif
    }
    
    @IBAction func actionChange(_ sender: Any) {
        
        observerManager.observed.title = randomString(10)
    }
}

extension ViewController {
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == #keyPath(Observed.title) {
            
            trigger(change?[.newKey] as? String)
        }
    }
    
    func trigger(_ newValue: String?) {
        
        labelTitle.text = newValue
    }
    
    func randomString(_ length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}
