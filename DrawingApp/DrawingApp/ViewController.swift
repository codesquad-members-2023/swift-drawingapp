import UIKit
import OSLog

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rectangle = Rectangle(locatedX: Double.random(in: 0...UIScreen.main.bounds.width), locatedY:  Double.random(in: 0...UIScreen.main.bounds.height))
        os_log("\(rectangle.description)")
    }
}

