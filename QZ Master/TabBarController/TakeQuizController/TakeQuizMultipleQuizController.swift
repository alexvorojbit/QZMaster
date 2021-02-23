//
//  TakeQuizMultipleAppController.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 1/26/21.
//

import UIKit

class TakeQuizMultipleQuizController: BaseListController {
    
//    private var collectionView: UICollectionView!
//    private var section = [Section]()
//    private var dataSource: UICollectionViewDiffableDataSource<Section, Quizes>!
//    private var snapshot = NSDiffableDataSourceSnapshot<Section, Quizes>()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.backgroundColor = .systemRed
//        view.isOpaque = false

//        setupCollectionView()
//        createDataSource()
//        reloadData(on: section)
//    }
//
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = false
//        navigationController?.navigationBar.prefersLargeTitles = false
//    }
//
//
//
//    // MARK: - Setting up Collection View -
//
//    private func setupCollectionView() {
//        // Initialises the collection view with a CollectionViewLayout which we will define
//        collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: createCompositionalLayout())
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        // Assigning data source and background color
//        collectionView.delegate = self
//        collectionView.backgroundColor = .systemGroupedBackground
//        collectionView.isUserInteractionEnabled = true
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.showsVerticalScrollIndicator = false
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
//
//        // Registering all Cells
//        collectionView.register(MultipleAppCell.self, forCellWithReuseIdentifier: MultipleAppCell.identifier)
//    }
//
//
//    private func createDataSource() {
//        dataSource = UICollectionViewDiffableDataSource<Section, Quizes>(collectionView: collectionView) { collectionView, indexPath, item in
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleAppCell.identifier, for: indexPath) as? MultipleAppCell
//                cell?.quizes = item
//                print("Load Section 1")
//                return cell
//        }
//    }
//
//
//    private func reloadData(on _: [Section]) {
//        snapshot.appendSections(section)
//
//        for sections in section {
//            snapshot.appendItems(sections.quizes, toSection: sections)
//        }
//        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true) }
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
//            case "multipleQuizCell":
//                return self.createMultipleSection(using: section)
//            default:
//                return nil
//            }
//        }
//
//        // Configure the Layout with interSectionSpacing
//        let config = UICollectionViewCompositionalLayoutConfiguration()
//        config.interSectionSpacing = CGFloat(UIDevice.getFloatValue(iphone: 30, ipad: 40))
//        layout.configuration = config
//
//        return layout
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
//                                                           bottom: 0,
//                                                           trailing: CGFloat(UIDevice.getFloatValue(iphone: 5, ipad: 15)))
//
//        // Defining the size of a group in this layout
//        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                     heightDimension: .fractionalHeight(0.5))
//        // Constructing the Layout Group
//        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize,
//                                                             subitems: [layoutItem])
//
//        // Constructing the Layout Section
//        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
//        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
//                                                              leading: 10,
//                                                              bottom: 0,
//                                                              trailing: 10)
//
//        // Constructing the Section Header
////        let layoutSectionHeader = createSectionHeader()
////
////        // Adding the Section Header to the Section Layout
////        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
//
//        return layoutSection
//    }
    
    enum Mode {
        case small, fullScreen
    }
    
    private let spacing: CGFloat = 16
    private let mode: Mode
    
    var quizes = [SectionItems]()
    
    // MARK: - UI
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(SFSymbols.closeButton, for: .normal)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    override var prefersStatusBarHidden: Bool { true }
    
    init(mode: Mode) {
        self.mode = mode
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if mode == .fullScreen {
            setupCloseButton()
        } else {
            collectionView.isScrollEnabled = false
        }
        collectionView.backgroundColor = .tertiarySystemBackground
        collectionView.register(MultipleQuizCell.self, forCellWithReuseIdentifier: MultipleQuizCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if mode == .fullScreen {
            return quizes.count
        }
        
        return min(4, quizes.count)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleQuizCell.identifier, for: indexPath) as! MultipleQuizCell
        cell.quizes = quizes[indexPath.item]
        return cell
    }
    
    private func setupCloseButton() {
        view.addSubview(closeButton)
        closeButton.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 16), size: .init(width: 38, height: 38))
    }
    
    @objc
    private func handleDismiss() {
        dismiss(animated: true)
    }
}

extension TakeQuizMultipleQuizController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewWidth = view.frame.width
        if mode == .fullScreen {
            return .init(width: viewWidth - 48, height: 74)
        }
        let height: CGFloat = (view.frame.height - 3 * spacing) / 4
        return .init(width: viewWidth, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if mode == .fullScreen {
            return .init(top: 16, left: 24, bottom: 16, right: 24)
        }
        return .zero
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let appID = quizes[indexPath.row].id
//        let quizDetailController = QuizDetailController(appID: appID)
//        navigationController?.pushViewController(quizDetailController, animated: true)
//    }
}
