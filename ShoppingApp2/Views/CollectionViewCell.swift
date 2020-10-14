//
//  CollectionViewCell.swift
//  ShoppingApp2
//
//  Created by Manish Meher Edida on 13/10/20.
//  Copyright © 2020 Manish Meher Edida. All rights reserved.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var productImage: UIImageView!
    @IBOutlet weak private var productLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    
        
    }
    
    func feedData(product:Product?)-> CollectionViewCell{
        if let label = product?.productLabel {
            print("Label found \(label)")
            productLabel.text = label
        }
        
        if let urlString = product?.productImageUrl{
            if let url = URL(string: urlString){
                print("Got Url")
                loadImage(imageUrl: url)
            }
        }
        return self
    }
    
    
    private func loadImage(imageUrl:URL){
        let session = URLSession.shared
        let task = session.dataTask(with: imageUrl) { [weak self] (data, response, error) in
            if let data = data{
                DispatchQueue.main.async {
                    print("URL hit success")
                    self?.productImage.image = UIImage(data: data)
                }
            }
        }
        task.resume()
    }
    

}
