//
//  MovieViewController.swift
//  HomeWork4_BohdanBuhai
//
//  Created by Bohdan on 5/23/23.
//

import UIKit


final class MovieViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arrey = [Result]()
    var countMovies = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")

    }
    
    func creatUrl(api: String) -> URL {
        guard let apiUrl = URL(string: api) else {return URL(string: "")!}
        return apiUrl
    }
    
    
}
