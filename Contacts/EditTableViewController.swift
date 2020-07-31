//
//  EditTableViewController.swift
//  Contacts
//
//  Created by thinhdang on 7/30/20.
//  Copyright © 2020 Oscar. All rights reserved.
//

import UIKit
protocol EditContactDelegate: AnyObject
 {
    func editContact(contact: Contacts)
}
class EditTableViewController: UITableViewController {
  
        //MARK:-Properties
    weak var delegate:EditContactDelegate?
        @IBOutlet weak var avatarImageView: UIImageView!
        @IBOutlet weak var nameTextField: UITextField!
        @IBOutlet weak var positionTextField: UITextField!
        @IBOutlet weak var emailTextField: UITextField!
        @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
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
            self.navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleDone))
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
        
        
        @objc func handleDone(){
        self.contact = Contacts(name: self.nameTextField.text ?? "Default Name", position: self.positionTextField.text ?? "Default position", email: self.emailTextField.text ?? "Default email", phone: self.phoneTextField.text ?? "Default phone" )
        delegate?.editContact(contact: contact!)
    }
    
}
