//
//  CustomAlarm.swift
//  Easy Alarm
//
//  Created by Guilherme Augusto Coradini on 8/19/14.
//  Copyright (c) 2014 Billyster Industries. All rights reserved.
//

import Foundation

class CustomAlarm{
    
    var hour : String
    var minute : String
    var anteMeridiem : Bool
    
    init(){
        self.hour = "00"
        self.minute = "00"
        self.anteMeridiem = true
    }
    
    init(let hour: String){
        self.hour = hour
        self.minute = ""
        self.anteMeridiem = true
    }
    
    init(let minute: String){
        self.hour = ""
        self.minute = minute
        self.anteMeridiem = true
    }
    
    init(let hour: String, let minute: String){
        self.hour = hour
        self.minute = minute
        self.anteMeridiem = true
    }
    
    init(let hour: String, let minute: String, let amPm: Bool){
        self.hour = hour
        self.minute = minute
        self.anteMeridiem = amPm
    }

}