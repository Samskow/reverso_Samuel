//
//  ViewController.swift
//  testnamesbyalphabet
//
//  Created by samuel on 01/11/2017.
//  Copyright © 2017 samuel. All rights reserved.
//

import UIKit
import Foundation
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var tableViewHome: UITableView!
    @IBOutlet weak var resultat: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    var theKey = String()
    var theValue = String()
    var listElementCorrespondants = [String]()
    var tabMotsFr = ["chat🐱","chien🐶","loup🐺","ours🐻","tigre🐯","perroquet ","crabe🦀","loutre"]
    var tabMotsAn = ["cat","dog","wolf","bear","tiger","parrot","crab","otter"]
    var dictFrAn = ["chat":"cat","chien":"dog","loup":"wolf","ours":"bear","tigre":"tiger","perroquet":"parrot","canard":"duck","crabe":"crab","loutre":"otter","sanglier":"boar","serpent":"snake","vache":"cow"]
    
    override func viewDidLoad() {
        print("OKKK")
        manageUser()
        dictFrAn = Dictionary(uniqueKeysWithValues: zip(tabMotsFr,tabMotsAn)) // par defaut c'est des mots français
        tableViewHome.reloadData()
        textfield.placeholder = "Mot en français"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //---------------------test
    override func viewWillAppear(_ animated: Bool) {
        print("reload")
        super.viewWillAppear(animated)
        choisirLangue()
    }
    
    
    //------------------SAVE-----------------------------
    func manageUser() {
        if UserDefaults.standard.object(forKey: "french") != nil{ // si la key object existe on lui donne ses valeurs
            tabMotsFr = UserDefaults.standard.object(forKey: "french") as! [String]
            tabMotsAn = UserDefaults.standard.object(forKey: "english") as! [String]
            print("il y a deja des valeurs attribuées")
            print("mot fr :",tabMotsFr)
            print("mot an :",tabMotsAn)
            print(dictFrAn)
            
        }else{ // valeurs par défaut
            tabMotsFr = ["chat🐱","chien🐶","loup🐺","ours🐻","tigre🐯","perroquet ","crabe🦀","loutre"]
            tabMotsAn = ["cat","dog","wolf","bear","tiger","parrot","crab","otter"]
            print("il y a pas de valeurs attribuées mais on initialise avec des mots de base")
            print(tabMotsFr)
        }
        
        
    }
    
    
    //-----------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (listElementCorrespondants.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: nil)
        cell.textLabel?.text = listElementCorrespondants[indexPath.row]
        return cell
    }
    //---------CHANGER DE LANGUE --------------------------
    
    @IBAction func choixDeLangue(_ sender: UISegmentedControl) {
        
        choisirLangue()
    }
    
    func choisirLangue() {
        switch segment.selectedSegmentIndex {
        case 0:
            manageUser()
            textfield.text = ""
            textfield.placeholder = "Mot en français"
            listElementCorrespondants = [String]()
            tableViewHome.reloadData()
            dictFrAn = Dictionary(uniqueKeysWithValues: zip(tabMotsFr,tabMotsAn))
            resultat.text = "Resultat"
            
        case 1:
            manageUser()
            textfield.text = ""
            textfield.placeholder = "Mot en anglais"
            listElementCorrespondants = [String]()
            tableViewHome.reloadData()
            dictFrAn = Dictionary(uniqueKeysWithValues: zip(tabMotsAn,tabMotsFr))
            resultat.text = "Resultat"
        default:
            break
        }
    }
    
    //----------HOME---------------------------
    
    @IBAction func traduire(_ sender: UIButton) {
        
        resultat.text = ""
        for (keys,value) in dictFrAn {
            
            if (textfield.text)?.uppercased() == (keys).uppercased(){
                resultat.text = value
                
            }
        }
    }
    
    //-------------------------------------
    @IBAction func controleDuTextField(_ sender: UITextField) {
        manageUser()
        let premiereLettre = ((textfield.text!).characters.first?.description ?? "")
        print(premiereLettre)
        listElementCorrespondants = [String]()
        
        for (keys,_) in dictFrAn {
            
            if premiereLettre.uppercased() == (keys.characters.first?.description ?? "").uppercased(){
                print(keys,"commence par",premiereLettre)
                listElementCorrespondants.append(keys)
                //sauvegarder
                tableViewHome.reloadData()
            }
            else if textfield.text == "" {
                
                listElementCorrespondants = [String]()
                tableViewHome.reloadData()
                
                
            }
            
        }
        print("tab est ",listElementCorrespondants)
        
        
    }
    
    // pour recuperer un element selectionner
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("dictionnaire afficher", [String](listElementCorrespondants)[indexPath.row])
        textfield.text = [String](listElementCorrespondants)[indexPath.row]
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    let TEXT_FIELD_LIMIT = 1
    func textField(_ _textFiel: UITextField,shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        return(textfield.text?.utf16.count ?? 0) + string.utf16.count - range.length <= TEXT_FIELD_LIMIT
    }
    
    
    
    
    
    //----------MEMO---------------------------
    
    // Utiliser le userDefault comme  variable globale et distribuer au différente interface
    
    // dictFrAn = [textfield.text!:textfield.text!] //pour ajouter une keys:value
    
    // quand on clique sur anglais on echange les key et value
    
    // probleme quand on veux recuperer l'index
    
    
}

