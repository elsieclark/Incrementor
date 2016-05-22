//
//  ViewController.swift
//  Incrementor
//
//  Created by Will Clark on 2016-05-21.
//  Copyright © 2016 Kybernetics. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    var increment : UIButton!
    var incLabel : UILabel!
    
    
    var decrement : UIButton!
    var decLabel : UILabel!
    
    var increment10 : UIButton!
    var incLabel10 : UILabel!
    
    var decrement10 : UIButton!
    var decLabel10 : UILabel!
    
    var valueLabel : UILabel!
    
    var rapidTimer : NSTimer!
    
    
    var value : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
        
        let green : UIColor = UIColorFromRGB(0x009900)
        let darkGreen : UIColor = UIColorFromRGB(0x006600)
        let red : UIColor = UIColorFromRGB(0x990000)
        let darkRed : UIColor = UIColorFromRGB(0x990000)
        
        increment = UIButton(frame: CGRectMake(0, 0, 0.5 * screenSize.height, 0.5 * screenSize.height))
        increment.center = CGPointMake(0.8 * screenSize.width, 0.6 * screenSize.height)
        increment.backgroundColor = green
        increment.addTarget(self, action: #selector(self.inc), forControlEvents: UIControlEvents.TouchDown)
        increment.layer.cornerRadius = 20.0
        self.view.addSubview(increment)
        
        incLabel = UILabel(frame: CGRectMake(0, 14, 0.5 * screenSize.height, 0.5 * screenSize.height))
        incLabel.text = "+"
        incLabel.textColor = UIColor.whiteColor()
        incLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 200)
        incLabel.textAlignment = .Center
        increment.addSubview(incLabel)
        
        
        
        
        increment10 = UIButton(frame: CGRectMake(0, 0, 0.2 * screenSize.height, 0.2 * screenSize.height))
        increment10.center = CGPointMake(0.9 * screenSize.width, 0.2 * screenSize.height)
        increment10.backgroundColor = green
        increment10.addTarget(self, action: #selector(self.inc10), forControlEvents: UIControlEvents.TouchDown)
        increment10.layer.cornerRadius = 8.0
        self.view.addSubview(increment10)
        
        incLabel10 = UILabel(frame: CGRectMake(0, 2, 0.2 * screenSize.height, 0.2 * screenSize.height))
        incLabel10.text = "+10"
        incLabel10.textColor = UIColor.whiteColor()
        incLabel10.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        incLabel10.textAlignment = .Center
        increment10.addSubview(incLabel10)
        
        
        
        
        
        decrement = UIButton(frame: CGRectMake(0, 0, 0.5 * screenSize.height, 0.5 * screenSize.height))
        decrement.center = CGPointMake(0.2 * screenSize.width, 0.6 * screenSize.height)
        decrement.backgroundColor = red
        decrement.addTarget(self, action: #selector(self.dec), forControlEvents: UIControlEvents.TouchDown)
        decrement.layer.cornerRadius = 20.0
        self.view.addSubview(decrement)
        
        decLabel = UILabel(frame: CGRectMake(0, 4, 0.5 * screenSize.height, 0.5 * screenSize.height))
        decLabel.text = "-"
        decLabel.textColor = UIColor.whiteColor()
        decLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 200)
        decLabel.textAlignment = .Center
        decrement.addSubview(decLabel)
        
        
        
        
        decrement10 = UIButton(frame: CGRectMake(0, 0, 0.2 * screenSize.height, 0.2 * screenSize.height))
        decrement10.center = CGPointMake(0.1 * screenSize.width, 0.2 * screenSize.height)
        decrement10.backgroundColor = red
        decrement10.addTarget(self, action: #selector(self.dec10), forControlEvents: UIControlEvents.TouchDown)
        decrement10.layer.cornerRadius = 8
        self.view.addSubview(decrement10)
        
        decLabel10 = UILabel(frame: CGRectMake(0, 2, 0.2 * screenSize.height, 0.2 * screenSize.height))
        decLabel10.text = "-10"
        decLabel10.textColor = UIColor.whiteColor()
        decLabel10.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        decLabel10.textAlignment = .Center
        decrement10.addSubview(decLabel10)
        
        
        

        let valueBackground = UIView(frame: CGRectMake(0, 0, 0.45 * screenSize.height, 0.45 * screenSize.height))
        valueBackground.center = CGPointMake(0.5 * screenSize.width, 0.4 * screenSize.height)
        valueBackground.layer.cornerRadius = valueBackground.frame.height * 0.35
        valueBackground.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(valueBackground)
        
        
        valueLabel = UILabel(frame: CGRectMake(0, 0, valueBackground.frame.height, valueBackground.frame.height))
        valueLabel.text = String(value)
        valueLabel.font = UIFont(name: "HelveticaNeue", size: 70)
        valueLabel.textAlignment = .Center
        valueBackground.addSubview(valueLabel)
        

        
        
        let _ = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: #selector(ViewController.countTick), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countTick (){
        SocketIOManager.sharedInstance.sendMessage(String(value))
    }
    
    
    
    func inc() {
        value += 1
        update()
    }
    
    
    
    
    func inc10() {
        value += 10
        update()
    }
    
    
    
    
    
    func dec() {
        value -= 1
        update()
    }
    
    
    
    func dec10() {
        value -= 10
        update()
    }
    
    
    
    
    
    
    
    
    
    func update() {
        if value < 0 {
            value = 0
        }
        if value > 999 {
            value = 999
        }
        valueLabel.text = String(value)
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    
    func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
        } else {
            newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRectMake(0, 0, newSize.width, newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.drawInRect(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

}

