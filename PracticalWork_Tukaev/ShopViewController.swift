//
//  ViewController.swift
//  PracticalWork_Tukaev
//
//  Created by surexnx on 10.10.2023.
//

import UIKit

class ShopViewController: UIViewController, BasketControllerDelegate, UITableViewDelegate {
    func dataUpdated(for product: Product) {
        
    }
    
    
    enum TableSection {
        case main
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.separatorStyle = .none
        table.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.reuseIdentifier)
        table.estimatedRowHeight = 120
        return table
    }()
//    override func loadView() {
//        view = view1
//    } 
    var products: [Product] = []
    var dataSource: UITableViewDiffableDataSource<TableSection , Product>?
    
    private func setupNavigationBar(){
        
        let refreshAction = UIAction { _ in
            
            guard var snapshot = self.dataSource?.snapshot() else { return }
            
            
            
        }
        navigationItem.title = "Shop"
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .organize, primaryAction: refreshAction, menu: nil)
    }
    
    
    private func setupDataSource(){
        
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, product in
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseIdentifier, for: indexPath) as! ProductTableViewCell
            cell.configureCell(with: product)
            return cell
        })
        updateDataSource(with: products, animate: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        products.append(Product(id: UUID(), name: "name", price: "200 usdt", image: UIImage(systemName: "cart"), button: UIButton.init()))
        setupLayout()
        setupNavigationBar()
        setupDataSource()
        

    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),])
    }
    
    func updateDataSource(with product: [Product], animate: Bool) {
        var snapshot = NSDiffableDataSourceSnapshot<TableSection, Product>()
        snapshot.appendSections([.main])
        snapshot.appendItems(product)
        dataSource?.apply(snapshot, animatingDifferences: animate)
    }


}


extension ShopViewController: UITableViewDataSource{
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return products.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
            cell.buttonAction = {
                
                guard var snapshot = self.dataSource?.snapshot() else { return }
                
                if let product = self.dataSource?.itemIdentifier(for: indexPath) {
                    let basketController = BasketViewController(with: product, delegate: self)
                    self.navigationController?.pushViewController(basketController, animated: true)
                }
            }
            return cell
        }
    }

