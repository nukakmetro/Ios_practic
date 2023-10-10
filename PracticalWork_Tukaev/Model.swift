//
//  Model.swift
//  PracticalWork_Tukaev
//
//  Created by surexnx on 10.10.2023.
//

import Foundation
import UIKit

class ShopTableViewDataSource{
    
    var product:[Product] = []
    var dataSource: UITableViewDiffableDataSource<Int, Product>
}
