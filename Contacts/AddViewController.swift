//
//  AddViewController.swift
//  Contacts
//
//  Created by thinhdang on 7/29/20.
//  Copyright © 2020 Oscar. All rights reserved.
//

import UIKit

protocol AddContactDelegate: AnyObject
 {
    func addContact(contact: Contacts)
}

class AddViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //MARK: --PROPERTIES
    weak var delegate:AddContactDelegate?
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldMobile: UITextField!
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var textFieldPosition: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    var contact:Contacts?
    //MARK: --INIT
       override func viewDidLoad() {
           super.viewDidLoad()
    
           self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
           self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
            //Do any additional setup after loading the view.
       }
    
    //MARK: --HANDLE FUNCTION Delegate
    @objc func handleDone(){
        self.contact = Contacts(name: self.textFieldName.text ?? "Default Name", position: self.textFieldPosition.text ?? "Default position", email: self.textFieldEmail.text ?? "Default email", phone: self.textFieldMobile.text ?? "Default phone" )
        delegate?.addContact(contact: contact!)
    }

    @objc func handleCancel(){
        self.dismiss(animated: true, completion: nil)
    }
    //MARK: --IMPORT AVATAR
//     @IBAction func importPhoto(_ sender: Any) {
//        let image = UIImagePickerController()
//        image.allowsEditing = true
//        image.sourceType = .photoLibrary
//        image.delegate = self
//        present(image,animated: true)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
//            imageAvatar.image = image
//        }else{
//            let alert = UIAlertController(title: "Error", message: "Something wrong!.", preferredStyle: UIAlertController.Style.alert)
//
//            // add an action (button)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//
//            // show the alert
//            self.present(alert, animated: true, completion: nil)
//        }
//         picker.dismiss(animated: true, completion: nil)
//    }
    
    //MARK: -Seque
    
//     @IBAction func doneButtonDidTouch(segue: UIStoryboardSegue) {
//            print("Done")
//    //        if let addPersonTbVController = segue.source as? AddViewController {
//    //            if let person = addPersonTbVController.contact {
//    //                self.contactsItem.append(person)
//    //            }
//    //        }
//            contact.name = textFieldName.text!
//            contact.email = textFieldEmail.text!
//            contact.phone = textFieldMobile.text!
//            contact.position = textFieldPosition.text!
//            delegate?.addContact(contact)
//            self.navigationController?.dismiss(animated: true, completion: nil)
//        }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "save" {
//            self.contact = Contacts(name: self.textFieldName.text ?? "Default Name", position: self.textFieldPosition.text ?? "Default position", email: self.textFieldEmail.text ?? "Default email", phone: self.textFieldMobile.text ?? "Default phone" )
//        }
//    }
    
}
    
