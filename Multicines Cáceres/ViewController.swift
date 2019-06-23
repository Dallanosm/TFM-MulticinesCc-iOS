//
//  ViewController.swift
//  Multicines Cáceres
//
//  Created by Daniel Llanos Muñoz on 05/06/2019.
//  Copyright © 2019 Daniel Llanos Muñoz. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var carousel: iCarousel!
   
    var movies: [Movie] = []
    
  /*  var images = [UIImage(named: "test1"),
                  UIImage(named: "test2"),
                  UIImage(named: "test3"),
                  UIImage(named: "test4"),
                  UIImage(named: "test5"),
                  UIImage(named: "test6"),
                  UIImage(named: "test7"),
                  UIImage(named: "test8"),
                  UIImage(named: "test9"),
                  UIImage(named: "test10")]*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carousel.type = .rotary
        carousel.contentMode = .scaleAspectFit
        carousel.isPagingEnabled = true
        getMovies()
    }
    
    func getMovies(){
        Alamofire.request("http://llanosmunoz.com:8084/movies").responseJSON { response in
            if let json = response.result.value as! NSArray? {
                for element  in json {
                    self.movies.append(Movie(dictionary: (element as! NSDictionary) as! [String : Any]) )
                }
                self.carousel.reloadData()
            }
        }
    }

}

extension ViewController: iCarouselDelegate, iCarouselDataSource{
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return movies.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var image: UIImageView!
        
        if(view==nil){
            image = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
            image.contentMode = .scaleAspectFit
        } else {
            image = view as? UIImageView
        }
        
        let url = URL(string: movies[index].img)
        let data = try? Data(contentsOf: url!) 
        image.image = UIImage(data: data!)
        
        return image
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        newViewController.movieId = self.movies[index].id
        self.present(newViewController, animated: true, completion: nil)
    }
    
}

