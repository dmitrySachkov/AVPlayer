//
//  ViewController.swift
//  AVPlayer
//
//  Created by Dmitry Sachkov on 22.11.2021.
//

import UIKit
//import youtube_ios_player_helper

class ViewController: UIViewController {
    
    private let models = ["https://www.youtube.com/watch?v=_gQ5lZJtggY",
                         "https://www.youtube.com/watch?v=_gQ5lZJtggY",
                         "https://www.youtube.com/watch?v=_gQ5lZJtggY",
                         "https://www.youtube.com/watch?v=_gQ5lZJtggY"]
    
    private var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        setupUI()
    }

    private func setupUI() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width - 20,
                                 height: (view.frame.size.width / 3 * 2) - 10)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.size.width / 3 * 2)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
   
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        let model = models[indexPath.row]
        cell.configure(model: model, index: indexPath)
//        cell.delegate = self
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        guard let videoCell = cell as? MyCollectionViewCell else { return }
//        videoCell.delegate = self
//    }
}

//extension ViewController: PlayVideoDelegate {
//    func playVideo(id: String, index: IndexPath) {
//        guard let cell = collectionView?.cellForItem(at: index) as? MyCollectionViewCell else { return }
//        cell.play(with: id)
//        collectionView?.reloadData()
//    }
//}
