//
//  MovieCollectionViewCell.swift
//  Movs
//
//  Created by Jéssica Trindade on 31/08/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import UIKit

protocol MovieCollectionViewCellDelegate: AnyObject {
    func favoritedMovie(movie: Movie?)
}

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var favoriteButton: UIButton!
    
    weak var delegate: MovieCollectionViewCellDelegate?
    
    var movie: Movie? = nil {
        didSet {
            update()
        }
    }
    var favoriteManager = FavoriteManager()
    

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    @IBAction func makeFavorite(_ sender: Any) {
        delegate?.favoritedMovie(movie: movie)
        changeButtonType()
        
    }
    
    private func update() {
        titleLabel.text = movie?.title
        changeButtonType()
    }
    
    func changeButtonType() {
        guard let movie = movie else {
            return
        }
        
        let hasMovie = favoriteManager.movies.filter { (favoriteMovie) -> Bool in
            return movie.id == favoriteMovie.id
        }
        
        if hasMovie.isEmpty {
            favoriteButton.setImage(UIImage(named: "favorite_gray_icon"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "favorite_full_icon"), for: .normal)
            
        }
    }
    
}

