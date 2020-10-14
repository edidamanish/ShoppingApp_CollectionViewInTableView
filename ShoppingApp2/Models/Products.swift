//
//  Products.swift
//  ShoppingApp2
//
//  Created by Manish Meher Edida on 13/10/20.
//  Copyright © 2020 Manish Meher Edida. All rights reserved.
//

import Foundation

struct Products: Codable{
    var products:[Product]?
    
    enum CodingKeys: String, CodingKey{
        case products = "items"
    }
}
