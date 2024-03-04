//
//  MovieDetailsViewController.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import UIKit
import Kingfisher

protocol MovieDetailsViewControllerPresenterProtocol: AnyObject {
    
}

class MovieDetailsViewController: UIViewController {
    
    var presenter: MovieDetailsPresenterViewControllerProtocol?
    var movie: Result?
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var notaLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never

        guard let movie = movie else {
            return
        }
        setData(movie: movie)
        // Do any additional setup after loading the view.
    }
    
    func setData(movie: Result){
        titleLabel.text = movie.title
        notaLabel.text = String(movie.voteAverage)
        dateLabel.text = movie.releaseDate
        posterImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath!)"))
        summaryLabel.text = movie.overview
    }

}

extension MovieDetailsViewController: MovieDetailsViewControllerPresenterProtocol {
    
}
