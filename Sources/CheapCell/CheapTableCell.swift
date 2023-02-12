//
//  CheapTableCell.swift
//  
//
//  Created by Paris on 2023/2/8.
//

import Foundation
import UIKit

public extension UITableView {
    func registerCheapCell<T: CheapCell>(_ : T.Type) {
        register(TableCell<T>.self, forCellReuseIdentifier: TableCell<T>.identifier)
    }

    func dequeueReusableCheapCell<T: CheapCell>(for indexPath: IndexPath) -> TableCell<T> {
        dequeueReusableCell(withIdentifier: TableCell<T>.identifier, for: indexPath) as! TableCell<T>
    }
}


public final class TableCell<T: CheapCell>: UITableViewCell {
    public static var identifier: String {
        return T.identifier
    }

    public let itemView = T()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
