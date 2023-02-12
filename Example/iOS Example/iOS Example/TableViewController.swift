//
//  TalbeViewController.swift
//  iOS Example
//
//  Created by Paris on 2023/2/12.
//

import UIKit
import SnapKit
import CheapCell

final class TableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add collection view
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
    
    // MARK: - Data
    let articles = ArticleModel.list()

    // MARK: - Lazy Property
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.registerCheapCell(ArticleView.self)
        return tableView
    }()

}

// MARK: - UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCheapCell(for: indexPath) as TableCell<ArticleView>
        let model = articles[indexPath.row]
        cell.itemView.coverView.imageView.image = UIImage(named: model.cover)
        cell.itemView.infoView.titleLabel.text = model.title
        cell.itemView.infoView.authorLabel.text = model.author
        return cell
    }
}
