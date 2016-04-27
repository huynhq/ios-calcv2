//
//  HistoryViewController.swift
//  SimpleCalcIOS
//
//  Created by Quynh Huynh on 4/26/16.
//  Copyright © 2016 Client Template. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var historyText : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var result = ""
        for line in historyText {
            result = result + line
        }
        NSLog(result)
        historyBox.text = result
        historyBox.lineBreakMode = NSLineBreakMode.ByWordWrapping
        historyBox.numberOfLines = 0
        historyBox.sizeToFit()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var historyBox: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
