//
//  AppFullScreenController.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 1/11/21.
//

import UIKit

class QuizFullscreenController: UIViewController, UITableViewDataSource, UITableViewDelegate {
/*
    private var collectionView: UICollectionView!
    private var section = [ItemDetails]()
    private var dataSource: UICollectionViewDiffableDataSource<ItemDetails, ItemsImages>!
    private var snapshot = NSDiffableDataSourceSnapshot<ItemDetails, ItemsImages>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        view.isOpaque = false
        
        setupCollectionView()
        getData()
        createDataSource()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    

    
    // MARK: - Setting up Collection View -
    
    private func setupCollectionView() {
        // Initialises the collection view with a CollectionViewLayout which we will define
        collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Assigning data source and background color
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.isUserInteractionEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Registering all Cells and Classes we will need
        collectionView.register(FoodAndDrinkCell.self, forCellWithReuseIdentifier: FoodAndDrinkCell.identifier)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                                    withReuseIdentifier:        SectionHeader.identifier)
    }
    
    
   func getData() {
                NetworkManager.shared.getQuizDetailsData { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let sections):
                    DispatchQueue.main.async {
                        self.section.append(contentsOf: sections)
                        self.reloadData(on: self.section)
                        print("SUCCESS")
                    }
                case .failure(let error):
                    print(error.rawValue)
                    print("FAILED")
                }
            }
    }
    

    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<ItemDetails, ItemsImages>(collectionView: collectionView) { collectionView, indexPath, item in
            switch self.section[indexPath.section].type {
            case "foodAndDrink":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodAndDrinkCell.identifier, for: indexPath) as? FoodAndDrinkCell
                cell?.foodAndDrink = item
                print("Load Section 1")
                return cell
            default:
                return nil
            }
        }

        dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as? SectionHeader else {
                return nil
            }

            guard let firstItem = self?.dataSource.itemIdentifier(for: indexPath) else { return nil }
            guard let section = self?.dataSource.snapshot().sectionIdentifier(containingItem: firstItem) else { return nil }
            if section.title.isEmpty { return nil }

            sectionHeader.titleLabel.text = section.title
//            sectionHeader.subtitleLabel.text = section.subtitle
            return sectionHeader
        }
    }
    

    func reloadData(on _: [ItemDetails]) {
        snapshot.appendSections(section)

        for sections in section {
            snapshot.appendItems(sections.itemsimages, toSection: sections)
        }
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true) }
    }
    
    
    // MARK: - Collection View Compositional Layout -
    /// Creates the appropriate UICollectionViewLayout for each section type
    private func createCompositionalLayout() -> UICollectionViewLayout {
        // Constructs the UICollectionViewCompositionalLayout
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnv) -> NSCollectionLayoutSection? in
            let section = self.section[sectionIndex]

            switch section.type {
            case "foodAndDrink":
                return self.createArtAndDesignSection(using: section)
            default:
                return nil
            }
        }
        
        // Configure the Layout with interSectionSpacing
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = CGFloat(UIDevice.getFloatValue(iphone: 50, ipad: 70))
        layout.configuration = config
        
        return layout
    }
    
    
    /// Creates the layout for the Featured styled sections
    private func createArtAndDesignSection(using section: ItemDetails) -> NSCollectionLayoutSection {
        // Defining the size of a single item in this layout
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        // Construct the Layout Item
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Configuring the Layout Item
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 40,
                                                           leading: CGFloat(UIDevice.getFloatValue(iphone: 10.0, ipad: 15.0)),
                                                           bottom: 40,
                                                           trailing: CGFloat(UIDevice.getFloatValue(iphone: 10.0, ipad: 15.0)))
        
        // Defining the size of a group in this layout
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(CGFloat(UIDevice.getFloatValue(iphone: 110, ipad: 550))),
                                                     heightDimension: .absolute(CGFloat(UIDevice.getFloatValue(iphone: 110, ipad: 550))))
        // Constructing the Layout Group
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize,
                                                             subitem: layoutItem, count: 1)
        
        // Constructing the Layout Section
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 20,
                                                              leading: CGFloat(UIDevice.getFloatValue(iphone: 10, ipad: 15)),
                                                              bottom: 0,
                                                              trailing: CGFloat(UIDevice.getFloatValue(iphone: 10, ipad: 15)))
        
        return layoutSection
    }
    */
    
    var dismissHandler: (() -> ())?
    var takeQuizSection: Section?
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.clipsToBounds = true
        
        view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.dataSource = self
        tableView.delegate = self
        
        setupCloseButton()
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.backgroundColor = UIColor.systemGray6
        tableView.contentInsetAdjustmentBehavior = .never
        let height = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        tableView.contentInset = .init(top: 0, left: 0, bottom: height, right: 0)
        
    }
    
    
    @objc fileprivate func handleDismiss(button: UIButton) {
        button.isHidden = true
        dismissHandler?()
    }
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(SFSymbols.closeButton, for: .normal)
        return button
    }()
    
    fileprivate func setupCloseButton() {
        view.addSubview(closeButton)
        closeButton.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 0, bottom: 0, right: 20))
        closeButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let headerCell = QuizFullscreenHeaderCell()
            headerCell.takeQuizSingleAppCell.takeQuizItems = takeQuizSection?.items[indexPath.item]
            headerCell.takeQuizSingleAppCell.layer.cornerRadius = 0
            headerCell.clipsToBounds = true
            return headerCell
        }
        
        let cell = QuizFullscreenDescriptionCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return TakeQuizVC.cellSize
        }
        return UITableView.automaticDimension
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = ArtAndDesignCell()
//        return header
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 450
//    }
//
}

