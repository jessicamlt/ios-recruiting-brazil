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
        // Initialization code
    }

    @IBAction func makeFavorite(_ sender: Any) {
        delegate?.favoritedMovie(movie: movie)
        
    }
    
    private func update() {
        titleLabel.text = movie?.title
        
    }
    
}

