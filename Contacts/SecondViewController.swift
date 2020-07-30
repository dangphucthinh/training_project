//
//  SecondViewController.swift
//  Contacts
//
//  Created by Oscar on 7/23/20.
//  Copyright © 2020 Oscar. All rights reserved.
//

import UIKit



class SecondViewController : UIViewController, UITableViewDataSource{
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var labelTextName: UILabel!
    //MARK:-DECLARE PROPERTIES
    var data = ["Mobile",
                "Position",
                "Email",
                "Send Message",
                "Share Contacts",
                        ]
    var contact: Contacts?
    var textName = String() //declear to pass name person
    var textMobile = String()
    var textPosition = String()
    var imageAvatar = UIImage()
    var textEmail = String()
    //MARK: -INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        designAvatar()
        labelTextName.text = textName
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        table.dataSource = self
    //MARK: -Edit delegate
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleDone))
    }
    //MARK: -pass data BUTTON
    @objc func handleDone(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "editView") as! EditTableViewController
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.name = textName
        vc.email = textEmail
        vc.position = textPosition
        vc.photo = imageAvatar
        vc.phone = textMobile
       
        present(UINavigationController(rootViewController: vc),animated: true)
    }
    //MARK: -Custom avatar
    func designAvatar(){
        imageView.image = imageAvatar
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.layer.borderWidth = 1
    }
    //MARK: -Handle edit segue
    
    
    //MARK: -table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//       let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
//       cell.configure(with: data[indexPath.row])
//       cell.delegate = self
//       return cell
        switch (indexPath.row) {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
            cell.configure(with: data[indexPath.row])
            cell.buttonFunction.setTitle(textMobile, for: .normal)
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
            cell.configure(with: data[indexPath.row])
            cell.buttonFunction.setTitle(textPosition, for: .normal)
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
            cell.configure(with: data[indexPath.row])
            cell.buttonFunction.setTitle(textEmail, for: .normal)
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
            cell.configure(with: data[indexPath.row])
            cell.delegate = self
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
            cell.configure(with: data[indexPath.row])
            cell.delegate = self
            return cell

        default:
            return UITableViewCell()
        }
    }
}
    //MARK: Handle delete contact
extension SecondViewController:MyViewCellDelegate{
    func didTapButton(with title:String){
            print("\(title)")
    }
}





