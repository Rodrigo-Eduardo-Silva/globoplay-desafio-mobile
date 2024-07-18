//
//  ViewController.swift
//  GlobloPlayChallenge
//
//  Created by Rodrigo Eduardo Silva on 10/07/24.
//

import UIKit

class ViewController: UIViewController {
    var model = TrendingService(network: Network())
    var card = CoverTrending()

    lazy var collectionTrend: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .green
        collectionView.register(CellCollectionTrend.self, forCellWithReuseIdentifier: CellCollectionTrend.indetifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    var collectionview: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            do {
                try await model.loadTrending()
                print(model.trending.count)
//                let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//                        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//                        layout.itemSize = CGSize(width: view.frame.width, height: 700)
//
//                        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//                        collectionview.dataSource = self
//                        collectionview.delegate = self
//                collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "id")
//                        collectionview.showsVerticalScrollIndicator = false
//                collectionview.backgroundColor = .white
//                        self.view.addSubview(collectionview)
                self.view.addSubview(collectionTrend)
                view.backgroundColor = .cyan
               // addConstrains()

            } catch {
                print(error)
            }
        }

    }

    private func addConstrains() {
        NSLayoutConstraint.activate([
            self.collectionTrend.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.collectionTrend.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

    func updateCover() {
        card.updateImage(with: model.trending[0])
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return model.trending.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollectionTrend.indetifier, for: indexPath) as? CellCollectionTrend else {
                fatalError()
            }
            cell.prepareCell(with: model.trending[indexPath.row])
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath)
//              let label = UILabel()
//              label.text = model.trending[indexPath.row].title
//              cell.backgroundView = label
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 100, height: 100)
        }


    }
