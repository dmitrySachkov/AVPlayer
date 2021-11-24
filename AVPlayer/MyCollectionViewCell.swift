//
//  MyCollectionViewCell.swift
//  AVPlayer
//
//  Created by Dmitry Sachkov on 23.11.2021.
//

import UIKit
import youtube_ios_player_helper

//protocol PlayVideoDelegate {
//    func playVideo(id: String, index: IndexPath)
//}

class MyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyCollectionViewCell"

//    var delegate: PlayVideoDelegate?
    
    private var videoView: YTPlayerView = {
        let view = YTPlayerView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(videoView)
        
        let itemHeight = contentView.bounds.size.width / 3 * 2
        
        NSLayoutConstraint.activate([
            videoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            videoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            videoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            videoView.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
    
    private func getQueryStringParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { print("no id")
            return nil }
        let result = url.queryItems?.first(where: { $0.name == param })?.value
        return result
      }
    
    func configure(model: String, index: IndexPath) {
//        print(model)
        guard let id = getQueryStringParameter(url: model, param: "v") else { return }
//        print(id)
//        delegate?.playVideo(id: id, index: index)
        videoView.load(withVideoId: id)
        playerViewDidBecomeReady(videoView)
        videoView.delegate = self
    }
    
//    func play(with id: String) {
//        videoView.load(withVideoId: id, playerVars: ["playsinline": 1])
//    }
}

extension MyCollectionViewCell: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        print("Ready")
        playerView.playVideo()
    }
}
