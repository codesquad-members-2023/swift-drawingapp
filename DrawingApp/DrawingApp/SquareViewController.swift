//
//  SquareViewController.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import UIKit

class SquareViewController: UIViewController {
    let log = Logger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        run(howMany: 4)
    }

    func run(howMany amount : Int) {
        
        let widthLimit = self.view.bounds.width
        let heightLimit = self.view.bounds.height
        let randomSquareFactory = RandomSquareFactory()
        
        for order in 1...amount{
            guard let newSquare = randomSquareFactory.produce(widthLimit: widthLimit, heightLimit: heightLimit) else {
                return
            }
            log.printLog(of: newSquare ,order:order)
        }
    }

}
