//
//  ViewController.swift
//  TOY_nsnotification
//
//  Created by Derrick Ho on 8/5/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arrOfNotifications:Array<AnyObject> = Array();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var view:ToyView = self.view as ToyView;
        
        //Connect the iboutlets without interface builder.
        //Get a reference to the view then add a control even to the button.
        view.notifyButton.addTarget(self,
            action: "tappedButton:",
            forControlEvents:UIControlEvents.TouchUpInside );
        
       
        
       
        //println("print: \( self.view.cornerRadius)")
    }

    override func viewDidAppear(animated:Bool) {
        super.viewDidAppear(animated)
        
        //use notification center to listen for the button click
        NSNotificationCenter.defaultCenter()
            .addObserver(self,
                selector: "notifyButtonHeard:",
                name: "toy_nsnotification::notifyButtonPressed",
                object: nil)
        
        //notifications using blocks.
        var n = NSNotificationCenter.defaultCenter()
            .addObserverForName("toy_nsnotification::notifyButtonPressed",
                object: nil,
                queue: nil,
                usingBlock: {(n:NSNotification!) -> Void in
                    println("I heard some falling blocks")
                })
        self.arrOfNotifications.append(n);//adding observer to an array so I can remove it later
        n = NSNotificationCenter.defaultCenter()
            .addObserverForName("toy_nsnotification::notifyButtonPressed",
                object: nil,
                queue: nil,
                usingBlock: {
                    (n:NSNotification!) -> Void in
                    (self.view as ToyView).textListener.text = "\(arc4random_uniform(10))"
                })
        self.arrOfNotifications.append(n)
        
        n = NSNotificationCenter.defaultCenter()
            .addObserverForName("toy_nsnotification::notifyButtonPressed",
                object: nil,
                queue: nil,
                usingBlock: {
                    (n:NSNotification!) -> Void in
                    if arc4random_uniform(2) == 0 {
                        (self.view as ToyView).subViewListener.backgroundColor = UIColor.blackColor()
                    }
                    else {
                        (self.view as ToyView).subViewListener.backgroundColor = UIColor.whiteColor()
                    }
                })
        self.arrOfNotifications.append(n)
    }
    
    override func viewDidDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter()
            .removeObserver(self,
                name: "toy_nsnotification::notifyButtonPressed",
                object: nil)
        
        for i in arrOfNotifications {//remove the ones that use blocks
            NSNotificationCenter.defaultCenter().removeObserver(i);
        }
        
        super.viewDidDisappear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tappedButton(sender:AnyObject) { //This should be called when the button is tapped
        println("Tap that");
        var dic = Dictionary<String,Int>();
        dic = ["it": Int(arc4random_uniform(77))];
        //broadcast a notification
        NSNotificationCenter.defaultCenter()
            .postNotificationName("toy_nsnotification::notifyButtonPressed",
                object: self,
                userInfo: dic)
    }
    
    func notifyButtonHeard(n:NSNotification) {
        println("I heard that \(n.userInfo)");
    }
}

