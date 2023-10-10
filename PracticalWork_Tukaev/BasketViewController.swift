//
//  BasketViewController.swift
//  PracticalWork_Tukaev
//
//  Created by surexnx on 10.10.2023.
//

import UIKit
protocol BasketControllerDelegate: AnyObject {
    func dataUpdated(for product: Product)
}

class BasketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private weak var delegate: BasketControllerDelegate?
    private var currentProduct: Product!
    
    init(with product: Product, delegate: BasketControllerDelegate?) {
        super.init(nibName: nil, bundle: nil)
    
        self.currentProduct = product
        self.delegate = delegate
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
