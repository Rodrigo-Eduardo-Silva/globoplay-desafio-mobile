import Foundation
import UIKit
import Kingfisher

class DetailScreenMovie: UIView {
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
        label.numberOfLines = 2
        label.lineBreakMode = NSLineBreakMode.byCharWrapping
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var detailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 40
        label.textColor = .white
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var trend: TrendingItemMovie?
    init(frame: CGRect = .zero, trend: TrendingItemMovie) {
        super.init(frame: frame)
        self.trend = trend
        addCompoments()
        addConstrains()
        configureDetail(with: trend)
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
        detailImage.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: detailImage.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        detailLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }

    private func configureDetail(with trend:TrendingItemMovie) {
        let url = URL(string: Server.imageURL + trend.poster_path)
        detailImage.kf.setImage(with: url)
        titleLabel.text = trend.title
        detailLabel.text = trend.overview
    }

}
