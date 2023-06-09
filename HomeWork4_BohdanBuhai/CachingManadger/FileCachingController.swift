//
//  FileCachingController.swift
//  HomeWork4_BohdanBuhai
//
//  Created by Bohdan on 6/3/23.
//

import UIKit

final class FileCachingController: DataCaching {
    
    let fileManadger = FileManager.default
    let fileName = "FileName"
    lazy var fileUrl: URL = {
        let path = try? FileManager.default.url(for: .cachesDirectory , in: .userDomainMask, appropriateFor: nil, create: true)
        let fileUrl = path?.appendingPathComponent(fileName)
        return fileUrl!
    }()
    
    func seva(movies: [Result]) {
        guard let data = try? JSONEncoder().encode(movies) else {return}
        try? data.write(to: fileUrl)
    }
    
    func loadData() async throws -> [Result] {
        guard
            let data = try?Data(contentsOf: fileUrl),
            let movies = try?JSONDecoder().decode([Result].self, from: data)
        else {return []}
        
        return movies
    }
    
    
}
