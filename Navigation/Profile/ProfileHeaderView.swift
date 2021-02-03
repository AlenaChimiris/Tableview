//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Алена Чимирис on 07.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init with frame")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("init with coder")
    }
    
    @IBOutlet var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.layer.borderColor = UIColor.white.cgColor
            avatarImageView.layer.borderWidth = 3
            avatarImageView.layer.cornerRadius = 125/2
            avatarImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet var fullNameLabel: UILabel!  {
        didSet {
            fullNameLabel.text = "Hipster Cat"
            fullNameLabel.textColor = .black
            fullNameLabel.font = UIFont.systemFont(ofSize: 18)
            fullNameLabel.textAlignment = .left
        }
    }
    
    @IBOutlet var statusLabel: UILabel!   {
        didSet {
            statusLabel.text = "Waiting for something..."
            statusLabel.textColor = .gray
            statusLabel.font = UIFont.systemFont(ofSize: 16)
            statusLabel.textAlignment = .left
        }
    }
    
    @IBOutlet var statusTextField: UITextField! = {
        let status = UITextField()
        status.text = "Listening to music"
        return status
    }()
    
    
    @IBOutlet var setStatusButton: UIButton! {
        
        didSet {
            setStatusButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal) 
            setStatusButton.setTitle("Show status", for: .normal)
            setStatusButton.setTitleColor(.white, for: .normal)
            setStatusButton.layer.shadowRadius = 4
            setStatusButton.layer.shadowOffset.width = 4
            setStatusButton.layer.shadowOffset.height = 4
            setStatusButton.layer.shadowColor = UIColor.black.cgColor
            setStatusButton.layer.shadowOpacity = 0.7
        }
    }
    
    
    
    //    var avatarImageSize: CGSize {
    //        return CGSize(width: 122, height: 125)
    //    }
    
    //    var textLabelSize: CGSize {
    //        return CGSize(width: 210, height: 30)
    //    }
    
    
    func setupActionButton() {
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.masksToBounds = true
    }
    
    
    @IBAction func setStatusButton(_ sender: UIButton) {
        let status = statusTextField.text!
        print(status)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func addSubview(_ subview: UIView) {
        super.addSubview(subview)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}


