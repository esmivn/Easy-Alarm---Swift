// Playground - noun: a place where people can play

import UIKit
import QuartzCore


var str = "Hello, playground"

var gradient : CAGradientLayer!
gradient = CAGradientLayer()
gradient.colors = NSArray(objects: UIColor.yellowColor().CGColor, UIColor.blackColor().CGColor)
gradient.colors