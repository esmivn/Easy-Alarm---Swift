//
//  InvisibleSlider.swift
//  Easy Alarm
//
//  Created by Guilherme Augusto Coradini on 8/14/14.
//  Copyright (c) 2014 Billyster Industries. All rights reserved.
//

import Foundation
import UIKit

protocol InvisibleSliderDelegate{
    
    
    func invisibleSliderViewDidChangeValue(let sliderView: InvisibleSlider);
    
    func invisibleSliderWillStartMoving(let sliderView: InvisibleSlider);
    
    func invisibleSliderViewDidStopMoving(let sliderView: InvisibleSlider);
    
    
}


class InvisibleSlider:UIView{
    
    
    var delegate : InvisibleSliderDelegate?

    var minValue : Float?
    var maxValue: Float?
    var sliderValue : Float?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        minValue = 0.0
        maxValue = 0.0
        sliderValue = 0.0
    }
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    
    func setSliderValue(var #value:CGFloat, let animated:Bool){

        if(value.native > maxValue!){
            value=CGFloat(maxValue!);
        }else if(value.native<minValue!){
            value=CGFloat(minValue!);
        }
        
        self.sliderValue = value.native;

        self.delegate!.invisibleSliderWillStartMoving(self)
        
        self.delegate!.invisibleSliderViewDidChangeValue(self)

    }
    
    func setSliderValue(value : CGFloat){
        setSliderValue(value: value, animated: false)
    }
    
    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
        let touch: UITouch! = touches.anyObject() as UITouch
        let touchCoord = touch.locationInView(self)
        
        self.sliderValue = (touchCoord.y.native/self.frame.size.height.native)*(maxValue!+1.0);
        self.delegate!.invisibleSliderViewDidChangeValue(self)
        
        self.setSliderValue(CGFloat(sliderValue!))
    }
    
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        let touch: UITouch! = touches.anyObject() as UITouch
        var touchCoord = touch.locationInView(self)
        
        let trueHeight : CGFloat = self.frame.size.height
        touchCoord.y = CGFloat(Swift.min(touchCoord.y, trueHeight))
        
        self.setSliderValue(CGFloat((touchCoord.y.native/trueHeight.native)*(maxValue!+1.0)))
    }
    
    
}