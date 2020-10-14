//
//  ViewController.swift
//  ShoppingApp2
//
//  Created by Manish Meher Edida on 13/10/20.
//  Copyright © 2020 Manish Meher Edida. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModel(networkManager: URLSession.shared)
    
    class func initViewController()->ViewController{
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 240
        //tableView.rowHeight = 250
        
        
        
        
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else{
            return UITableViewCell()
        }
   
        
        
        let cellData = viewModel.getTableCellLabel(indexPath: indexPath)
        return cell.feedLabel(category: cellData)
    }
    
    
}

