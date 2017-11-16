//
//  AddViewController.swift
//  testnamesbyalphabet
//
//  Created by samuel on 09/11/2017.
//  Copyright © 2017 samuel. All rights reserved.
//

import Foundation

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var tabMotsFr = ["chat🐱","chien🐶","loup","ours🐻","tigre🐯","perroquet ","crabe🦀","loutre"]
    var tabMotsAn = ["cat","dog","wolf","bear","tiger","parrot","crab","otter"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(tabMotsFr.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: nil)
        cell.selectionStyle = .blue
        cell.textLabel?.text = "\(tabMotsFr[indexPath.row]) = \(tabMotsAn[indexPath.row])"
        
        return cell
    }
    
    
    
    @IBOutlet weak var listTableView: UITableView!
  
    @IBOutlet weak var label: UILabel!
    var addDictFrAn = ["chat":"cat","chien":"dog"]
    
    
    
    override func viewDidLoad() {
        manageUser()
         
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //-------------Pour actualiser la tab bar controller ----------
    override func viewWillAppear(_ animated: Bool) {
        print("reload")
        super.viewWillAppear(animated)
        manageUser()
    }
    
    func manageUser() {
        if UserDefaults.standard.object(forKey: "french") != nil{ // si la key object existe on lui donne ses valeurs
            tabMotsFr = UserDefaults.standard.object(forKey: "french") as! [String]
            tabMotsAn = UserDefaults.standard.object(forKey: "english") as! [String]
            print("il y a deja des valeurs attribuées")
        }else{ // valeurs par défaut
            tabMotsFr = ["chat🐱","chien🐶","loup🐺","ours🐻","tigre🐯","perroquet ","crabe🦀","loutre"]
            tabMotsAn = ["cat","dog","wolf","bear","tiger","parrot","crab","otter"]
            print("il y a pas de valeurs attribuées mais on initialise avec des mots de base")
        }
        
        
    }
    
  
    
    
}

