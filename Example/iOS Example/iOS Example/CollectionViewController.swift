//
//  CollectionViewController.swift
//  iOS Example
//
//  Created by Paris on 2023/2/12.
//

import UIKit
import SnapKit
import CheapCell

final class CollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add collection view
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
        
        // Add data source
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([.cover, .article])
        snapshot.appendItems(ArticleModel.list(), toSection: .cover)
        snapshot.appendItems(ArticleModel.list(), toSection: .article)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    // MARK: - Lazy Property
    private(set) lazy var dataSource: UICollectionViewDiffableDataSource<Section, ArticleModel> = {
        let dataSource = UICollectionViewDiffableDataSource<Section, ArticleModel>(
            collectionView: collectionView
        ) { [weak self] collectionView, indexPath, itemIdentifier in
            guard let self else { return nil }
            let section = indexPath.section
            guard self.dataSource.snapshot().sectionIdentifiers.count > section else {
                return nil
            }
            let sectionIdentifier = self.dataSource.snapshot().sectionIdentifiers[section]
            switch sectionIdentifier {
            case .cover:
                let cell = collectionView.dequeueReusableCheapCell(for: indexPath) as CollectionCell<ArticleCoverView>
                cell.itemView.imageView.image = UIImage(named: itemIdentifier.cover)
                return cell
            case .article:
                let cell = collectionView.dequeueReusableCheapCell(for: indexPath) as CollectionCell<ArticleView>
                cell.itemView.coverView.imageView.image = UIImage(named: itemIdentifier.cover)
                cell.itemView.infoView.titleLabel.text = itemIdentifier.title
                cell.itemView.infoView.authorLabel.text = itemIdentifier.author
                return cell
            }
        }
        return dataSource
    }()

    private(set) lazy var layout = UICollectionViewCompositionalLayout { [weak self] section, layoutEnvironment -> NSCollectionLayoutSection? in
        guard let self else { return nil }
        guard self.dataSource.snapshot().sectionIdentifiers.count > section else {
            return nil
        }
        let sectionIdentifier = self.dataSource.snapshot().sectionIdentifiers[section]
        switch sectionIdentifier {
        case .cover:
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(100)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.6),
                heightDimension: .estimated(100)
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 12
            section.contentInsets = .init(top: 12, leading: 12, bottom: 12, trailing: 12)
            section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
            return section
        case .article:
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(100)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(100)
            )
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }

    private(set) lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.registerCheapCell(ArticleCoverView.self)
        collectionView.registerCheapCell(ArticleView.self)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    enum Section {
        case cover
        case article
    }
}
