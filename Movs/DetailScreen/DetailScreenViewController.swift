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
    
    
    var movie = Movie()
    var basePath = "https://image.tmdb.org/t/p"
    var coverSize = "/w185"

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Movie"
        titleLabel.text = movie.title
        releaseYearLabel.text = movie.releaseYear
        overviewTextView.text = movie.overview
        
        if let url = URL(string: basePath + coverSize + (movie.posterPath ?? "")) {
            coverImageView.kf.setImage(with: url)
        } else {
            coverImageView.image = UIImage(named: "placeholder")
        }
        
    }
    
    

    

}
