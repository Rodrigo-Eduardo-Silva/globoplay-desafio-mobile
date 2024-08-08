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
        collectionView.backgroundColor = .black
        collectionView.register(CellCollectionTrend.self, forCellWithReuseIdentifier: CellCollectionTrend.indetifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: card.frame.width, height: card.frame.height)
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    lazy var collectionTrendTv: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        collectionView.register(CellCollectionTrend.self, forCellWithReuseIdentifier: CellCollectionTrend.indetifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: card.frame.width, height: card.frame.height)
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
                try await model.loadTrendingTv()
                print(model.trending.count)
                print(model.trendingTv.count)
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
                self.view.addSubview(collectionTrendTv)
                view.backgroundColor = .black
                addConstrains()

            } catch {
                print(error)
            }
        }

    }

    private func addConstrains() {
        NSLayoutConstraint.activate([
            self.collectionTrend.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.collectionTrend.heightAnchor.constraint(equalToConstant: 300),
            self.collectionTrend.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 10),
            self.collectionTrend.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionTrendTv.topAnchor.constraint(equalTo: collectionTrend.bottomAnchor,constant: 30),
            self.collectionTrendTv.heightAnchor.constraint(equalToConstant: 300),
            self.collectionTrendTv.leadingAnchor.constraint(equalTo: collectionTrend.leadingAnchor),
            self.collectionTrendTv.trailingAnchor.constraint(equalTo: collectionTrend.trailingAnchor)
        ])
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            1
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionview == collectionTrend {
                return model.trending.count
            }
            return model.trendingTv.count

        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionTrend.dequeueReusableCell(withReuseIdentifier: CellCollectionTrend.indetifier, for: indexPath) as? CellCollectionTrend else {
                fatalError()
            }
            cell.prepareCell(with: model.trending[indexPath.row])

                if collectionView == collectionTrendTv {
                    guard let cell = collectionTrendTv.dequeueReusableCell(withReuseIdentifier: CellCollectionTrend.indetifier, for: indexPath) as? CellCollectionTrend else {
                        fatalError()
                    }
                    cell.coverTrend.prepareCellTv(with: model.trendingTv[indexPath.row])
                    return cell
                }

            return cell
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 200, height: 200)
        }

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if collectionView == collectionTrend {
                let trend = model.trending[indexPath.row]
                let viewController = DetailViewController()
                viewController.trend = trend
                viewController.modalPresentationStyle = .formSheet
                present(viewController,animated: true)
            }
        }

}
