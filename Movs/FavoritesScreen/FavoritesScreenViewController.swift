//
//  FavoritesScreenViewController.swift
//  Movs
//
//  Created by Jéssica Trindade on 31/08/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import UIKit
import Kingfisher

class FavoritesScreenViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var favoriteManager = FavoriteManager()
    var basePath = "https://image.tmdb.org/t/p"
    var coverSize = "/w185"
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        
        setupTableView()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        favoriteManager.refresh()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tabBarController?.title = "Movies"
    }
    
    func setupTableView() {
        let nib = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell2")
        tableView.dataSource = self
    }

}

extension FavoritesScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteManager.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? FavoriteTableViewCell else {
            fatalError("Célula não encontrada")
        }
        
        let movie = favoriteManager.movies[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.overviewLabel.text = movie.overview
        cell.releaseYearLabel.text = movie.releaseYear
        
        let coverPath = movie.posterPath
        if let url = URL(string: basePath + coverSize + (coverPath ?? "")) {
            cell.coverImageView.kf.setImage(with: url)
        } else {
            cell.coverImageView.image = UIImage(named: "placeholder")
        }
        
        return cell
    }
    
    
}


