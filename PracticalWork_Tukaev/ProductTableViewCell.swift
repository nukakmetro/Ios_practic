//
//  ProductTableViewCell.swift
//  PracticalWork_Tukaev
//
//  Created by surexnx on 10.10.2023.
//
protocol ProductCellDelegate: AnyObject {
    func didPressDetailDisclosure()
}

import UIKit
protocol DetailControllerDelegate: AnyObject {
    func dataUpdated(for product: Product)
}

class ProductTableViewCell: UITableViewCell {

    private let productImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let name: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let price: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "add"
        config.baseForegroundColor = .blue
        
        return UIButton(
            configuration: config,
            primaryAction: UIAction { [weak self] _ in
                self?.buttonAction?()
            })
    }()

    var buttonAction: (() -> Void)?
        

    
    func configureCell(with product: Product){
        productImage.image = product.image
        button = product.button
        name.text = product.name
        price.text = product.price
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
            
            productImage.image = nil
        }
    

}

extension ProductTableViewCell{
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach{contentView.addSubview($0)}
    }
    
    private func setupLayout(){
        
        guard productImage.superview == nil else { return }
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let textStackView = UIStackView(arrangedSubviews: [name, price])
        textStackView.axis = .vertical
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(productImage, textStackView, button)
        
        NSLayoutConstraint.activate([
            
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productImage.heightAnchor.constraint(equalToConstant: 50),
            productImage.widthAnchor.constraint(equalToConstant: 50),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            textStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textStackView.leadingAnchor.constraint(equalTo: productImage.leadingAnchor, constant: 10),
            
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            button.leadingAnchor.constraint(equalTo: textStackView.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)


        ])
    }
    
    static var reuseIdentifier: String {
           return String(describing: self)
       }
}
