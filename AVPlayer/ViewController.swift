//
//  ViewController.swift
//  AVPlayer
//
//  Created by Dmitry Sachkov on 22.11.2021.
//

import UIKit
import AVFoundation
import AVKit
import Kingfisher


//"https://www.youtube.com/watch?v=_gQ5lZJtggY"

class ViewController: UIViewController {
    
    private let urlString = "https://images.app.goo.gl/Ff6oTSEkYxytXDLs9"
    
    private var videoView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        setupUI()
        playVideo()
    }

    private func setupUI() {
        view.addSubview(videoView)
        
        NSLayoutConstraint.activate([
            videoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            videoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            videoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            videoView.heightAnchor.constraint(equalToConstant: view.bounds.width / 3 * 2)
        ])
    }
    
    private func playVideo() {
//        DispatchQueue.main.async {
//            let url = NSURL(string: self.urlString)
//            let playerItem = AVPlayerItem(url: url! as URL)
//            let player = AVQueuePlayer(playerItem: playerItem)
//            let playerLayer = AVPlayerLayer(player: player)
//            playerLayer.frame = self.videoView.bounds
//            self.videoView.layer.addSublayer(playerLayer)
//            player.play()
//        }
        let url = URL(string: urlString)
        videoView.kf.setImage(with: url)
    }

}

