import UIKit

class CellCollectionTrend: UICollectionViewCell {
    static let indetifier: String = "CellCollectionTrend"

    let coverTrend: CoverTrending = {
        let view = CoverTrending()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.coverTrend)
        addConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareCell(with trend: TrendingItemMovie) {
        self.coverTrend.prepareCell(with: trend)
    }

    private func addConstrains() {
        NSLayoutConstraint.activate([
            self.coverTrend.topAnchor.constraint(equalTo: self.topAnchor),
            self.coverTrend.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.coverTrend.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.coverTrend.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
