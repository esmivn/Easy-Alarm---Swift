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
    
    init(){
        self.hour = "00"
        self.minute = "00"
    }
    
    init(let hour: String){
        self.hour = hour
        self.minute = ""
    }
    
    init(let minute: String){
        self.hour = ""
        self.minute = minute
    }
    
    init(let hour: String, let minute: String){
        self.hour = hour
        self.minute = minute
    }

}