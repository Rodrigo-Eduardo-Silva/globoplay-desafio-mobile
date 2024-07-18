import Foundation
import UIKit
import Kingfisher

final class CoverTrending: UIView {
    lazy var coverImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "rebel")
        let resizeImage = image?.resize(150, 150)
        imageView.image = resizeImage
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        addContrains()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        self.addSubview(coverImage)
    }

    private func addContrains() {
        coverImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        coverImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    func prepareCell(with trend: TrendingItem) {
        let url = URL(string: Server.imageURL + trend.poster_path)
        coverImage.kf.setImage(with: url)
    }

}
