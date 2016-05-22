//
//  SmartButton.swift
//  Incrementor
//
//  Created by Will Clark on 2016-05-22.
//  Copyright © 2016 Kybernetics. All rights reserved.
//

import UIKit

class SmartButton: UIButton {

    var pressed : Bool = false
    
    var waiter : Int = 0
    
    var delta : Int!
    
    var rapidTimer : NSTimer!
    
    var offColour : UIColor!
    var onColour : UIColor!
    
    init(size : CGFloat, offColour : UIColor, onColour : UIColor, text : String, xPos : CGFloat, yPos : CGFloat, delta : Int) {
        super.init(frame: CGRectMake(xPos - size/2, yPos - size/2, size, size))
        self.backgroundColor = offColour
        self.layer.cornerRadius = size / 5
        
        self.delta = delta
        self.offColour = offColour
        self.onColour = onColour
        
        let label = UILabel(frame: CGRectMake(0, 0, size, size))
        label.text = text
        label.textAlignment = .Center
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: size/2)
        label.textColor = UIColor.whiteColor()
        label.center = CGPointMake(size / 2, size / 2)
        self.addSubview(label)
        
        
        self.addTarget(self, action: #selector(self.trigger), forControlEvents: UIControlEvents.TouchDown)
    }
    
    
    
    
    func trigger() {
        value += delta
        self.backgroundColor = onColour
        rapidTimer = NSTimer(timeInterval: 0.1, target: self, selector: #selector(self.rapidTrigger), userInfo: nil, repeats: true)
    }
    
    func rapidTrigger(){
        
        waiter += 1
        
        if (waiter >= 8 && self.pressed == true){
            value += delta
        }
            
        else if (self.pressed == false) {
            rapidTimer.invalidate()
            waiter = 0
            self.backgroundColor = offColour
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
