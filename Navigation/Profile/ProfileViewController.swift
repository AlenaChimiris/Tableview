
//  ProfileViewController.swift
//  Navigation
//
//  Created by Алена Чимирис on 07.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate {
    
    //    let profileHeaderView = ProfileHeaderView()
//        let postTableViewCell = PostTableViewCell()
    
    @IBOutlet var headerView: ProfileHeaderView!
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(type(of: self), #function)
        
        view.backgroundColor = .lightGray
//        configure()
        setupLayout()
        setupTableView()
        view.addSubview(scrollView)
        //        view.addSubview(profileHeaderView)
        
        scrollView.addSubview(contentView)
        // кнопка внизу’
        //        view.addSubview(button)
        view.isUserInteractionEnabled = true
        //        scrollView.isUserInteractionEnabled = false
        
        
        //        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        //        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    // кнопка внизу
    //    private(set) lazy var button: UIButton = {
    //        let button = UIButton()
    //        button.setTitle("Tap Me!", for: .normal)
    //        button.setTitleColor(.white, for: .normal)
    //        button.addTarget(self, action: #selector(newButtonPressed), for: .touchUpInside)
    //        return button
    //    }()
    //
    //     @objc  func newButtonPressed() {
    //        print("tapped")
    //    }
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var contentSize: CGSize = .zero
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
//    let postView: PostView
//
//    init(postView: PostView) {
//        self.postView = postView
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//     private func configure() {
//
//        nameLabelPost.text = postView.nameLabelPost
//        imagePost.image = postView.imagePost
//        descriptionPost.text = postView.descriptionPost
//        likesPost.text = postView.likesPost
//        viewsPost.text = postView.viewsPost
//    }
    

    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.frame = CGRect(x: 0, y: 302, width: view.bounds.width, height: view.bounds.height)
        contentView.frame = CGRect(x: 0, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        
        
        scrollView.contentSize = contentSize
        
    }
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private let cellID = "cellID"
    
   static var reuseID: String {
        return String(describing: PostTableViewCell.self)
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.reuseID)
    }
    
    
    private func setupLayout() {
        contentView.addSubview(scrollView)
        contentView.addSubview(tableView)
        //    contentView.addSubview(postTableViewCell)
        
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}


extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.postViews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseID, for: indexPath) as! PostTableViewCell
//        let image = Storage.postViews[indexPath.item]
//        cell.imagePost.image = image
        
        return cell
    }
    
}
