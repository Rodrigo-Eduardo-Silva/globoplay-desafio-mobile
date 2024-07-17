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
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.register(CellCollectionTrend.self, forCellWithReuseIdentifier: CellCollectionTrend.indetifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            do {
                try await model.loadTrending()
                print(model.trending.count)

            } catch {
                print(error)
            }
        }
        self.view.addSubview(self.collectionTrend)
        addConstrains()
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
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 200, height: 200)
        }


    }
