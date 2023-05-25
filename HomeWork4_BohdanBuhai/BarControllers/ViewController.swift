//
//  ViewController.swift
//  HomeWork4_BohdanBuhai
//
//  Created by Bohdan on 5/19/23.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatingRecvest()
        getingGenres()
    }
    //MARK: Creat rcvest by Swift exempl
    @IBAction func getImageButtonPresed(_ sender: Any) {
        //1 створити IPA
        let api = "https://picsum.photos/200/300"
        //2 створити URL
        guard let apiURL = URL(string: api) else {return}
        //3 ініціалізувати сесію
        let session = URLSession(configuration: .default)
        //4 створити запит
        let taskGetImage = session.dataTask(with: apiURL) {data,_,error in
            guard let data = data, error == nil else {return}
            //5 обробити получені дані
            DispatchQueue.main.async {
                self.myImage.image = UIImage(data: data)
            }
        }
        // звпустити запит
        taskGetImage.resume()
    }
    
    // MARK: Task3
    private func creatingRecvest() {
        guard let filePath = Bundle.main.url(forResource: "MyJson", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: filePath)
            let decoder = JSONDecoder()
            let allData = try decoder.decode(Compani.self, from: data)
            print("* \(allData.companyDescription)\n* \(allData.listOfData[0].modelNumbers)\n* \(allData.listOfData[0].countris.last ?? "")\n* \(allData.listOfData.last?.price.regions[0].name ?? "")\n* \(allData.listOfData.last?.price.regions.last?.price ?? 0) ")
        } catch {
            print(error)
        }
    }
    
        private func getingGenres() {
            let api = "https://api.themoviedb.org/3/genre/movie/list?api_key=97f9be71d695b2b55155b49b40b9c53a"
            guard let apiUrl = URL(string: api) else {return}
            let session = URLSession(configuration: .default)
            let taskGetGenres = session.dataTask(with: apiUrl) {data,_,_ in
                guard let data = data else {return}
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder()
                        let allGenres = try decoder.decode(Genres.self, from: data)
                        print(allGenres.genres[0].name)
                        print(allGenres.genres[0].id)
                    } catch {
                        print(error)
                    }
                }
            }
            taskGetGenres.resume()
        }
    
}

