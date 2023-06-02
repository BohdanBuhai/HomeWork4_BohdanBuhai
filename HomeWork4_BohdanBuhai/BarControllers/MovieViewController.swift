//
//  MovieViewController.swift
//  HomeWork4_BohdanBuhai
//
//  Created by Bohdan on 5/23/23.
//

import UIKit


final class MovieViewController: UIViewController {
    
    let networkManadger = NetworkManadger()
    let cachingContoller = UserDefaultsController()
    
    @IBOutlet weak var tableView: UITableView!
    public var arreyR = [Result]()
    var countMovies = Int()
    let session = URLSession(configuration: .default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
       loadData()
        
    }
    
    private func loadData() {
        Task.init{
            let cashedMovie = cachingContoller.load()
            if  cashedMovie.count > 0 {
                arreyR = cashedMovie
                tableView.reloadData()
            }
            
            arreyR = try await networkManadger.loadData()
            cachingContoller.seva(movies: arreyR)
            tableView.reloadData()
        }
    }
    
    func creatUrl(api: String) -> URL {
        guard let apiUrl = URL(string: api) else {return URL(string: "")!}
        return apiUrl
    }
}
