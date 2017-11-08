//
//  ViewController.swift
//  testnamesbyalphabet
//
//  Created by samuel on 01/11/2017.
//  Copyright © 2017 samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var resultToDisplay:String = ""
    var arrOfNames = ["Armand","Bart","Annie","Caro","Alain","Brad"]
    var namesByAlphabet: [String.Element:[String]]!

    
    
    
    override func viewDidLoad() {
        namesByAlphabet = Dictionary(grouping:arrOfNames,by:{$0.first!})
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func search(_ sender: UITextField) {
        resultToDisplay = ""
                for i in namesByAlphabet {
                    if textField.text == String(namesByAlphabet.keys){
                        print("ok")
                    }
                    
            
            
        }
        
    }
    
}

