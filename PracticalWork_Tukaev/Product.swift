//
//  Product.swift
//  PracticalWork_Tukaev
//
//  Created by surexnx on 10.10.2023.
//

import Foundation
import UIKit

struct Product: Hashable, Identifiable{
    let id: UUID
    let name: String
    let price: String
    let image: UIImage?
    let button: UIButton
    
}
