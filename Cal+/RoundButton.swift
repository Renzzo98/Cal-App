//
//  RoundButton.swift
//  Cal+
//
//  Created by Hugo Olcese on 3/5/18.
//  Copyright © 2018 MOBILE PRO. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var roundButton:Bool = false{
        didSet{
            if roundButton {
                layer.cornerRadius = 50 / 2
        
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = 50 / 2
        }
    }

}
