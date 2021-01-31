//
//  WelcomeVC.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 12/9/20.
//

import UIKit

class WelcomeVC: UIViewController {

//    private let siwaButton       = ASAuthorizationAppleIDButton(type: .continue, style: .black)
//    private let createQuizImage    = UIImageView()
//    let viewModel = LoginViewModel()
    
    // Unhashed nonce.
//    fileprivate var currentNonce: String?
    
    lazy var view1: UIView = {
        let view = UIView()
        
        let createQuizImage = UIImageView()
        createQuizImage.image         = Images.createQuiz
        createQuizImage.contentMode   = .scaleAspectFit
        view.addSubview(createQuizImage)
        createQuizImage.pinTo(view)
        
        let label = UILabel()
        label.text = "Create your own Quizes"
        label.textColor = Colors.lightBlue_darkWhite
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        label.adjustsFontForContentSizeCategory = true
        view.addSubview(label)
        label.edgeTo(view: createQuizImage)
        return view
    }()
    
    lazy var view2: UIView = {
        let view = UIView()
        
        let createQuizImage = UIImageView()
        createQuizImage.image         = Images.testBrain
        createQuizImage.contentMode   = .scaleAspectFit
        view.addSubview(createQuizImage)
        createQuizImage.pinTo(view)
        
        let label = UILabel()
        label.text = "Test your Brain"
        label.textColor = Colors.lightBlue_darkWhite
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        label.adjustsFontForContentSizeCategory = true
        view.addSubview(label)
        label.edgeTo(view: createQuizImage)
        return view
    }()
    
    lazy var view3: UIView = {
        let view = UIView()
        
        let createQuizImage = UIImageView()
        createQuizImage.image         = Images.improveMemory
        createQuizImage.contentMode   = .scaleAspectFit
        view.addSubview(createQuizImage)
        createQuizImage.pinTo(view)
        
        let label = UILabel()
        label.text = "Improve your memory"
        label.textColor = Colors.lightBlue_darkWhite
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        label.adjustsFontForContentSizeCategory = true
        view.addSubview(label)
        label.edgeTo(view: createQuizImage)
        return view
    }()
    
    lazy var views = [view1, view2, view3]
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height )
        }
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        return pageControl
    }()
    
    private let getStartedButton    = QMButton(backgroundColor: UIColor.clear,
                                               title: "Get Started",
                                               titleColor: .label,
                                               borderWidth: 2)


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.edgeTo(view: view)
        view.backgroundColor = Colors.lightWhite_darkBlue
//        configureLogoImageView()
//        setupAppleSignInButton()
        configureGetStartedButton()
        configurePageControl()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    
    @objc private func pushYourNameVC() {
        DispatchQueue.main.async {
            let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
            sceneDelegate.moveToTabBarController()
        }
    }
    
    
//    private func configureLogoImageView() {
//        view1.addSubview(createQuizImage)
//        createQuizImage.translatesAutoresizingMaskIntoConstraints = false
//        createQuizImage.image         = Images.createQuiz
//        createQuizImage.contentMode   = .scaleAspectFit
//        let topPadding = view.frame.height * 0.08
//
//        NSLayoutConstraint.activate([
//            createQuizImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topPadding),
//            createQuizImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            createQuizImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: CGFloat(UIDevice.getFloatValue(iphone: 0.2, ipad: 0.2))),
//            createQuizImage.widthAnchor.constraint(equalTo: createQuizImage.heightAnchor, multiplier: 3/4)
//        ])
//    }
    
    
    private func configureGetStartedButton() {
    view.addSubview(getStartedButton)
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.addTarget(self, action: #selector(pushYourNameVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),
            getStartedButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    private func configurePageControl() {
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = Colors.lightBlue_darkWhite
        pageControl.pageIndicatorTintColor = .systemGray4
        
        NSLayoutConstraint.activate([
            pageControl.heightAnchor.constraint(equalToConstant: 50),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            pageControl.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor, constant: -32)
        ])
    }
    
}


extension WelcomeVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
