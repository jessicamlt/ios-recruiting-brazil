//
//  DetailScreenViewController.swift
//  Movs
//
//  Created by Jéssica Trindade on 31/08/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import UIKit
import Kingfisher

class DetailScreenViewController: UIViewController {
    
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseYearLabel: UILabel!
    @IBOutlet var typeDescriptionLabel: UILabel!
    @IBOutlet var overviewTextView: UITextView!
    @IBOutlet var favoriteButton: UIButton!
    
    
    var movie = Movie()
    var basePath = "https://image.tmdb.org/t/p"
    var coverSize = "/w185"
    var favoriteManager = FavoriteManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Movie"
        titleLabel.text = movie.title
        releaseYearLabel.text = movie.releaseYear
        overviewTextView.text = movie.overview
        typeDescriptionLabel.text = movie.genres.joined(separator: ", ")
        
        if let url = URL(string: basePath + coverSize + (movie.posterPath ?? "")) {
            coverImageView.kf.setImage(with: url)
        } else {
            coverImageView.image = UIImage(named: "placeholder")
        }
        
        changeButtonType()
    }
    
    
    @IBAction func makeFavorite(_ sender: UIButton) {
        favoriteManager.addMoviesInFavoriteList(movie)
        changeButtonType()
    }
    
    func changeButtonType() {
        let hasMovie = favoriteManager.movies.filter { (favoriteMovie) -> Bool in
            return movie.id == favoriteMovie.id
        }
        
        if hasMovie.isEmpty {
            favoriteButton.setImage(UIImage(named: "favorite_empty_icon"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "favorite_full_icon"), for: .normal)
        }
    }

}
