//
//  ImageViewService.swift
//  MealDB
//
//  Created by Adam Smith on 5/24/23.
//

import UIKit

class ImageViewService: UIImageView {
    
    let service = APIService()
    func fetchImage(using url: URL) {
        let request = URLRequest(url: url)
        service.perform(request) { [weak self] result in
            switch result {
            case .failure:
                self?.setDefaultImage()
            case .success(let Dessertimage):
                guard let image = UIImage(data: Dessertimage) else {
                    self?.setDefaultImage()
                    return
                }
                DispatchQueue.main.async {
                    self?.contentMode = .scaleAspectFit
                    self?.image = image
                }
            }
        }
    }
    
    func setDefaultImage() {
        contentMode = .scaleAspectFit
        self.image = UIImage(systemName: "ticket")
    }
}
