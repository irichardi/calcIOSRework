//
//  ViewController.swift
//  calculatorRework
//
//  Created by student on 2016-02-05.
//  Copyright © 2016 Richard E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var isTypingNum:Bool = false
    var firstNumber:Float! = 0
    var secNumber:Float! = 0
    var operation:String! = " "
    
    @IBOutlet weak var calcDisplay: UILabel!
    
    @IBAction func numTapped(sender: AnyObject) {
        let number = sender.currentTitle!
        
        if isTypingNum {
            calcDisplay.text = calcDisplay.text! + number!
        }
        else {
            calcDisplay.text = number
            isTypingNum = true
        }
        //print(number)
    }
    
    @IBAction func equalsTap(sender: AnyObject) {
        
        isTypingNum = false
        var result:Float = 0
        
        
        secNumber = Float(calcDisplay.text!)
        
        
        
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
        }
        else if operation == "%" {
            result = firstNumber! % secNumber!
        }
        //result = firstNumber! + secNumber!
        /*print("new line")
        print(firstNumber)
        print(operation)
        
        print(secNumber)
        
        print(result)*/
        
        if operation != " " {
            //\(firstNumber) \(operation) \(secNumber) equals
            calcDisplay.text = "\(result)"
        }
        
    }
    @IBAction func clear(sender: AnyObject) {
        secNumber = 0;
        firstNumber = 0;
        operation = " ";
        calcDisplay.text = "0"
    }
    
    @IBAction func calcTap(sender: AnyObject) {
        isTypingNum = false
        firstNumber = Float(calcDisplay.text!)
        //print(firstNumber)
        
        operation = sender.currentTitle
        //print(operation)
    }

}

