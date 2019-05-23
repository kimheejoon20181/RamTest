//
//  ViewController.swift
//  RamTest
//
//  Created by D7703_22 on 2019. 5. 23..
//  Copyright © 2019년 fb. All rights reserved.
//

import UIKit
import RealmSwift

class Person: Object {
    @objc dynamic var name = " "
    @objc dynamic var age = 0
}

class ViewController: UIViewController {
    @IBOutlet weak var txtV: UITextField!
    @IBOutlet weak var txtA: UITextField!
    @IBOutlet weak var txtView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAdd(_ sender: Any) {
        let person = Person{}
        
        person.name = txtV.text!
        person.age = Int(txtA.text!)!
            
        let realm = try! Realm()
        try! realm.write {
            realm.add(person)
        }
        
        txtView.text = ""
        txtA.text = ""
    }
    
    @IBAction func btnDeleteAll(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        
        txtView.text = ""
    }
    
    @IBAction func btnGet(_ sender: Any) {
        txtView.text = ""
        
        let realm = try! Realm()
        let vals = realm.objects(Person.self)
        
        if vals.count == 0{
            return
        } else{
            for i in vals {
                txtView.text = txtView.text! + "Name: \(i.name) Age: \(i.age)\n"
            }
        }
    }
}

