//
//  ViewController.swift
//  testnamesbyalphabet
//
//  Created by samuel on 01/11/2017.
//  Copyright © 2017 samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    
    
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var tableViewHome: UITableView!
    @IBOutlet weak var resultat: UILabel!
    
    var resultToDisplay:String = ""
    
    
    var namesByAlphabet: [String.Element:[String]]!
    
    
    var theKey = String()
    var theValue = String()
    var listElementCorrespondants = [String]()
    var dictFrAn = ["chat":"cat","chien":"dog","loup":"wolf","ours":"bear","tigre":"tiger","perroquet":"parrot","canard":"duck"]
    var tabMotsFr = ["chat","chien","loup","ours","tigre","perroquet"]
    var tabMotsAn = ["cat","dog","wolf","bear","tiger","parrot"]
    
    override func viewDidLoad() {
        //        namesByAlphabet = Dictionary(grouping:arrOfNames,by:{$0.first!})
        
        
        textfield.placeholder = "Mot en français"
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //-----------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listElementCorrespondants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: nil)
        cell.textLabel?.text = listElementCorrespondants[indexPath.row]
        return cell
    }
    //---------CHANGER DE LANGUE --------------------------
    
    @IBAction func choixDeLangue(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            textfield.text = ""
            textfield.placeholder = "Mot en français"
            listElementCorrespondants = [String]()
            tableViewHome.reloadData()
            dictFrAn = Dictionary(uniqueKeysWithValues: zip(tabMotsFr,tabMotsAn))
            resultat.text = "Resultat"
            
        case 1:
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
        
        
        textfield.text = [String](dictFrAn.keys)[indexPath.row]
        print("dictionnaire afficher", [String](dictFrAn.keys)[indexPath.row])
        
    }
    
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        textField.resignFirstResponder()
    //        return true
    //    }
    
    //    let TEXT_FIELD_LIMIT = 1
    //    func textField(_ _textFiel: UITextField,shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
    //
    //        return(textfield.text?.utf16.count ?? 0) + string.utf16.count - range.length <= TEXT_FIELD_LIMIT
    //    }
    
    
    
    
    
    //----------MEMO---------------------------
    
    // Utiliser le userDefault comme  variable globale et distribuer au différente interface
    
    //        dictFrAn = [textfield.text!:textfield.text!] //pour ajouter une keys:value
    
    // quand on clique sur anglais on echange les key et value
    
    
    
    
    
}

