
//import UIKit
//
//class CollectionTrend: UIView {
//    lazy var collectionTrend: UICollectionView = {
//        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .none
//        collectionView.register(CellCollectionTrend.self, forCellWithReuseIdentifier: CellCollectionTrend.indetifier)
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
//        layout.scrollDirection = .horizontal
//        collectionView.setCollectionViewLayout(layout, animated: true)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        return collectionView
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//    }
//
//    required init(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//}
//
//extension CollectionTrend: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//
//}
