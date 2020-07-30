//
//  MyTableViewCell.swift
//  Contacts
//
//  Created by thinhdang on 7/28/20.
//  Copyright © 2020 Oscar. All rights reserved.
//

import UIKit

protocol MyViewCellDelegate : AnyObject{
    func didTapButton(with title:String)
}
class MyTableViewCell: UITableViewCell {

    weak var delegate:MyViewCellDelegate?
  
    static let identifier = "MyTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "MyTableViewCell",
                     bundle: nil)
    }

    //MARK: -SET TITLE BUTTON
    private var title: String = ""
      @IBOutlet var buttonFunction: UIButton!
      @IBAction func didTapButton(){
          delegate?.didTapButton(with: title)
      }
    func configure(with title: String){
        self.title = title
        buttonFunction.setTitle(title, for: .normal)
    }

//MARK: -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
	            buttonFunction.setTitleColor(.link, for: .normal)
    }
}
