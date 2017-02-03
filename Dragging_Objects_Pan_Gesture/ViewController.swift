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
        
        let imageView = UIImageView(frame: CGRect(x: (self.view.bounds.width/2)-100, y: (self.view.bounds.height/2)-50, width: 200, height: 100))
       
        imageView.image = UIImage(named: "person.png")
        
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        imageView.isUserInteractionEnabled = true
        
        
        self.view.addSubview(imageView)
    
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.wasDragged(gR:)))
        
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }

    func wasDragged(gR : UIPanGestureRecognizer  ) {
        
        let translation = gR.translation(in: view)
        
        let imageView = gR.view!
        
        imageView.center = CGPoint(x: (self.view.bounds.width / 2)+translation.x , y:  (self.view.bounds.height/2) + translation.y )
        
        let xFromCenter = imageView.center.x - (self.view.bounds.width/2)
        
        var scale = min(1,abs(50/xFromCenter));
        
        var rotation = CGAffineTransform(rotationAngle: xFromCenter/200)
        
        var strechAndRotation = rotation.scaledBy(x: scale, y: scale)
        
        imageView.transform = strechAndRotation
        
        
        if gR.state == UIGestureRecognizerState.ended {
            
            if imageView.center.x < 100 {
                
                print("Not chosen")
                
            } else if imageView.center.x > (self.view.bounds.width - 100 ) {
                
                print("chosen")
                
            }
            
            imageView.center = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
            
            rotation = CGAffineTransform(rotationAngle:0)
            scale = 1
        
            strechAndRotation = rotation.scaledBy(x: scale, y: scale)
            
            imageView.transform = strechAndRotation
            
        }
        
        print("was dragged \(imageView.center)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

