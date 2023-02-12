//
//  CheapCollectionCell.swift
//  
//
//  Created by Paris on 2023/2/8.
//

import Foundation
import UIKit

public extension UICollectionView {
    func registerCheapCell<T: CheapCell>(_ : T.Type) {
        register(CollectionCell<T>.self, forCellWithReuseIdentifier: CollectionCell<T>.identifier)
    }

    func dequeueReusableCheapCell<T: CheapCell>(for indexPath: IndexPath) -> CollectionCell<T> {
        dequeueReusableCell(withReuseIdentifier: CollectionCell<T>.identifier, for: indexPath) as! CollectionCell<T>
    }
}


public final class CollectionCell<T: CheapCell>: UICollectionViewCell {
    public static var identifier: String {
        return T.identifier
    }

    public let itemView = T()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        contentView.addSubview(itemView)
        
        itemView.translatesAutoresizingMaskIntoConstraints = false
        itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        itemView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        itemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
