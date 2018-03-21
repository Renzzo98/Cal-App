//
//  ViewController.swift
//  Cal+
//
//  Created by Hugo Olcese on 3/4/18.
//  Copyright © 2018 MOBILE PRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var RunningCal = CalModel()
    
    @IBOutlet weak var NumLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if(RunningCal.runningnum.count < 7)
        {
            if (RunningCal.Restart)
            {
                NumLabel.text = "";
                NumLabel.text = NumLabel.text! + String(sender.tag-1)
                RunningCal.runningnum = NumLabel.text!
                RunningCal.Restart = false;
            }
            /*
            if (RunningCal.runningnum != "")
            {
                
            }
            */
            else{
                NumLabel.text = NumLabel.text! + String(sender.tag-1)
                RunningCal.runningnum = NumLabel.text!
            }
        }
        //NumLabel.text = NumLabel.text! + String(sender.tag-1)
    }
    
    @IBAction func addPressed(_ sender: UIButton)
    {
        NumLabel.text! = RunningCal.operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: UIButton)
    {
        NumLabel.text! = RunningCal.operation(operation: .Subtract)
    }
    
    @IBAction func multiplyPressed(_ sender: UIButton)
    {
        NumLabel.text! = RunningCal.operation(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: UIButton)
    {
        NumLabel.text! = RunningCal.operation(operation: .Divide)
    }
    
    @IBAction func equalPressed(_ sender: UIButton)
    {
        NumLabel.text! = RunningCal.operation(operation: .NULL)
    }
    
    
    @IBAction func acPressed(_ sender: UIButton)
    {
        RunningCal.allClear();
        NumLabel.text = RunningCal.runningnum;
    }
    
    @IBAction func dotPressed(_ sender: UIButton)
    {
        NumLabel.text! = RunningCal.dotAdded();
        
    }
    
    @IBAction func sqrtPressed(_ sender: UIButton)
    {
        NumLabel.text! = RunningCal.sqrtPressed()
    }
    
    @IBAction func switchSignPressed(_ sender: Any)
    {
        NumLabel.text = RunningCal.switchSigns(RanNum: RunningCal.runningnum)
        
    }
    
    @IBAction func perPressed(_ sender: UIButton)
    {
        NumLabel.text = RunningCal.percentPressed()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

