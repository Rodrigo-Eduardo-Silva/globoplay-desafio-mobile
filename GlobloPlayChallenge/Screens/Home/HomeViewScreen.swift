
import Foundation
import UIKit

class HomeViewScreen: UIView {

    let collection = CollectionTrend()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildViewHierarchy()
        addConstrains()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildViewHierarchy() {
        addSubview(collection)
    }

    private func addConstrains() {
        NSLayoutConstraint.activate([
            collection.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collection.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         ])
    }


}

