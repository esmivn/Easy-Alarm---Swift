//
//  ViewController.swift
//  Easy Alarm
//
//  Created by Guilherme Augusto Coradini on 8/14/14.
//  Copyright (c) 2014 Billyster Industries. All rights reserved.
//

import UIKit
import QuartzCore


class ViewController: UIViewController, InvisibleSliderDelegate {
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var twoPointsLabel: UILabel!
    @IBOutlet weak var amPmButton: UIButton!
    @IBOutlet weak var pillowBackground: UIImageView!
    @IBOutlet weak var settingsButton: UIButton!
    var sliderHour : InvisibleSlider!
    var sliderMinute : InvisibleSlider!
    var gradient : CAGradientLayer!



    override func viewDidLoad() {
        
        self.view.addSubview(pillowBackground);
        
        sliderHour = InvisibleSlider(frame: CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height))
        sliderHour.delegate = self;
        sliderHour.maxValue = 12.0;
        sliderHour.minValue = 0;
        
        self.view.addSubview(sliderHour)

        sliderMinute = InvisibleSlider(frame: CGRectMake(minuteLabel.frame.origin.x, 0, self.view.frame.size.width/2, self.view.frame.size.height))
        sliderMinute.delegate = self;
        sliderMinute.maxValue = 59.0;
        sliderMinute.minValue = 0;
        
        self.view.addSubview(sliderMinute)
        
        /*gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = NSArray(objects: UIColor.blackColor().CGColor, UIColor.blackColor().CGColor)
        self.view.layer.insertSublayer(gradient, atIndex: 0)*/
        
        self.view.addSubview(amPmButton)

        self.view.addSubview(settingsButton)
        
        self.view.bringSubviewToFront(minuteLabel)
        self.view.bringSubviewToFront(hourLabel)
        self.view.bringSubviewToFront(twoPointsLabel)
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        let now = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh"
        dateFormatter.timeZone = NSTimeZone.systemTimeZone()
        hourLabel.text = dateFormatter.stringFromDate(now)
        dateFormatter.dateFormat = "mm"
        minuteLabel.text = dateFormatter.stringFromDate(now)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func invisibleSliderViewDidChangeValue(let sliderView: InvisibleSlider){
    
        if(sliderView.isEqual(sliderHour)){
            
            if(sliderHour.sliderValue >= 9.5){
                hourLabel.text = NSString(format: "%.0f", sliderHour.sliderValue!)
            }else{
                let value = NSString(format: "0%0.f", sliderHour.sliderValue!);
                hourLabel.text = value;
            }
            
        }else{
            
            
            if(sliderMinute.sliderValue >= 9.5){
                minuteLabel.text = NSString(format: "%.0f", sliderMinute.sliderValue!)
            }else{
                let value = NSString(format: "0%0.f", sliderMinute.sliderValue!);
                minuteLabel.text = value;
            }
            
        }
    
    }

    
    @IBAction func toggleAmPm(sender: UIButton) {
        if(sender.titleLabel.text == "AM"){
            sender.setTitle("PM", forState: UIControlState.Normal)
            //gradient.colors = NSArray(objects: UIColor.blackColor().CGColor, UIColor.blackColor().CGColor)
        }else{
            sender.setTitle("AM", forState: UIControlState.Normal)
            //gradient.colors = NSArray(objects: UIColor.whiteColor().CGColor, UIColor.whiteColor().CGColor)
        }
    }
    
    override func preferredStatusBarStyle()->UIStatusBarStyle{
        return UIStatusBarStyle.LightContent
    }
    
    
    func invisibleSliderWillStartMoving(let sliderView: InvisibleSlider){}
    
    func invisibleSliderViewDidStopMoving(let sliderView: InvisibleSlider){}

}

