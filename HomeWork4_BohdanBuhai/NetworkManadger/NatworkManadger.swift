//
//  NatworkManadger.swift
//  HomeWork4_BohdanBuhai
//
//  Created by Bohdan on 6/2/23.
//

import Foundation

final class NetworkManadger {
    
    let apiUrl = URL(string: "https://api.themoviedb.org/3/trending/movie/week?api_key=97f9be71d695b2b55155b49b40b9c53a")
    let session = URLSession.shared
    
    func loadData() async throws -> [Result] {
        
        let sessionResponse = try await session.data(from: apiUrl!)
        let resultResponse = try JSONDecoder().decode(TrendingMovies.self, from: sessionResponse.0)
        
        return resultResponse.results
    }
}

