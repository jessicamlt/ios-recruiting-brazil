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
    
    var baseData: BaseData?
    var movies: [Movie] = []
    var moviesModel = MoviesModel()
    var basePath = "https://image.tmdb.org/t/p"
    var coverSize = "/w185"
    var loadingMovies = false
    var page = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tabBarController?.title = "Movies"
    }
    
    func loadMovies() {
        loadingMovies = true
        setupCollectionView()
        moviesModel.getMovies(page: self.page) { (baseData) in
            self.baseData = baseData
            self.movies.append(contentsOf: baseData.results ?? [])
            DispatchQueue.main.async {
                self.loadingMovies = false
                self.collectionView.reloadData()
            }
        }
    }
    
    
    func setupCollectionView() {
        let nib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == movies.count - 5 && !loadingMovies && movies.count <= baseData?.totalResults ?? 0 {
            page += 1
            loadMovies()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = DetailScreenViewController()
        viewController.movie = movies[indexPath.row]
        present(viewController, animated: true, completion: nil)
    }
}

extension MainScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width / 2) - 20
        return CGSize(width: cellWidth, height: cellWidth * 1.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    
}
