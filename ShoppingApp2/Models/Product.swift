//
//  Product.swift
//  ShoppingApp2
//
//  Created by Manish Meher Edida on 13/10/20.
//  Copyright © 2020 Manish Meher Edida. All rights reserved.
//

import Foundation

struct Product: Codable{
    var productId:Int?
    var productLabel:String?
    var productImageUrl:String?
    var productCount:Int?
    
    enum CodingKeys:String, CodingKey{
        case productId = "id"
        case productLabel = "title"
        case productImageUrl = "imageUrl"
        case productCount = "totalItems"
    }
}
