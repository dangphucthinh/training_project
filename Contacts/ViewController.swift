//
//  ViewController.swift
//  Contacts
//
//  Created by Oscar on 7/22/20.
//  Copyright © 2020 Oscar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var TableView: UITableView!
    
    var contactsItem : [Contacts]  = [Contacts]()
    var aphabel = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            createPersonList()
            TableView.delegate = self
            TableView.dataSource = self
            //MARK:--BUTTON ADD delegate
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddContact))
        }
    @objc func handleAddContact(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "addView") as! AddViewController
        vc.delegate = self
        vc.navigationItem.largeTitleDisplayMode = .never
        present(UINavigationController(rootViewController: vc),animated: true)
    }
    //MARK: -add segue contacts
//       override func viewDidAppear(_ animated: Bool) {
//           super.viewDidAppear(true)
//           TableView.reloadData()
//       }
//
//       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//           if let nav = segue.destination as? UINavigationController, let AddVC = nav.topViewController as? AddViewController {
//               AddVC.delegate = self
//           }
//       }
    

}
       
        //MARK: -PASS DATA FROM VIEWCONTROLLER TO SECONDVIEWCONTROLLER
    extension ViewController:UITableViewDelegate{
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = storyboard?.instantiateViewController(identifier: "second") as! SecondViewController
            vc.navigationItem.largeTitleDisplayMode = .never
            
            //pass data from view controller to second controller
            let person = contactsItem[indexPath.row]
            vc.textName = person.name
            vc.textMobile = person.phone
            vc.textPosition = person.position
            vc.textEmail = person.email
            navigationController?.pushViewController(vc, animated: true)
        }
    }

        //MARK: -CREATE A TITLE
    extension ViewController:UITableViewDataSource{
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return self.aphabel[section]
        }
    
        //MARK: -SHOW NUMBER OF SECTION
        func numberOfSections(in tableView: UITableView) -> Int {
            return contactsItem.count
        }
        
        //MARK: -SHOW NUMBER OF ROW IN SECTION
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contactsItem.count;
        }
        
        //MARK: -DISPLAY A DATA IN TABLE VIEW
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactTableViewCell
            let currentPerson = contactsItem[indexPath.row]
            cell.contact = currentPerson
            return cell
        }
        
        //MARK: -CREATE DATA
        func createPersonList(){
            contactsItem.append(Contacts( name: "Phuc-Thinh Dang", position: "Web developer, ReactJs", email: "dangphucthinha9@gmail.com", phone: "4-(968) 705-1370"))
           contactsItem.append(Contacts( name: "Oscar", position: "iOS developer, Swift", email: "oscar@enclave.vn", phone: "2-(513) 832-7517"))
           contactsItem.append(Contacts( name: "Cindy", position: "FE developer, ReactJS", email: "cindy@enclave.vn", phone: "1-(722) 844-1495"))
           contactsItem.append(Contacts( name: "Dusk", position: "Web Developer, NodeJS", email: "dusk@enclave.vn", phone: "9-(687) 559-3525"))
           contactsItem.append(Contacts( name: "Rebecca Rogers", position: "Web Developer, Bluewares", email: "gary@bluewares.com", phone: "9-(687) 559-3525"))
            contactsItem.append(Contacts( name: "Rebecca", position: "Web Developer, Bluewares", email: "gary@bluewares.com", phone: "9-(687) 559-3525"))
            contactsItem.sort{
                return $0.name > $1.name
            }
    }
}

// MARK: - AddContactDelegate
extension ViewController: AddContactDelegate {
    func addContact(contact: Contacts) {
            self.dismiss(animated: true) {
            self.contactsItem.append(contact)
            self.TableView.reloadData()
                print(self.contactsItem)
        }
    }
}

extension ViewController: EditContactDelegate{
    func editContact(contact: Contacts) {
        self.dismiss(animated: true){
            self.addContact(contact: contact)
            self.TableView.reloadData()
        }
    }
}





