//
//  EditTableViewController.swift
//  Contacts
//
//  Created by thinhdang on 7/30/20.
//  Copyright © 2020 Oscar. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController {
  
        //MARK:-Properties
      
        @IBOutlet weak var avatarImageView: UIImageView!
        @IBOutlet weak var nameTextField: UITextField!
        @IBOutlet weak var positionTextField: UITextField!
        @IBOutlet weak var emailTextField: UITextField!
        @IBOutlet weak var phoneTextField: UITextField!
        var contact: Contacts?

        var name = String()
        var phone = String()
        var email = String()
        var position = String()
        var photo = UIImage()
        //MARK:-Init
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
            showInfo()
            
        }
        //MARK: -Show infor
        func showInfo(){
            nameTextField.text = name
            positionTextField.text = position
            phoneTextField.text = phone
            emailTextField.text = email
            avatarImageView.image = photo
        }
        //MARK: -Handle navigationBar
        @objc func handleCancel(){
            self.dismiss(animated: true, completion: nil)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save"{
            if let name = nameTextField.text,
            let position = positionTextField.text,
            let email = emailTextField.text,
            let phone = phoneTextField.text {
                self.contact = Contacts(name: name, position: position, email: email, phone: phone)
            }
        }
    }
    
}
