import Foundation
import UIKit

class DetailViewController: UIViewController {
    var trend: TrendingItemMovie?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let trendMovie = trend {
            self.view = DetailScreen(frame: .infinite, trend: trendMovie)
            self.view.backgroundColor = .black
        }

    }
}
