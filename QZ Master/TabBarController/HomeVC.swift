//
//  HomeVC.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 12/9/20.
//

import UIKit

class HomeVC: UIViewController {
    
    private let helloLabel = QMLabel(text: "Hello,", textColor: Colors.lightBlue_darkWhite!, font: UIFont.preferredFont(forTextStyle: .title1).bold(), textAlign: .center, lineBreak: .byWordWrapping, numberOfLines: 1)
    
    private let fullnameLabel = QMLabel(text: "FullName from Apple ID", textColor: Colors.lightBlue_darkWhite!, font: UIFont.preferredFont(forTextStyle: .title1).bold(), textAlign: .center, lineBreak: .byWordWrapping, numberOfLines: 1)
    
    
    private let takeQuizButton = TakeQuizButton()
    
    private let createQuizButton = CreateQuizButton()
    
    
    private lazy var takeQuizImg: UIImageView = {
        let img = UIImageView()
        img.image = SFSymbols.playButton
//        img.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return img
    }()
    
    private lazy var createQuizImg: UIImageView = {
        let img = UIImageView()
        img.image = SFSymbols.createQuizButton
//        img.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return img
    }()
    
    
    private let takeQuizLabel = TakeCreateQuizLabel(text: "Take Quiz", textColor: .white, font: UIFont.preferredFont(forTextStyle: .title3).bold())
    
    private let createQuizLabel = TakeCreateQuizLabel(text: "Create Quiz", textColor: .white, font: UIFont.preferredFont(forTextStyle: .title3).bold())
    
    
    private lazy var welcomeLabelsVStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [helloLabel, fullnameLabel])
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fillProportionally
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var TakeCreateQuizButtonsVStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [takeQuizButton, createQuizButton])
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fillEqually
        sv.spacing = 25
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var takeQuizHStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [takeQuizImg, takeQuizLabel])
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .equalCentering
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()


    private lazy var createQuizHStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [createQuizImg, createQuizLabel])
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .equalCentering
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.lightWhite_darkBlue
        configureWelcomeLabelsVStack()
        configureTakeCreateQuizButtonsVStack()
        configureTakeCreateQuizButtons()
    }
    
    
    @objc private func pushToTakeQuizVC() {
        let takeQuizVC = TakeQuizVC()
        navigationController?.pushViewController(takeQuizVC, animated: true)
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut,
                       animations: {
                        self.tabBarController?.tabBar.isHidden = true
                       },
                       completion:  nil)
    }
    
    @objc private func pushToCreateQuizVC() {
        let createQuizVC = CreateQuizVC()
        navigationController?.pushViewController(createQuizVC, animated: true)
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut,
                       animations: {
                        self.tabBarController?.tabBar.isHidden = true
                       },
                       completion:  nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.prefersLargeTitles = false
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut,
                       animations: {
                        self.tabBarController?.tabBar.isHidden = false
                       },
                       completion:  nil)
    }
    
    
    private func configureWelcomeLabelsVStack() {
        view.addSubview(welcomeLabelsVStack)
        let topPadding = view.frame.height * 0.08
        
        NSLayoutConstraint.activate([
            welcomeLabelsVStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topPadding),
            welcomeLabelsVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            welcomeLabelsVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    private func configureTakeCreateQuizButtonsVStack() {
        view.addSubview(TakeCreateQuizButtonsVStack)
        let topPadding = view.frame.height * 0.1
        let leftRightPadding = view.frame.width * 0.05
        
        NSLayoutConstraint.activate([
            TakeCreateQuizButtonsVStack.topAnchor.constraint(equalTo: welcomeLabelsVStack.bottomAnchor, constant: topPadding),
            TakeCreateQuizButtonsVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftRightPadding),
            TakeCreateQuizButtonsVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leftRightPadding)
        ])
    }
    
    
    private func configureTakeCreateQuizButtons() {
        takeQuizButton.addSubview(takeQuizHStack)
        createQuizButton.addSubview(createQuizHStack)
        
        takeQuizButton.addTarget(self, action: #selector(pushToTakeQuizVC), for: .touchUpInside)
        createQuizButton.addTarget(self, action: #selector(pushToCreateQuizVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            // MARK: - Take Quiz
            takeQuizButton.leadingAnchor.constraint(equalTo: TakeCreateQuizButtonsVStack.leadingAnchor),
            takeQuizButton.trailingAnchor.constraint(equalTo: TakeCreateQuizButtonsVStack.trailingAnchor),
            takeQuizButton.heightAnchor.constraint(equalToConstant: 90),
            
            takeQuizHStack.leadingAnchor.constraint(equalTo: takeQuizButton.leadingAnchor, constant: 20),
            takeQuizHStack.centerYAnchor.constraint(equalTo: takeQuizButton.centerYAnchor),
            
            // MARK: - Create Quiz
            createQuizButton.leadingAnchor.constraint(equalTo: TakeCreateQuizButtonsVStack.leadingAnchor),
            createQuizButton.trailingAnchor.constraint(equalTo: TakeCreateQuizButtonsVStack.trailingAnchor),
            createQuizButton.heightAnchor.constraint(equalToConstant: 90),
            
            createQuizHStack.leadingAnchor.constraint(equalTo: createQuizButton.leadingAnchor, constant: 20),
            createQuizHStack.centerYAnchor.constraint(equalTo: createQuizButton.centerYAnchor)
        ])
    }
    


}
