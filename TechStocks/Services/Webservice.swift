//
//  Webservice.swift
//  TechStocks
//
//  Created by Kaushal Desai on 2022-07-28.
//

import Foundation

enum StocksError: Error {
    case invalidServerResponse
}

class Webservice {
    func getStocks(url: URL) async throws -> [Stocks] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw StocksError.invalidServerResponse
        }
        
        return try JSONDecoder().decode([Stocks].self, from: data)
        
    }
}
