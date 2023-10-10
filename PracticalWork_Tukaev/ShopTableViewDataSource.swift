//
//  ShopTableViewDataSource.swift
//  PracticalWork_Tukaev
//
//  Created by surexnx on 10.10.2023.
//

import Foundation
import UIKit

class ShopTableViewDataSource: NSObject, UITableViewDataSource{
    
    var product:[Product] = []
    var dataSource: UITableViewDiffableDataSource<Int, Product>
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, product in
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseIdentifier, for: indexPath) as! ProductTableViewCell
            cell.configureCell(with: product)
            return cell
        }
  }
    
}
