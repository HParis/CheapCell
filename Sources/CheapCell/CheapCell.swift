//
//  CheapCell.swift
//
//
//  Created by Paris on 2023/2/6.
//

import Foundation
import UIKit

public protocol CheapCell: UIView {
    static var identifier: String { get }
}

public extension CheapCell {
    static var identifier: String {
        return "\(Self.self)"
    }
}
