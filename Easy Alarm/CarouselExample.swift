//
//  ViewController.swift
//  SwiftExample
//
//  Created by Nick Lockwood on 30/07/2014.
//  Copyright (c) 2014 Charcoal Design. All rights reserved.
//
/*
import UIKit
import QuartzCore

class CarouselExample: UIViewController, iCarouselDataSource, iCarouselDelegate
{
    var items: [Int] = []
    @IBOutlet var carousel : iCarousel!
    
    override func viewDidLoad()
    {
        
        carousel = iCarousel()
        for i in 0...20
        {
            items.append(i)
        }
        carousel.type = iCarouselType.Linear
        carousel.dataSource = self
        carousel.delegate = self
        carousel.frame = CGRectMake(60, 200, 200, 200)
        self.view.addSubview(carousel)
        
        carousel.reloadData()
        
        super.viewDidLoad()

    }
    
    func numberOfItemsInCarousel(carousel: iCarousel!) -> Int
    {
        return items.count
    }
    
    func carousel(carousel: iCarousel!, viewForItemAtIndex index: Int, var reusingView view: UIView!) -> UIView!
    {
        var label: UILabel! = nil
        
        //create new view if no view is available for recycling
        if (view == nil)
        {
            //don't do anything specific to the index within
            //this `if (view == nil) {...}` statement because the view will be
            //recycled and used with other index values later
            view = UIImageView(frame:CGRectMake(0, 0, 250, 250))
            (view as UIImageView!).image = UIImage(named: "pillow_transparentBackground")
            view.contentMode = .Center
            
            label = UILabel(frame: CGRectMake(view.bounds.origin.x, view.bounds.origin.y, view.bounds.size.width, view.bounds.size.height))
            label.backgroundColor = UIColor.clearColor()
            label.textAlignment = .Center
            label.font = label.font.fontWithSize(50)
            label.tag = 1
            view.addSubview(label)
        }
        else
        {
            //get a reference to the label in the recycled view
            label = view.viewWithTag(1) as UILabel!
        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        label.text = "\(items[index])"
        
        return view
    }
    
    func carousel(carousel: iCarousel!, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        if (option == .Spacing)
        {
            return value * 1.1
        }
        return value
    }
    
}*/
