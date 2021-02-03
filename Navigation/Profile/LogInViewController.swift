//
//  LogInViewController.swift
//  Navigation
//
//  Created by Алена Чимирис on 22.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit


class LogInViewController: UIViewController, UITableViewDelegate {
    
    //    let profileHeaderView = ProfileHeaderView()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    //    private let adapter = LogInViewController()
    private let cellID = "cellID"
    
    private func setupTableView() {
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        tableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 10
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(type(of: self), #function)
        
        self.navigationController?.navigationBar.isHidden = true
        
        //        scrollView.isUserInteractionEnabled = false
        //        contentView.isUserInteractionEnabled = false
        //        view.isUserInteractionEnabled = false
        setupLayout()
        setupTableView()
        //      configure()
        //                view.addSubview(contentView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        //        scrollView.addSubview(tableView)
        
        //Клавиатура
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    private func setupLayout() {
        contentView.addSubview(tableView)
        contentView.addSubview(logInImage)
        contentView.addSubview(logInButton)
        contentView.addSubview(scrollView)
        contentView.addSubview(logInLabel)
        contentView.addSubview(passwordLabel)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(loginTextField)
        
        let constraints = [
            
            logInImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 120),
            logInImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 140),
            //            logInImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            //            logInImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            logInImage.widthAnchor.constraint(equalToConstant: 100),
            logInImage.heightAnchor.constraint(equalToConstant: 100),
            //        logInImage.bottomAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
            
            tableView.topAnchor.constraint(equalTo: logInImage.bottomAnchor, constant: 120),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            //            tableView.widthAnchor.constraint(equalToConstant: 332),
            tableView.heightAnchor.constraint(equalToConstant: 100),
            //                        logInLabel.bottomAnchor.constraint(equalTo: logInLabel.bottomAnchor),
            
            logInButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            //            logInButton.widthAnchor.constraint(equalToConstant: 332),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: Keyboard actions
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .leastNonzeroMagnitude
        scrollView.scrollIndicatorInsets = .zero
    }
    
    
    private(set) lazy var logInImage: UIImageView! = {
        let logInImage = UIImageView()
        logInImage.image = #imageLiteral(resourceName: "logo")
        logInImage.layer.borderColor = UIColor.lightGray.cgColor
        logInImage.layer.borderWidth = 0.5
        logInImage.layer.cornerRadius = 10
        logInImage.translatesAutoresizingMaskIntoConstraints = false
        return logInImage
    }()
    
    var avatarImageSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    var logInLabel: UILabel! = {
        let logInLabel = UILabel()
        logInLabel.tintColor = .lightGray
        logInLabel.layer.borderColor = UIColor.lightGray.cgColor
        logInLabel.layer.borderWidth = 0.5
        logInLabel.layer.cornerRadius = 10
        logInLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        //        logInLabel.textAlignment = .left
        logInLabel.translatesAutoresizingMaskIntoConstraints = false
        return logInLabel
    }()
    
    var passwordLabel: UILabel! = {
        let passwordLabel = UILabel()
        //        passwordLabel.layer.backgroundColor = UIColor.systemGray6
        //        passwordLabel.tintColor = UIColor.accentColor
        passwordLabel.tintColor = .lightGray
        passwordLabel.layer.borderColor = UIColor.lightGray.cgColor
        passwordLabel.layer.borderWidth = 0.5
        passwordLabel.layer.cornerRadius = 10
        passwordLabel.font = UIFont.systemFont(ofSize: 16)
        //        passwordLabel.textAlignment = .left
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
    
    var passwordTextField: UITextField! = {
        let passwordTextField = UITextField()
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.isSecureTextEntry = true
        // passwordTextField.tintColor = .accentColor
        passwordTextField.autocapitalizationType = .none
        return passwordTextField
    }()
    
    var loginTextField: UITextField! = {
        let loginTextField = UITextField()
        loginTextField.textColor = .black
        loginTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginTextField.autocapitalizationType = .none
        return loginTextField
    }()
    
    
    
    private(set) lazy var logInButton: UIButton! = {
        let logInButton = UIButton()
        logInButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.layer.cornerRadius = 10
        return logInButton
    }()
    
    
    @objc  func logInButtonPressed() {
        print("tapped")
        contentView.endEditing(true)
        if passwordTextField.isFirstResponder {
            passwordTextField.resignFirstResponder()
        }
        if loginTextField.isFirstResponder {
            loginTextField.resignFirstResponder()
        }
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        contentView.frame = CGRect(x: 0, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        
        
        scrollView.contentSize = contentSize
        
    }
    
}


let data = ["Email of phone","Password"]

extension LogInViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as UITableViewCell
        //        cell.frame = CGRect(x: tableView.frame.maxX, y: tableView.frame.maxY, width: tableView.frame.width, height: 100)
        cell.textLabel!.textColor = .lightGray
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.textLabel!.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        cell.textLabel!.text = data[indexPath.row]
        //      cell.layoutSubviews()
        
        return cell
    }
    
}
