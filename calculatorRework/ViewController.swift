// Author: Richard Estrada
// Date: 11:39 Feb 5 2016
// Description: This file performs all the calculations the calculator does for the user.
// Bugs: Optional numbers, screen display, nulls, string issues.
//  version 2.0.1
//  ViewController.swift
//  calculatorRework
//
//  Created by student on 2016-02-05.
//  Copyright © 2016 Richard E. All rights reserved.

//  Code logic and some functions were based on http://www.ioscreator.com/tutorials/calculator-tutorial-in-ios8-with-swift

import UIKit

class ViewController: UIViewController {
    //system generated, can be deleted
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //global variables
    var isTypingNum:Bool = false
    var firstNumber:Float! = 0
    var secNumber:Float! = 0
    var operation:String! = " "
    
    //display label
    @IBOutlet weak var calcDisplay: UILabel!
    
    //when numbers are tapped
    @IBAction func numTapped(sender: AnyObject) {
        //private let that holds number tapped
        let number = sender.currentTitle!
        
        //when a number is pressed, add it to screen
        if isTypingNum {
            calcDisplay.text = calcDisplay.text! + number!
        }
        else {
            calcDisplay.text = number
            isTypingNum = true
        }
        //print(number)
    }
    
    //when results is tapped
    @IBAction func equalsTap(sender: AnyObject) {
        //variables
        isTypingNum = false
        var result:Float = 0
        
        //adds second number to calculate
        secNumber = Float(calcDisplay.text!)
        
        //checks for operation pressed
        if operation == "+" {
            result = firstNumber! + secNumber!
        }
        else if operation == "-" {
            result = firstNumber! - secNumber!
        }
        else if operation == "/" {
            result = firstNumber! / secNumber!
        }
        else if operation == "*" {
            result = firstNumber! * secNumber!
        }//extra math function
        else if operation == "%" {
            result = firstNumber! % secNumber!
        }
        //tests
        //result = firstNumber! + secNumber!
        /*print("new line")
        print(firstNumber)
        print(operation)
        
        print(secNumber)
        
        print(result)*/
        
        //rounds to 3 decimal place
        result = round(1000*result)/1000
        
        //ensures it has an operator to avoid crashes
        if operation != " " {
            //\(firstNumber) \(operation) \(secNumber) equals
            calcDisplay.text = "\(result)"
        }
        
    }
    //clears all
    @IBAction func clear(sender: AnyObject) {
        secNumber = 0;
        firstNumber = 0;
        operation = " ";
        calcDisplay.text = "0"
    }
    //adds first number and operators when pressed.
    @IBAction func calcTap(sender: AnyObject) {
        isTypingNum = false
        firstNumber = Float(calcDisplay.text!)
        //print(firstNumber)
        
        operation = sender.currentTitle
        //print(operation)
    }

}

