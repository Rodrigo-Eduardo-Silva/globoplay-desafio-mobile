import Foundation
import UIKit

class DetailViewMovieController: UIViewController {
    var trend: TrendingItemMovie?

    init(trend: TrendingItemMovie) {
        super.init(nibName: nil, bundle: nil)
        self.trend = trend
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let trend else { return }
        self.view = DetailScreenMovie(frame: .infinite, trend: trend)
            self.view.backgroundColor = .black
    }
}
