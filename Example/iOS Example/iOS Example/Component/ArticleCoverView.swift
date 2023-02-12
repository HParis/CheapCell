//
//  ArticleCoverView.swift
//  iOS Example
//
//  Created by Paris on 2023/2/12.
//

import UIKit
import SnapKit
import CheapCell

final class ArticleCoverView: UIView, CheapCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
            make.width.equalTo(imageView.snp.height).multipliedBy(2)
        }
    }
    
    // MARK: - Lazy View
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
}
