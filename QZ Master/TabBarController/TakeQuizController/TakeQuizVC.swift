//
//  TakeQuizVC.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 12/21/20.
//

import UIKit

class TakeQuizVC: BaseListController, UICollectionViewDelegateFlowLayout {
    
//    private var collectionView: UICollectionView!
    var sections = [Section]()
//    private var dataSource: UICollectionViewDiffableDataSource<Section, SectionItems>!
//    private var snapshot = NSDiffableDataSourceSnapshot<Section, SectionItems>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        view.isOpaque = false
        
        setupCollectionView()
        getData()
//        createDataSource()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    

    
    // MARK: - Setting up Collection View -
    
    private func setupCollectionView() {
        // Initialises the collection view with a CollectionViewLayout which we will define
//        collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        // Assigning data source and background color
//        collectionView.delegate = self
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.isUserInteractionEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
//
//        view.addSubview(collectionView)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
        
        // Registering all Cells
        collectionView.register(TakeQuizSingleQuizCell.self, forCellWithReuseIdentifier: TakeQuizSingleQuizCell.identifier)
        collectionView.register(TakeQuizMultipleQuizCell.self, forCellWithReuseIdentifier: TakeQuizMultipleQuizCell.identifier)
    }
    
    
    func getData() {
        NetworkManager.shared.getTakeQuizVCData { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let sections):
                DispatchQueue.main.async {
                    self.sections = sections
                    self.collectionView.reloadData()
                    print("SUCCESS")
                }
            case .failure(let error):
                print(error.rawValue)
                print("FAILED")
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch self.sections[indexPath.section].type {
            case "single":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TakeQuizSingleQuizCell.identifier, for: indexPath) as? TakeQuizSingleQuizCell
                cell?.takeQuizItems = sections[indexPath.item]
                print("Load Single Section")
                return cell!
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TakeQuizMultipleQuizCell.identifier, for: indexPath) as? TakeQuizMultipleQuizCell
                cell?.takeQuizItems = sections[indexPath.item]
                print("Load Multiple Section")
                return cell!
            }
                
        
//        let cellId = self.sections[indexPath.item].type
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BaseTakeQuizCell
//        let section = sections[indexPath.item]
//        cell.takeQuizItems = section
        
//        (cell as? TodayMultipleAppCell)?.multipleAppsController.collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMultipleAppsTap)))
        
//        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    

//    func createDataSource() {
//        dataSource = UICollectionViewDiffableDataSource<Section, SectionItems>(collectionView: collectionView) { collectionView, indexPath, item in
//            switch self.section[indexPath.section].type {
//            case "single":
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TakeQuizSingleQuizCell.identifier, for: indexPath) as? TakeQuizSingleQuizCell
//                cell?.takeQuizItems = item
//                print("Load Single Section")
//                return cell
//            default:
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TakeQuizMultipleQuizCell.identifier, for: indexPath) as? TakeQuizMultipleQuizCell
//                cell?.takeQuizItems = item
//                print("Load Multiple Section")
//                return cell
//            }
//        }
//    }
//
//
//    func reloadData(on _: [Section]) {
//        snapshot.appendSections(section)
//
//        for sections in section {
//            snapshot.appendItems(sections.items, toSection: sections)
//        }
//        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: false) }
//    }
//
//
//    // MARK: - Collection View Compositional Layout -
//    /// Creates the appropriate UICollectionViewLayout for each section type
//    private func createCompositionalLayout() -> UICollectionViewLayout {
//        // Constructs the UICollectionViewCompositionalLayout
//        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnv) -> NSCollectionLayoutSection? in
//            let section = self.section[sectionIndex]
//            switch section.type {
//            case "single":
//                return self.createSingleSection(using: section)
//            default:
//                return self.createMultipleSection(using: section)
//            }
//
////            let deco = NSCollectionLayoutDecorationItem.background(elementKind: "background")
////                    deco.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
////            if section.type == "multiple" { // only add the decoration for section 0
////                section = [deco]
////                    }
//        }
//
//        // Configure the Layout with interSectionSpacing
//        let config = UICollectionViewCompositionalLayoutConfiguration()
//        config.interSectionSpacing = CGFloat(UIDevice.getFloatValue(iphone: 30, ipad: 40))
//        layout.configuration = config
//        return layout
//    }
//
//
//    /// Creates the layout for the Featured styled sections
//    private func createSingleSection(using section: Section) -> NSCollectionLayoutSection {
//        // Defining the size of a single item in this layout
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                              heightDimension: .fractionalHeight(1.0))
//        // Construct the Layout Item
//        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        // Configuring the Layout Item
//        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
//                                                           leading: CGFloat(UIDevice.getFloatValue(iphone: 10.0, ipad: 15.0)),
//                                                           bottom: 0,
//                                                           trailing: CGFloat(UIDevice.getFloatValue(iphone: 10.0, ipad: 15.0)))
//
//        // Defining the size of a group in this layout
//        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                     heightDimension: .estimated(CGFloat(UIDevice.getFloatValue(iphone: 450, ipad: 550))))
//        // Constructing the Layout Group
//        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize,
//                                                             subitem: layoutItem, count: 1)
//
//        // Constructing the Layout Section
//        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
//        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 30,
//                                                              leading: CGFloat(UIDevice.getFloatValue(iphone: 10, ipad: 15)),
//                                                              bottom: 5,
//                                                              trailing: CGFloat(UIDevice.getFloatValue(iphone: 10, ipad: 15)))
//
//        // Constructing the Section Header
////        let layoutSectionHeader = createSectionHeader()
////
////        // Adding the Section Header to the Section Layout
////        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
//
//        return layoutSection
//    }
//
//
//    private func createMultipleSection(using section: Section) -> NSCollectionLayoutSection {
//        // Defining the size of a single item in this layout
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                              heightDimension: .fractionalHeight(0.33))
//        // Construct the Layout Item
//        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        // Configuring the Layout Item
//        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
//                                                           leading: CGFloat(UIDevice.getFloatValue(iphone: 5, ipad: 15)),
//                                                           bottom: 10,
//                                                           trailing: CGFloat(UIDevice.getFloatValue(iphone: 5, ipad: 15)))
//
//        // Defining the size of a group in this layout
//        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                     heightDimension: .fractionalWidth(0.55))
//        // Constructing the Layout Group
//        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize,
//                                                             subitems: [layoutItem])
//
//        // Constructing the Layout Section
//        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
////        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
////                                                              leading: 10,
////                                                              bottom: 0,
////                                                              trailing: 10)
//
//        // Constructing the Section Header
////        let layoutSectionHeader = createSectionHeader()
////
////        // Adding the Section Header to the Section Layout
////        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
//
//        return layoutSection
//    }
//
//
//    /// Creates a Layout for the SectionHeader
//    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
//        // Define size of Section Header
//        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                             heightDimension: .absolute(80))
//
//        // Construct Section Header Layout
//        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize,
//                                                                              elementKind: UICollectionView.elementKindSectionHeader,
//                                                                              alignment: .top)
//        //        layoutSectionHeader.pinToVisibleBounds = true
//
//        layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
//
//        return layoutSectionHeader
//    }
    
    
    var appFullscreenController: QuizFullscreenController!
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let appFullscreenController = QuizFullscreenController()
        appFullscreenController.takeQuizSection = sections[indexPath.item]
        appFullscreenController.dismissHandler = {
            self.handleRemoveRedView()
        }
        let fullscreenView = appFullscreenController.view!
//        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView)))
        view.addSubview(fullscreenView)
        
        addChild(appFullscreenController)
        
        self.appFullscreenController = appFullscreenController
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        print(cell.frame)
        
        cell.layoutSubviews()
        // Absolute coordinates of cell
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        
        self.startingFrame = startingFrame
        
        // auto layout constraint animations
        fullscreenView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = fullscreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = fullscreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = fullscreenView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = fullscreenView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        
        self.view.layoutIfNeeded() //starts the animation
        
        fullscreenView.layer.cornerRadius = 16
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut,
                       animations: {
                        
                        self.topConstraint?.constant = 0
                        self.leadingConstraint?.constant = 0
                        self.widthConstraint?.constant = self.view.frame.width
                        self.heightConstraint?.constant = self.view.frame.height
                        
                        self.view.layoutIfNeeded() //starts the animation
                        
                        guard let cell = self.appFullscreenController.tableView.cellForRow(at: [0, 0]) as? QuizFullscreenHeaderCell else { return }
                        
                        cell.takeQuizSingleAppCell.nameTopConstraint.constant = 48
                        cell.takeQuizSingleAppCell.imageViewBottomConstraint.constant = 0
                        cell.layoutIfNeeded()
                        
//                        self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
                        self.navigationController?.isNavigationBarHidden = true
                       },
                       completion:  nil)
        
//        switch indexPath.section {
//            case 0:
//            print("1")
//            case 1:
//            print("2")
//            case 2:
//            print("3")
//            default:
//            print("4")
//        }
    }
    
    var startingFrame: CGRect?
    
    static let cellSize: CGFloat = 500
    
    @objc func handleRemoveRedView() {
        // Access Starting Frame
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.7,
                       options: .curveEaseOut,
                       
                       animations: {
//                        gesture.view?.frame = self.startingFrame ?? .zero
                        
                        self.appFullscreenController.tableView.contentOffset = .zero
                        
                        guard let startingFrame = self.startingFrame else {return}
                        self.topConstraint?.constant = startingFrame.origin.y
                        self.leadingConstraint?.constant = startingFrame.origin.x
                        self.widthConstraint?.constant = startingFrame.width
                        self.heightConstraint?.constant = startingFrame.height
                        
                        self.view.layoutIfNeeded() //starts the animation
                        
                        self.navigationController?.isNavigationBarHidden = false
                        
                        
                        
                        guard let cell = self.appFullscreenController.tableView.cellForRow(at: [0, 0]) as? QuizFullscreenHeaderCell else { return }
            //            cell.closeButton.alpha = 0
                        self.appFullscreenController.closeButton.alpha = 0
                        cell.takeQuizSingleAppCell.nameTopConstraint.constant = 24
                        cell.takeQuizSingleAppCell.imageViewBottomConstraint.constant = -50
                        cell.layoutIfNeeded()
                        
//                        if let tabBarFrame = self.tabBarController?.tabBar.frame {
//                            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height - tabBarFrame.height
//                        }
//                        self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
                        
                       }, completion: { _ in
                        self.appFullscreenController.view.removeFromSuperview()
                        self.appFullscreenController.removeFromParent()
                        self.collectionView.isUserInteractionEnabled = true
                       })
        
    }
    
}
