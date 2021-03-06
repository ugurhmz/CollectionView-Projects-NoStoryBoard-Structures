//
//  HeaderReusableView.swift
//  04-CollectionViews
//
//  Created by ugur-pc on 8.04.2022.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
        static var identifier = "HeaderReusableView"
    
    
    
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.text = "ABC"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
        override init(frame: CGRect) {
            super.init(frame: frame)
           
            addSubview(titleLabel)
            
            setConstraints()
        }

        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
            
        }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
        ])
    }
    
}
