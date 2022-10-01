//
//  PhotoDetailViewController.swift
//  FlickrClientApp
//
//  Created by İrem Akgoz on 27.09.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photo: Photo?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "photo detail"
        imageView.backgroundColor = .gray
        ownerImageView.backgroundColor = .gray
        ownerImageView.layer.cornerRadius = 24.0
        ownerNameLabel.text = "owner name"
        descriptionLabel.text = " description label description label description label description label description label description label description label description label description label description label"
        ownerNameLabel.text = photo?.ownername
        if let iconserver = photo?.iconserver,
           let iconfarm = photo?.iconfarm,
           let nsid = photo?.owner,
           NSString(string: iconserver).intValue > 0 {
            
            Networkmanager.shared.fetchImage(with: "http://farm\(iconfarm).staticflickr.com/\(iconserver)/buddyicons/\(nsid).jpg") { data in
                self.ownerImageView.image = UIImage(data: data)
            }
        }else{
            Networkmanager.shared.fetchImage(with: "https://www.flickr.com/images/buddyicon.gif") { data in
                self.ownerImageView.image = UIImage(data: data)
            }
        }
        
        Networkmanager.shared.fetchImage(with: photo?.urlZ) { data in
            self.imageView.image = UIImage(data: data)
        }
      
        title = photo?.title
        descriptionLabel.text = photo?.photoDescription?.content
    }
    
   
}
