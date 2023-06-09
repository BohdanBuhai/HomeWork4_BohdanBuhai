//
//  File.swift
//  HomeWork4_BohdanBuhai
//
//  Created by Bohdan on 6/2/23.
//

import Foundation

protocol DataCaching: DataFetching  {
    func seva(movies: [Result])
}

final class UserDefaultsManadger: DataCaching {
   
    let defaults = UserDefaults.standard
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let key = "TrendingMovies"
    
    func seva(movies: [Result]) {
       let data = try? encoder.encode(movies)
        defaults.set(data, forKey: key)
    }
    
    func loadData() async throws -> [Result] {
        guard let data = defaults.data(forKey: key),
              let movie = try?  decoder.decode([Result].self, from: data)
        else {
            return []
        }
                return movie
    }
}
