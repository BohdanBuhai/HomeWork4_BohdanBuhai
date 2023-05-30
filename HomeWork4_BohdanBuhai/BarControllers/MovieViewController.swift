//
//  MovieViewController.swift
//  HomeWork4_BohdanBuhai
//
//  Created by Bohdan on 5/23/23.
//

import UIKit


final class MovieViewController: UIViewController {
    
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
    
    func creatUrl(api: String) -> URL {
        guard let apiUrl = URL(string: api) else {return URL(string: "")!}
        return apiUrl
    }
    func loadData() {
        
        let apiUrl = creatUrl(api: "https://api.themoviedb.org/3/trending/movie/week?api_key=97f9be71d695b2b55155b49b40b9c53a")
        
        let taskGetTrendMovie = session.dataTask(with: apiUrl) {data,_,_ in
            guard let data = data else {return}
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    let allTreds = try decoder.decode(TrendingMovies.self, from: data)
                    self.arreyR = allTreds.results
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
            }
        }
        taskGetTrendMovie.resume()
    }
}
