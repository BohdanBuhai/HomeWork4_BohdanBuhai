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
        arreyR.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = UITableViewCell()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {return cell1}
        let movie = arreyR[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.idLabel.text = "ID-\(movie.id))"
        cell.overviewLabel.text = movie.overview
        let imagUrl = self.creatUrl(api: "https://image.tmdb.org/t/p/w500\(movie.backdropPath)")
        let taskGetImagr = session.dataTask(with: imagUrl) {data,_,_ in
            guard let data = data else {return}
            DispatchQueue.main.async {
                cell.imagrView.image = UIImage(data: data)
            }
        }
        taskGetImagr.resume()
        return cell
    }
}


