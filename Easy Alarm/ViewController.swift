//
//  ViewController.swift
//  Easy Alarm
//
//  Created by Guilherme Augusto Coradini on 8/14/14.
//  Copyright (c) 2014 Billyster Industries. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, InvisibleSliderDelegate, AKPickerViewDelegate {
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var twoPointsLabel: UILabel!
    @IBOutlet weak var amPmButton: UIButton!
    @IBOutlet weak var pillowBackground: UIImageView!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var newAlarmButton: UIButton!
    let pickerView = AKPickerView()
    
    var sliderHour : InvisibleSlider!
    var sliderMinute : InvisibleSlider!
    var gradient : CAGradientLayer!
    var items : Array<CustomAlarm>!
    
    var newAlarm : CustomAlarm!


    /*
    / @description Called after the controller's view is loaded into memory.
    */
    override func viewDidLoad() {

        initInterface()
        getSystemTimeFormat()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    /*
    / @description Sent to the view controller when the app receives a memory warning.
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    / Called on viewDidLoad to customizate some controls of the view
    */
    func initInterface(){
        
        //Adds the white pillow image
        self.view.addSubview(pillowBackground);
        
        //Adds the slider responsible to change the hour
        sliderHour = InvisibleSlider(frame: CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height))
        sliderHour.delegate = self;
        sliderHour.maxValue = 12.0;
        sliderHour.minValue = 0;
        self.view.addSubview(sliderHour)
        
        //Adds the slider responsible to change the minute
        sliderMinute = InvisibleSlider(frame: CGRectMake(minuteLabel.frame.origin.x, 0, self.view.frame.size.width/2, self.view.frame.size.height))
        sliderMinute.delegate = self;
        sliderMinute.maxValue = 59.0;
        sliderMinute.minValue = 0;
        self.view.addSubview(sliderMinute)
        
        //Adds the stored alarms picker view
        self.pickerView.frame = CGRectMake(0, 400, self.view.frame.size.width, 100)
        self.view.addSubview(pickerView)
        self.pickerView.delegate = self
        self.pickerView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight;
        self.items = []
        self.createNewAlarm(self)
        self.pickerView.reloadData()
        
        //The initial idea was to have a gradient background
        /*gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = NSArray(objects: UIColor.blackColor().CGColor, UIColor.blackColor().CGColor)
        self.view.layer.insertSublayer(gradient, atIndex: 0)*/
        
        //Bring all elements to front of invisible sliders
        self.view.bringSubviewToFront(amPmButton)
        self.view.bringSubviewToFront(settingsButton)
        self.view.bringSubviewToFront(minuteLabel)
        self.view.bringSubviewToFront(hourLabel)
        self.view.bringSubviewToFront(twoPointsLabel)
        self.view.bringSubviewToFront(newAlarmButton)
        //self.view.bringSubviewToFront(pickerView)
        
        //Update the color of StatusBar
        self.setNeedsStatusBarAppearanceUpdate()
        
    }

    
    /*
    / Called after user modified the value of invisible slider view
    */
    func invisibleSliderViewDidChangeValue(let sliderView: InvisibleSlider){
    
        if(sliderView.isEqual(sliderHour)){
            
            if(sliderHour.sliderValue >= 9.5){
                hourLabel.text = NSString(format: "%.0f", sliderHour.sliderValue!)
            }else{
                let value = NSString(format: "0%0.f", sliderHour.sliderValue!);
                hourLabel.text = value;
            }
            
            newAlarm.hour = hourLabel.text
            newAlarm.minute = minuteLabel.text
            
        }else{
            
            if(sliderMinute.sliderValue >= 9.5){
                minuteLabel.text = NSString(format: "%.0f", sliderMinute.sliderValue!)
            }else{
                let value = NSString(format: "0%0.f", sliderMinute.sliderValue!);
                minuteLabel.text = value;
            }
            
            newAlarm.hour = hourLabel.text
            newAlarm.minute = minuteLabel.text
        }
        
        pickerView.reloadData()
    }

    
    //Gives the number of items in items array
    func numberOfItemsInPickerView(pickerView: AKPickerView!) -> UInt {
        return UInt(self.items.count)
    }
    
    //Called after an item be selected on picker view
    func pickerView(pickerView: AKPickerView!, didSelectItem item: Int)
    {
        
        if(self.items.isEmpty==false){
            
            let alarmSelected = self.items[item]
            newAlarm = alarmSelected
        
            self.hourLabel.text = alarmSelected.hour
            self.minuteLabel.text = alarmSelected.minute
            
        }

    }
    
    @IBAction func createNewAlarm(sender: AnyObject) {
        
        newAlarm = CustomAlarm()
        items.append(newAlarm)
        self.pickerView.reloadData()

        self.pickerView.selectItem(UInt(items.endIndex-1), animated: true)
        
    }
    
    //Return the text to be exhibited on picker view
    func pickerView(pickerView: AKPickerView!, titleForItem item: Int) -> String!
    {
        var time = self.items[item].hour + ":" + self.items[item].minute
        if(time == "+:"){
            time = "+"
        }
        return time
    }

    //Toggle AM PM button
    @IBAction func toggleAmPm(sender: UIButton) {
        if(sender.titleLabel.text == "AM"){
            sender.setTitle("PM", forState: UIControlState.Normal)
            //gradient.colors = NSArray(objects: UIColor.blackColor().CGColor, UIColor.blackColor().CGColor)
        }else{
            sender.setTitle("AM", forState: UIControlState.Normal)
            //gradient.colors = NSArray(objects: UIColor.whiteColor().CGColor, UIColor.whiteColor().CGColor)
        }
    }
    
    func getSystemTimeFormat(){
        
        let fmt : String = NSDateFormatter.dateFormatFromTemplate("jm", options: 0, locale: NSLocale.currentLocale())
        if(fmt.hasSuffix("a")){
            amPmButton.hidden=false
        }else{
            amPmButton.hidden=true
        }
    }
    
    //Returns the prefered style for Status Bar
    override func preferredStatusBarStyle()->UIStatusBarStyle{
        return UIStatusBarStyle.LightContent
    }
    
    
    func invisibleSliderWillStartMoving(let sliderView: InvisibleSlider){}
    
    func invisibleSliderViewDidStopMoving(let sliderView: InvisibleSlider){}

}

