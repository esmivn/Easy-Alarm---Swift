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


class InvisibleSlider:UIView, InvisibleSliderDelegate{
    
    
    var delegate : InvisibleSliderDelegate?

    var minValue : Float!
    var maxValue: Float!
    var sliderValue : Float!

    override init(){
        
        minValue = 0.0
        maxValue = 0.0
        sliderValue = 0.0
        
        super.init();
        
    }
    
    override init(frame: CGRect) {
        
        minValue = 0.0
        maxValue = 0.0
        sliderValue = 0.0
        
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    func invisibleSliderViewDidChangeValue(let sliderView: InvisibleSlider){}
    
    func invisibleSliderWillStartMoving(let sliderView: InvisibleSlider){}
    
    func invisibleSliderViewDidStopMoving(let sliderView: InvisibleSlider){}
    
}