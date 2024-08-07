import Foundation
import UIKit
import Kingfisher

class DetailScreen: UIView {
    lazy var detailImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "rebel")
        imageView.image = image
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var detailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var trend: TrendingItemMovie?

    init(frame: CGRect = .zero, trend: TrendingItemMovie) {
        super.init(frame: frame)
        self.trend = trend
        addCompoments()
        addConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addCompoments() {
        self.addSubview(detailImage)
        self.addSubview(titleLabel)
        self.addSubview(detailLabel)
    }
    
    private func addConstrains() {
        detailImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: detailImage.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 30).isActive = true
        detailLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
    }

    private func configureDetail(with trend:TrendingItemMovie) {

    }



}
