//
//  toyView.swift
//  TOY_nsnotification
//
//  Created by Derrick Ho on 8/5/14.
//  Copyright (c) 2014 dnthome. All rights reserved.
//

import UIKit

@IBDesignable

class ToyView: UIView {
    @IBInspectable var cornerRadius:CGFloat = 0 {
    didSet {
        layer.cornerRadius = cornerRadius;
    }
    }
    @IBInspectable var borderWidth:CGFloat = 0 {
    didSet {
        layer.borderWidth = borderWidth;
    }
    }
    @IBInspectable var borderColor:UIColor = UIColor.clearColor() {
    didSet {
        layer.borderColor = borderColor.CGColor;
    }
    }

    @IBInspectable var notifyButtonFrame:CGRect = CGRectMake(0, 0, 10, 10) {
    didSet {
        self.notifyButton.frame = notifyButtonFrame;
    }
    }
    @IBInspectable var textListenerFrame:CGRect = CGRectMake(0, 0, 10, 10) {
    didSet {
        self.textListener.frame = textListenerFrame;
    }
    }
    @IBInspectable var subviewListenerFrame:CGRect = CGRectMake(0, 0, 10, 10) {
    didSet {
        self.subViewListener.frame = subviewListenerFrame;
    }
    }

    
    
    var notifyButton:UIButton = UIButton();
    var textListener:UILabel = UILabel();
    var subViewListener:UIView = UIView();
    
    init(frame: CGRect) {
//        self.notifyButton = UIButton();
//        self.textListener = UILabel();
//       self.subViewListener = UIView();
//        self.cornerRadius = 0;
//        self.borderColor = UIColor.clearColor();
//        self.borderWidth = 0;
        
       
        
        super.init(frame: frame);
    }
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder);
    }
    
    override func drawRect(rect: CGRect) {
//        self.notifyButton.frame = CGRectMake(0, 0, 10, 10);
//        self.textListener.frame = CGRectMake(0, 50, 10, 10);
//        self.subViewListener.frame = CGRectMake(0, 100, 10, 10);

        self.notifyButton.backgroundColor = UIColor.greenColor();
        self.textListener.backgroundColor = UIColor.yellowColor();
        self.subViewListener.backgroundColor = UIColor.redColor();
        
        self.addSubview(self.notifyButton);
        self.addSubview(self.textListener);
        self.addSubview(self.subViewListener);
    }
}