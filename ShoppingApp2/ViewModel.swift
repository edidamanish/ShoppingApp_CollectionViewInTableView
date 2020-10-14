//
//  ViewModel.swift
//  ShoppingApp2
//
//  Created by Manish Meher Edida on 13/10/20.
//  Copyright © 2020 Manish Meher Edida. All rights reserved.
//

import Foundation

class ViewModel{
    private(set) var categories = [Category]()
    private(set) var allProducts = Products()
    
    private var networkManager:URLSession
    
    init(networkManager:URLSession) {
        categories = [Category(categoryName: "Fresh"), Category.init(categoryName: "Cooking Delight"),
                      Category(categoryName: "Milk"), Category(categoryName: "Dairy Goodness")]
        self.networkManager = networkManager
        
    }
    
    func downloadJson(url:String, completion:@escaping ((Bool)->())) throws {
        guard let url = URL(string: url) else{
            throw NSError(domain: "URL failed to load", code: 101, userInfo: nil)
        }
        
        let session = networkManager
        let task = session.dataTask(with: url) { [weak self] (data, response, error) in
            if let data = data , error == nil{
                let decoder = JSONDecoder()
                do{
                    self?.allProducts = try decoder.decode(Products.self, from: data)
                    DispatchQueue.main.async {
                        completion(true)
                    }
                }
                catch{
                    
                    completion(false)
                }
            }
            else{
                
                completion(false)
            }
        }
        task.resume()
        
        
    }
    
    
    func getTableCellLabel(indexPath:IndexPath)->Category?{
        
        guard categories.indices.contains(indexPath.row) else{
            return nil
        }
        
        return categories[indexPath.row]
        
      
        
    }
    
    func getCollectionViewCellData(indexPath:IndexPath)->Product?{
        guard let products = allProducts.products else{
            return nil
        }
        guard products.indices.contains(indexPath.row) else{
            return nil
        }
        
        return products[indexPath.row]
    }
    
}


