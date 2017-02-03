//
//  ViewController.swift
//  Dragging_Objects_Pan_Gesture
//
//  Created by Shailendra Suriyal on 03/02/17.
//  Copyright © 2017 RealDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let label = UILabel(frame: CGRect(x: (self.view.bounds.width/2)-100, y: (self.view.bounds.height/2)-50, width: 200, height: 100))
       
        label.text = "Drag me!!!"
        
        label.isUserInteractionEnabled = true
        
        label.textAlignment = NSTextAlignment.center
        
        self.view.addSubview(label)
    
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.wasDragged(gR:)))
        
        label.addGestureRecognizer(gestureRecognizer)
        
    }

    func wasDragged(gR : UIPanGestureRecognizer  ) {
        
        let translation = gR.translation(in: view)
        
        let label = gR.view!
        
        label.center = CGPoint(x: (self.view.bounds.width / 2)+translation.x , y:  (self.view.bounds.height/2) + translation.y )
        
        let xFromCenter = label.center.x - (self.view.bounds.width/2)
        
        var scale = min(1,abs(50/xFromCenter));
        
        var rotation = CGAffineTransform(rotationAngle: xFromCenter/200)
        
        var strechAndRotation = rotation.scaledBy(x: scale, y: scale)
        
        label.transform = strechAndRotation
        
        
        if gR.state == UIGestureRecognizerState.ended {
            
            if label.center.x < 100 {
                
                print("Not chosen")
                
            } else if label.center.x > (self.view.bounds.width - 100 ) {
                
                print("chosen")
                
            }
            
            label.center = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
            
            rotation = CGAffineTransform(rotationAngle:0)
            scale = 1
        
            strechAndRotation = rotation.scaledBy(x: scale, y: scale)
            
            label.transform = strechAndRotation
            
        }
        
        print("was dragged \(label.center)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

