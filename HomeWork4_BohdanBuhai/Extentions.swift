//
//  Extention.swift
//  HomeWork4_BohdanBuhai
//
//  Created by Bohdan on 5/23/23.
//

import Foundation
import UIKit

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = UITableViewCell()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {return cell1}
        
        let apiUrl = creatUrl(api: "https://api.themoviedb.org/3/trending/movie/week?api_key=97f9be71d695b2b55155b49b40b9c53a")
        let session = URLSession(configuration: .default)
        let taskGetTrendMovie = session.dataTask(with: apiUrl) {data,_,_ in
            guard let data = data else {return}
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    let allTreds = try decoder.decode(TrendingMovies.self, from: data)
                    let movie = allTreds.results[indexPath.row]
                    self.arrey = allTreds.results
                    cell.titleLabel.text = movie.title
                    cell.idLabel.text = "ID-\(movie.id))"
                    cell.overviewLabel.text = movie.overview
                    let imagUrl = self.creatUrl(api: movie.posterPath)
                    let taskGetImagr = session.dataTask(with: imagUrl) {data,_,_ in
                        guard let data = data else {return}
                        DispatchQueue.main.async {
                            cell.imagrView.image = UIImage(data: data)
                        }
                    }
                    taskGetImagr.resume()
                    
                } catch {
                    print(error)
                }
            }
        }
        taskGetTrendMovie.resume()

        return cell
    }
}


