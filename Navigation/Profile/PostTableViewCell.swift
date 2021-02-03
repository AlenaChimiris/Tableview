//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Алена Чимирис on 17.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var postView: PostView?
//    {
//        didSet {
//            nameLabelPost.text = postView?.nameLabelPost
//            imagePost.image = postView?.imagePost
//            descriptionPost.text = postView?.descriptionPost
//            likesPost.text = postView?.likesPost
//            viewsPost.text = postView?.viewsPost
//        }
//    }
    
   static  var reuseID: String {
        return String(describing: PostTableViewCell.self)
    }
    
    internal func configure(postView: PostView) {
        self.postView = postView
        
        nameLabelPost.text = postView.nameLabelPost
        imagePost.image = postView.imagePost
        descriptionPost.text = postView.descriptionPost
        likesPost.text = postView.likesPost
        viewsPost.text = postView.viewsPost
    }
    
    private var nameLabelPost: UILabel! = {
        let nameLabelPost = UILabel()
        nameLabelPost.font = UIFont.systemFont(ofSize: 20)
        nameLabelPost.textColor = .black
        nameLabelPost.numberOfLines = 1
        return nameLabelPost
    }()
    
    
    var imagePost: UIImageView! = {
        let imagePost = UIImageView()
        return imagePost
    }()
    
    private var descriptionPost: UILabel! = {
        let descriptionPost = UILabel()
        descriptionPost.font = UIFont.systemFont(ofSize: 14)
        descriptionPost.textColor = .lightGray
        descriptionPost.numberOfLines = 0
        return descriptionPost
    }()
    
    private var likesPost: UILabel! = {
        let likesPost = UILabel()
        likesPost.font = UIFont.systemFont(ofSize: 16)
        likesPost.textColor = .black
        return likesPost
    }()
    
    private var viewsPost: UILabel! = {
        let viewsPost = UILabel()
        viewsPost.font = UIFont.systemFont(ofSize: 16)
        viewsPost.textColor = .black
        return viewsPost
    }()
    
    

    
    private func setupLayout() {
        contentView.addSubview(nameLabelPost)
        contentView.addSubview(imagePost)
        contentView.addSubview(descriptionPost)
        contentView.addSubview(likesPost)
        contentView.addSubview(viewsPost)
        
        let const = [
            //            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            //            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            //            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            //            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
            nameLabelPost.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabelPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabelPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imagePost.topAnchor.constraint(equalTo: nameLabelPost.topAnchor),
            imagePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePost.widthAnchor.constraint(equalToConstant: 120),
            imagePost.heightAnchor.constraint(equalToConstant: 200),
            imagePost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            descriptionPost.topAnchor.constraint(equalTo: imagePost.topAnchor),
            descriptionPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            likesPost.topAnchor.constraint(equalTo: descriptionPost.topAnchor),
            likesPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            viewsPost.topAnchor.constraint(equalTo: descriptionPost.topAnchor),
            viewsPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            
        ]
        
        NSLayoutConstraint.activate(const)
        
    }
    
    
}
