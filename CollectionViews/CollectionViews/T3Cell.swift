//
//  T3Cell.swift
//  CollectionViews
//
//  Created by RG on 6/17/21.
//

import UIKit

class T3Cell: UICollectionViewCell {
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func setupCell(with status:Int) {
        
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        contentView.addSubview(myImageView)
        
        myImageView.frame = CGRect(x: 10, y: 10, width: 80, height: 80)
        
        let name = status == 0 ? "circle" : status == 1 ? "multiply" : ""
        
        myImageView.image = UIImage(systemName: name)
    }
    
}
