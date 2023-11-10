//
//  HeaderCollectionReusableView.swift
//  UICollectionViewHw5
//
//  Created by Andria Inasaridze on 03.11.23.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Class Properties
    static let identifier = "HeaderCollectionReusableView"
    
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Top Rated Movies"
        label.font = .boldSystemFont(ofSize: 26)
        label.textColor = .white
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = bounds
    }
}
