//
//  ViewController.swift
//  Animation
//
//  Created by George Garcia on 5/17/17.
//  Copyright © 2017 George. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var button: UIButton!
    
    var counter = 7 // starting at 7
    var isAnimating = false
    
    var timer = Timer()
    
    func animate() {
        
        image.image = UIImage(named: "frame_\(counter)_delay-0.1s.gif")
        
        counter += 1 // increment by one
        
        if counter == 13 {
            
            counter = 7
        }

    }
    
    @IBAction func next(_ sender: AnyObject) {
        
        if isAnimating {
            timer.invalidate()
            button.setTitle("Start", for: [])
            isAnimating = false
        } else {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
        
            button.setTitle("Stop", for: [])
            
            isAnimating = true
        
        }
    }
    
    @IBAction func fadeIn(_ sender: AnyObject) {
        
        image.alpha = 0 // makes the image invisible
        
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
        
    }
    
    @IBAction func slideIn(_ sender: AnyObject) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2) { 
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        }
    }
    
    @IBAction func grow(_ sender: AnyObject) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
            
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

