//
//  ViewController.swift
//  testnamesbyalphabet
//
//  Created by samuel on 01/11/2017.
//  Copyright © 2017 samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
   
    //----- AJOUTER ------
    
    @IBOutlet weak var addTextfieldFrancais: UITextField!
    @IBOutlet weak var addTextfieldAnglais: UITextField!
    @IBOutlet weak var tableViewAdd: UITableView!
    
    
    
    
   //---- HOME ------
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var tableViewHome: UITableView!
    
    var resultToDisplay:String = ""
    var arrOfNames = ["Armand","Bart","Annie","Caro","Alain","Brad"]
    var namesByAlphabet: [String.Element:[String]]!
    var dictFrAn = ["chat":"cat","chien":"dog"]
    var theKey = ""
    var theValue = ""

    
    override func viewDidLoad() {
        namesByAlphabet = Dictionary(grouping:arrOfNames,by:{$0.first!})
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //----------HOME---------------------------
    
    @IBAction func traduire(_ sender: UIButton) {
        print("OK")
        
        dictFrAn = [textfield.text!:textfield.text!]
        tableViewHome.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictFrAn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: nil)
        //        cell.textLabel?.text = "MOTS"
//        let theKey = [String](dictFrAn.keys)[indexPath.row]
//        theValue = [String](dictFrAn.values)[indexPath.row]
        
        theKey = textfield.text!
        theValue = [String](dictFrAn.values)[indexPath.row]
        cell.textLabel?.text = "\(theKey) = \(theValue)"
        return cell
    }

    //----------AJOUTER---------------------------
    
    // Utiliser le userDefault comme  variable globale et distribuer au différente interface
    func tableViewAdd(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictFrAn.count
    }
    
    func tableViewAdd(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celladd: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: nil)
        
                celladd.textLabel?.text = "MOTS"
                let theKey = [String](dictFrAn.keys)[indexPath.row]
                theValue = [String](dictFrAn.values)[indexPath.row]
        
     
        celladd.textLabel?.text = "\(theKey) = \(theValue)"
        return celladd
    }
    
    
    
    
}

