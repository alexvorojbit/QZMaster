////
////  TvCell.swift
////  QZ Master
////
////  Created by Alexandru Vorojbit on 12/21/20.
////
//
//import UIKit
//
//class TvCell: UICollectionViewCell {
//
//    var tv: SectionItems? {
//        didSet {
//            name.text = tv?.name
//            tvImage.loadImageUsingCacheWithUrlString(urlString: tv?.image ?? "")
//        }
//    }
//    
//    // UI components
//    lazy var tvImage: UIImageView = {
//        let img = UIImageView()
//        img.layer.cornerRadius = 16
//        img.clipsToBounds = true
//        img.contentMode = .scaleAspectFill
//        img.translatesAutoresizingMaskIntoConstraints = false
//        return img
//    }()
//    
//    lazy var name: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: CGFloat(UIDevice.getFloatValue(iphone: 12, ipad: 15)), weight: .medium)
//        label.textColor = Colors.black
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    
//    // Initialiser
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        setupViews()
//    }
//    
//    
//    /// Sets up the UI components for this cell and adds them to the contentview
//    private func setupViews() {
//        addSubview(tvImage)
//        addSubview(name)
//
//        NSLayoutConstraint.activate([
//            tvImage.topAnchor.constraint(equalTo: contentView.topAnchor),
//            tvImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            tvImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            tvImage.heightAnchor.constraint(equalTo: tvImage.widthAnchor),
//
//            name.topAnchor.constraint(equalTo: tvImage.bottomAnchor, constant: 10),
//            name.centerXAnchor.constraint(equalTo: tvImage.centerXAnchor),
//            name.heightAnchor.constraint(equalToConstant: 18)
//        ])
//    }
//    
//    
//    func configure(with item: SectionItems) {
//        tvImage.image = UIImage(named: item.image ?? "")
//        name.text = item.name
//    }
//    
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    
//    override var isHighlighted: Bool {
//        
//        didSet {
//            var transform = CGAffineTransform.identity
//            if isHighlighted {
//               transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
//            }
//            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.4, options: .curveEaseOut, animations: {
//                self.transform = transform
//            })
//        }
//    }
//
//
//}
