//
//  ViewController.swift
//  SimpleCalcIOS
//
//  Created by quhuynh on 4/21/16.
//  Copyright © 2016 Client Template. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    

    var first = true
    var factSet = false
    let op : Operation = Operation()
    var factValue : Int = 0
    var counts : [Int] = []
    var averages : [Int] = []
    var countSet = false
    var averageSet = false
    var history : [String] = []

    @IBOutlet weak var result: UITextField!
    
    class Operation {
        var left : Int = 0
        var right : Int = 0
        var mathFunction : String = ""
        
        func print() -> String {
            return String(left) + " " + mathFunction + " " + String(right)
        }

    }
    
    @IBAction func addResult(sender: UIButton) {
        if(first) {
            result.text = ""
            first = false
        }
        result.text = result.text! + sender.titleLabel!.text!
    }
    
    @IBAction func setValues(sender: UIButton) {
        op.left = Int(result.text!)!
        op.mathFunction = sender.titleLabel!.text!
        first = true
    }
    
    @IBAction func factbutton(sender: UIButton) {
        factSet = true
        factValue = Int(result.text!)!
    }
    
    @IBAction func equalsButton(sender: UIButton) {
        var record = ""
        if(countSet) {
            result.text = String(counts.count)
            for n in counts {
                record = record + String(n) + " count "
            }
            record = record + "= " + result.text!
        } else if(averageSet) {
            var sum = 0
            for n in averages {
                sum = sum + n
            }
            sum = sum / averages.count
            result.text = String(sum)
            for n in averages {
                record = record + String(n) + " avg "
            }
            record = record + "= " + result.text!
        } else if(factSet) {
            result.text = String(fact(factValue))
            record = String(factValue) + " fact = " + result.text!
        } else {
            op.right = Int(result.text!)!
            result.text = String(compute(op.left, right: op.right, op: op.mathFunction))
            record = op.print() + " = " + result.text!
        }
        NSLog(record)
        history.append(record)
    }
    
    @IBAction func countButton(sender: UIButton) {
        counts.append(Int(result.text!)!)
        first = true
        countSet = true
    }
    
    @IBAction func clear(sender: UIButton) {
        first = true
        result.text = ""
        averages = []
        factSet = false
        averageSet = false
        countSet = false
        counts = []
    }
    
    func fact(sum: Int) -> Int {
        var result = 1
        for index in 1...sum {
            result *= index
        }
        return result
    }
    
    @IBAction func avgButton(sender: UIButton) {
        averageSet = true
        averages.append(Int(result.text!)!)
        first = true
    }
    
    func compute(left: Int, right: Int, op: String) -> Int {
        var result = 0
        switch op {
            case "+":
                result = left + right
            case "-":
                result = left - right
            case "*":
                result = left * right
            case "/":
                result = left / right
            default:
                result = left % right
        }
        return result
        
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

