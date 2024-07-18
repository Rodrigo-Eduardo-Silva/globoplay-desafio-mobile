import Foundation
import UIKit
import Kingfisher

final class CoverTrending: UIView {
    lazy var coverImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "rebel")
        let resizeImage = image?.resize(200, 200)
        imageView.image = resizeImage
        imageView.tag = 2
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var label: UILabel = {
       let label = UILabel()
       label.textAlignment = .center
       label.textColor = .blue
       return label
   }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
//        addContrains()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        self.addSubview(coverImage)
        self.addSubview(label)
    }

    private func addContrains() {
        coverImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        coverImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 20).isActive = true
    }

    func updateImage(with trend: TrendingItem) {
        let url = URL(string: Server.imageURL + trend.poster_path)
        coverImage.kf.setImage(with: url)
        label.text = trend.title
    }

}
