//
//  ArticleView.swift
//  iOS Example
//
//  Created by Paris on 2023/2/12.
//

import UIKit
import SnapKit
import CheapCell

final class ArticleView: UIView, CheapCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(coverView)
        addSubview(infoView)
        
        coverView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.bottom.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(12)
        }
        infoView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(coverView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
    }
    
    // MARK: - Lazy View
    private(set) lazy var coverView = ArticleCoverView()
    
    private(set) lazy var infoView = ArticleInfoView()
}
