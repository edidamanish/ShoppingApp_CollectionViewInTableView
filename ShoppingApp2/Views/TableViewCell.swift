//
//  TableViewCell.swift
//  ShoppingApp2
//
//  Created by Manish Meher Edida on 13/10/20.
//  Copyright © 2020 Manish Meher Edida. All rights reserved.
//

import UIKit

final class TableViewCell: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    @IBOutlet private weak var categoryLabel: UILabel!
    
    private var viewModel = ViewModel(networkManager: URLSession.shared)
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Load JSON Data
        
        do{
            try viewModel.downloadJson(url: ApiUrls.productsUrl, completion: { [weak self] (success) in
                if (success){
                    self?.collectionView.reloadData()
                }
                else{
                    print("Error in json decodeing")
                }
            })
        }
        catch(let error){
            print(error)
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
    
    func feedLabel(category:Category?)-> TableViewCell{
        if let label = category?.categoryName {
            print("Label found \(label)")
            categoryLabel.text = label
        }
   
        return self
    }
    
}


extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else{
            print("Error")
            return UICollectionViewCell()
        }
        
        let cellData = viewModel.getCollectionViewCellData(indexPath: indexPath)
        
        
        
        return cell.feedData(product: cellData)
    }
    
    
    
    
}

extension TableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 150)
    }
}
