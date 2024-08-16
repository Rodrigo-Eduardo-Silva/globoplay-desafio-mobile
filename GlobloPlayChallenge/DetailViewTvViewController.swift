import Foundation
import UIKit

class DetailViewTvViewController: UIViewController {
    var trend: TrendingItemTv?

    init(trend: TrendingItemTv) {
        super.init(nibName: nil, bundle: nil)
        self.trend = trend
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let trend else { return }
        self.view = DetailScrenTv(trend: trend)
            self.view.backgroundColor = .black
    }
}

