//
//  CustomTableViewCell.swift
//  Inst_page
//
//  Created by Марк Шнейдерман on 27.01.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

      //MARK: -User
    @IBOutlet weak var avaImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var nickNameCommentLabel: UILabel!

    
      //MARK: -Settings
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
      //MARK: -POST
    @IBOutlet weak var mainAvaImageView: UIImageView!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var countLikeLabel: UILabel!
    weak var delegate:DeleteDelegate?
    var post : Post!
    
    
    func configure_settings(){
        likesLabel.text = "Нравится:"
        likeButton.setImage(#imageLiteral(resourceName: "like_passiv"), for: .normal)
        commentButton.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        sendButton.setImage(#imageLiteral(resourceName: "send"), for: .normal)
        saveButton.setImage(#imageLiteral(resourceName: "Save"), for: .normal)
    }
    func configure_user(with user : User){
        avaImageView.image = user.ava
        avaImageView.layer.cornerRadius = avaImageView.frame.height / 2
        avaImageView.layer.borderColor = #colorLiteral(red: 0.8588235294, green: 0.8588235294, blue: 0.8588235294, alpha: 1)
        avaImageView.layer.borderWidth = 1
        avaImageView.clipsToBounds = true
        nickNameLabel.text = user.name
        nickNameCommentLabel.text = user.name
    }
    
    func configure_post(with post : Post){
        mainAvaImageView.image = UIImage(named:post.image)
        dataLabel.text = post.data
        commentLabel.text = post.text
        countLikeLabel.text = String(describing:post.likes)
    }
    
    @IBAction func deletePostButton(_ sender: Any) {
        delegate?.deletePost(with: post)
    }
}
