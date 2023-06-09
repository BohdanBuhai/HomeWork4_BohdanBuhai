//
//  DataFlowController.swift
//  HomeWork4_BohdanBuhai
//
//  Created by Bohdan on 6/2/23.
//

import Foundation

protocol DataFetching {
    func loadData() async throws -> [Result]
}

final class DataFlowManager: DataFetching {
    let networkManager: DataFetching = NetworkManadger()
    let cachihgManadger: DataCaching = FileCachingController()
    
    func loadData() async throws -> [Result] {
        
        let cashedMovie = try await cachihgManadger.loadData()
        if cashedMovie.count > 0 {
            return cashedMovie
        }
        
        let movies = try await networkManager.loadData()
        cachihgManadger.seva(movies: movies)
        
        return movies
    }
}
