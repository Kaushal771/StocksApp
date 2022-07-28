//
//  StocksListViewController.swift
//  TechStocks
//
//  Created by Kaushal Desai on 2022-07-28.
//

import UIKit

class StocksListViewController: UITableViewController {
    
    private let viewModel = StockListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            await populateStocks()
        }

       
    }
    
    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Stocks"
        
    }
    
    private func populateStocks() async {
        await viewModel.populateStocks(url: Constants.URLs.allStocks)
        print(viewModel.stocks)
    }

}
