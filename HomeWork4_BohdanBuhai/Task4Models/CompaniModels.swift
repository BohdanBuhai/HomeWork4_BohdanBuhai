//
//  Models.swift
//  HomeWork4_BohdanBuhai
//
//  Created by Bohdan on 5/22/23.
//

import Foundation
// MARK: Task 1

struct Compani: Codable {
    let count: Int
    let companyDescription: String
    let listOfData: [Device]
}

struct Device: Codable {
    let name: String
    let modelNumbers: String
    let countris: [String]
    let price: PriceInfo
    let year: Int
}

struct PriceInfo: Codable {
    let regions: [RegionPrice]
}

struct RegionPrice: Codable {
    let name: String
    let price: Int
}
