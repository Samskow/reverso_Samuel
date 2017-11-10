//
//  ViewController.swift
//  testnamesbyalphabet
//
//  Created by samuel on 01/11/2017.
//  Copyright © 2017 samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
   
    
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var tableViewHome: UITableView!
    @IBOutlet weak var resultat: UILabel!
    
    var resultToDisplay:String = ""
    var arrOfNames = ["Armand","Bart","Annie","Caro","Alain","Brad"]
    var motsFrParLettre: [String.Element:[String]]!
    var namesByAlphabet: [String.Element:[String]]!
    var dictFrAn = ["chat":"cat","chien":"dog"]
    var theKey = ""
    var theValue = ""

    
    override func viewDidLoad() {
//        namesByAlphabet = Dictionary(grouping:arrOfNames,by:{$0.first!})
        
           motsFrParLettre = Dictionary(grouping:arrOfNames,by:{$0.first!})
         print(motsFrParLettre)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //----------HOME---------------------------
    
    @IBAction func traduire(_ sender: UIButton) {
        
        var premiereLettre = ((textfield.text!).characters.first?.description ?? "")
        
        print(premiereLettre)
        
        for (keys,value) in dictFrAn {
            print(keys,value,"Avant")
            if premiereLettre.uppercased() == (keys.characters.first?.description ?? "").uppercased(){
                print("ouiii")
                print(keys,value,"Apres")
                
                
            }
            
        }
        
        //        dictFrAn = [textfield.text!:textfield.text!] //pour ajouter une keys:value
        tableViewHome.reloadData()
    }
    
    
    
    //-----------------------------------------------
    
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

    
    
    
    
}

