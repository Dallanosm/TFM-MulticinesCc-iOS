//
//  ViewController.swift
//  Multicines Cáceres
//
//  Created by Daniel Llanos Muñoz on 05/06/2019.
//  Copyright © 2019 Daniel Llanos Muñoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var carousel: iCarousel!
    
    var images = [UIImage(named: "test1"),
                  UIImage(named: "test2"),
                  UIImage(named: "test3"),
                  UIImage(named: "test4"),
                  UIImage(named: "test5"),
                  UIImage(named: "test6"),
                  UIImage(named: "test7"),
                  UIImage(named: "test8"),
                  UIImage(named: "test9"),
                  UIImage(named: "test10")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carousel.type = .rotary
        carousel.contentMode = .scaleAspectFit
        carousel.isPagingEnabled = true
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension ViewController: iCarouselDelegate, iCarouselDataSource{
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return images.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var image: UIImageView!
        
        if(view==nil){
            image = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
            image.contentMode = .scaleAspectFit
        } else {
            image = view as? UIImageView
        }
        
        image.image = images[index]
        return image
    }
    
}

