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
    
    class ButtonClicks {
        var number : Int = 0
    }
    var first = true
    var factSet = false
    
    @IBOutlet weak var result: UITextField!
    
    class Operation {
        var left : Int = 0
        var right : Int = 0
        var mathFunction : String = ""

    }
    
    let op : Operation = Operation()
    
    @IBAction func addResult(sender: UIButton) {
        if(first) {
            result.text = ""
            first = false
        }
        result.text = result.text! + sender.titleLabel!.text!
    }
    
    var factValue : Int = 0
    
    @IBAction func setValues(sender: UIButton) {
        op.mathFunction = sender.titleLabel!.text!
        op.left = Int(result.text!)!
        first = true
    }
    
    @IBAction func factbutton(sender: UIButton) {
        factSet = true
        factValue = Int(result.text!)!
    }
    
    @IBAction func equalsButton(sender: UIButton) {
        if(countSet) {
            result.text = String(counts.count)
        } else if(averageSet) {
            var sum = 0
            for n in averages {
                sum = sum + n
            }
            sum = sum / averages.count
            result.text = String(sum)
        } else if(factSet) {
            result.text = String(fact(factValue))
        } else {
            op.right = Int(result.text!)!
            result.text = String(compute(op.left, right: op.right, op: op.mathFunction))
        }
    }
    
    var counts : [Int] = []
    var countSet = false
    var averageSet = false
    
    let count : ButtonClicks = ButtonClicks()
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
    
    var averages : [Int] = []
    
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

