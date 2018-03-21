//
//  CalModel.swift
//  Cal+
//
//  Created by Hugo Olcese on 3/5/18.
//  Copyright © 2018 MOBILE PRO. All rights reserved.
//

import Foundation
import Darwin

enum Operation:String
{
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}

class CalModel{
    

    var runningnum: String;
    var num1: String;
    var num2: String;
    var sum: String;
    var Restart = true;
    var dot = false;
    var currentOperation: Operation;
    
    init(){
        self.runningnum = "0";
        self.num1 = "";
        self.num2 = "";
        self.sum = "";
        self.currentOperation = .NULL;
    }
    
    init(number1:String, number2:String, total:String)
    {
        self.runningnum = "";
        self.num1 = number1;
        self.num2 = number2;
        self.sum = total;
        self.currentOperation = .NULL;
    }
    
    func allClear()
    {
        self.runningnum = "0";
        self.num1 = "";
        self.num2 = "";
        self.sum = "";
        self.Restart = true;
        self.dot = false;
    }
    
    func dotAdded() -> String
    {
        if runningnum.count <= 7 && dot == false
        {
            runningnum += "."
            self.dot = true;
        }
        return runningnum;
    }
    
    func sqrtPressed()-> String
    {
        if runningnum.count <= 8
        {
            let sqrtFive = sqrt((Double(runningnum)!))
            runningnum = "\(Double(sqrtFive))"
        }
        return runningnum;
    }
    
    
    func percentPressed() -> String
    {
        if runningnum != ""
        {
            num1 = runningnum
            runningnum = "\(Double(num1)! / (Double(100)))"
        }
        return runningnum;
    }
    
    func switchSigns(RanNum: String) -> String
    {
        runningnum = RanNum;
        if runningnum.count <= 7
        {
            var temp: Double
                temp = 0
            if runningnum != ""
            {
                if ((Double(runningnum)!) > 0)
                {
                    temp = 0 - (Double(runningnum)!)
                    
                }
                else if ((Double(runningnum)!) < 0)
                {
                    temp = 0 - (Double(runningnum)!)
                }
                runningnum = "\(Double(temp))"
            }
        }
        return runningnum;
    }
    
    func operation(operation: Operation) -> String
    {
        if currentOperation != .NULL
        {
            if runningnum != ""
            {
                num1 = runningnum;
                runningnum = ""
                
                if currentOperation == .Add
                {
                    sum = "\(Double(num2)! + Double(num1)!)"
                }else if currentOperation == .Subtract{

                    sum = "\(Double(num2)! - Double(num1)!)"
                }else if currentOperation == .Multiply {
                    sum = "\(Double(num2)! * Double(num1)!)"

                }else if currentOperation == .Divide {
                    sum = "\((Double(num2)! / Double(num1)!))"
                }
                num2 = sum
                if (Double(sum)!.truncatingRemainder(dividingBy: 1) == 0)
                {
                    sum = "\(Int(Double(sum)!))"
                    runningnum = sum
                }else{
                    runningnum = " "
                }
            }
            currentOperation = operation
        }else{
            num2 = runningnum
            runningnum = ""
            
            currentOperation = operation
        }
        print("Printing:" + sum);
        return sum;
    }
}
