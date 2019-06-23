//
//  DetailViewController.swift
//  Multicines Cáceres
//
//  Created by Daniel Llanos Muñoz on 21/06/2019.
//  Copyright © 2019 Daniel Llanos Muñoz. All rights reserved.
//

import Foundation
import Alamofire

class DetailViewController: UIViewController {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UITextView!
    @IBOutlet weak var movieDescription: UITextView!
    
    var movieId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMoviesDetail()
    }
    
    func getMoviesDetail(){
        let url = "http://llanosmunoz.com:8084/movies/"+movieId
        Alamofire.request(url).responseJSON { response in
            if let movieDetailResponse = response.result.value as! NSDictionary? {
                let movieDetail = MovieDetails(fromDictionary: movieDetailResponse as! [String : Any])
                self.movieTitle.text = movieDetail.title
                self.movieDescription.text = movieDetail.sinopsis
                let url = URL(string: movieDetail.image)
                let data = try? Data(contentsOf: url!)
                self.movieImage.image = UIImage(data: data!)
                
            }
        }
    }
   
    
}
