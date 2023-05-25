//
//  GanresModel.swift
//  HomeWork4_BohdanBuhai
//
//  Created by Bohdan on 5/23/23.
//

import Foundation
// MARK: - Welcome
struct Genres: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
