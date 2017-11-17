//
//  AddViewController.swift
//  testnamesbyalphabet
//
//  Created by samuel on 09/11/2017.
//  Copyright © 2017 samuel. All rights reserved.
//

import Foundation

import UIKit

class AddViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    
    
    @IBOutlet weak var addTableView: UITableView!
    @IBOutlet weak var texfieldFrancais: UITextField!
    @IBOutlet weak var textfieldAnglais: UITextField!
    var tabMotsFr = ["chat🐱","chien🐶","loup🐺","ours🐻","tigre🐯","souris🐭 ","crabe🦀","grenouille🐸","abeille🐝","lapin🐰","écureuil🐿"]
    var tabMotsAn = ["cat🐱","dog🐶","wolf🐺","bear🐻","tiger🐯","mouse🐭","crab🦀","frog🐸","bee🐝","rabbit🐰","squirrel🐿"]
    var dictFrAn = [String:String]()
    var theKey = ""
    var theValue = ""
    var addlistElementCorrespondants = [String]()
    
    
    
    override func viewDidLoad() {
        manageUser()
         dictFrAn = Dictionary(uniqueKeysWithValues: zip(tabMotsFr,tabMotsAn)) // par defaut c'est des mots français
        super.viewDidLoad()
        addTableView.reloadData()
    }
    //------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //---------------------test
    override func viewWillAppear(_ animated: Bool) {
        print("reload")
        super.viewWillAppear(animated)
        manageUser()
    }
    //------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addlistElementCorrespondants.count
    }
    //------------------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: nil)
        
        
        
        print("la liste est",addlistElementCorrespondants)
        cell.textLabel?.text = addlistElementCorrespondants[indexPath.row]
        return cell
    }
    //------------------
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //------------------
    
    @IBAction func Ajouter(_ sender: UIButton) {
        theKey = texfieldFrancais.text!
        theValue = textfieldAnglais.text!
        addlistElementCorrespondants.append("\(theKey) = \(theValue)")
        texfieldFrancais.text! = ""
        textfieldAnglais.text! = ""
        tabMotsFr.append(theKey)
        tabMotsAn.append(theValue)
        
        UserDefaults.standard.set(tabMotsFr, forKey: "french")
        UserDefaults.standard.set(tabMotsAn, forKey: "english")
        manageUser()
        // zip dict
        
        addTableView.reloadData()
        
        
        //let dict:[String:String] = ["key":"Hello"] UserDefaults.standard.set(dict, forKey: "dict") let result = UserDefaults.standard.value(forKey: "dict") print(result!) // Output -> { key:hello;}  // à tester
    }
    //------------------SAVE-----------------------------
    func manageUser() {
        if UserDefaults.standard.object(forKey: "french") != nil{ // si la key object existe on lui donne ses valeurs
            tabMotsFr = UserDefaults.standard.object(forKey: "french") as! [String]
            tabMotsAn = UserDefaults.standard.object(forKey: "english") as! [String]
            print("il y a deja des valeurs attribuées")
        }else{ // valeurs par défaut
            tabMotsFr = ["chat🐱","chien🐶","loup🐺","ours🐻","tigre🐯","souris🐭 ","crabe🦀","grenouille🐸","abeille🐝","lapin🐰","écureuil🐿"]//mots d'origine
            tabMotsAn = ["cat🐱","dog🐶","wolf🐺","bear🐻","tiger🐯","mouse🐭","crab🦀","frog🐸","bee🐝","rabbit🐰","squirrel🐿"]//mots d'origine
            print("il y a pas de valeurs attribuées mais on initialise avec des mots de base")
        }
        
        
    }
    
    
    
}
