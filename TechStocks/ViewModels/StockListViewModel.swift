//
//  StockListViewModel.swift
//  TechStocks
//
//  Created by Kaushal Desai on 2022-07-28.
//

import Foundation

class StockListViewModel {
    
    private(set) var stocks: [StockViewModel] = []
    
    func populateStocks(url: URL) async {
        
        do {
            let stocks = try await Webservice().getStocks(url: url)
            self.stocks = stocks.map(StockViewModel.init)
            
        } catch {
            print(error)
        }
    }
}


struct StockViewModel {
    private let stock: Stocks
    
    init(stock: Stocks) {
        self.stock = stock
    }
    
    var symbol: String {
        stock.symbol
    }
    
    var description: String {
        stock.description
    }
    
    var price: Double {
        stock.price
    }
    
    var change: String {
        stock.change
    }
}
