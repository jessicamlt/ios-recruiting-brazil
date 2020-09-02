//
//  MainScreenViewController.swift
//  Movs
//
//  Created by Jéssica Trindade on 31/08/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import UIKit
import Kingfisher

class MainScreenViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var collectionView: UICollectionView!
    
    var baseData = BaseData()
    var movies: [Movie] = []
    var moviesModel = MoviesModel()
    var basePath = "https://image.tmdb.org/t/p"
    var coverSize = "/w185"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        moviesModel.getMovies { (baseData) in
            self.movies = baseData.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tabBarController?.title = "Movies"
    }
    
    func setupCollectionView() {
        let nib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension MainScreenViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MovieCollectionViewCell else {
            fatalError("Célula não encontrada")
        }
        
        let movie = movies[indexPath.row]
        cell.titleLabel.text = movie.title
        
        let coverPath = movies[indexPath.row].posterPath
        if let url = URL(string: basePath + coverSize + (coverPath ?? "")) {
            cell.coverImageView.kf.setImage(with: url)
        } else {
            cell.coverImageView.image = UIImage(named: "placeholder")
        }
        
        return cell
    }
}

extension MainScreenViewController: UICollectionViewDelegate {
    
}
