//
//  AddViewController.swift
//  testnamesbyalphabet
//
//  Created by samuel on 09/11/2017.
//  Copyright © 2017 samuel. All rights reserved.
//

import Foundation

import UIKit

class AddViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var addTableView: UITableView!
    @IBOutlet weak var texfieldFrancais: UITextField!
    @IBOutlet weak var textfieldAnglais: UITextField!
    var dictFrAn = ["chat":"cat","chien":"dog"]
    var theKey = ""
    var theValue = ""
    
    
    override func viewDidLoad() {
       
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictFrAn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: nil)
        
        //        cell.textLabel?.text = "MOTS"
        //        let theKey = [String](dictFrAn.keys)[indexPath.row]
        //        theValue = [String](dictFrAn.values)[indexPath.row]
        
        theKey = texfieldFrancais.text!
        theValue = textfieldAnglais.text!
        cell.textLabel?.text = "\(theKey) = \(theValue)"
        
        return cell
    }
    
   
    @IBAction func Ajouter(_ sender: UIButton) {
        dictFrAn = [texfieldFrancais.text!:textfieldAnglais.text!]
        addTableView.reloadData()
    }
    
    
    
}
