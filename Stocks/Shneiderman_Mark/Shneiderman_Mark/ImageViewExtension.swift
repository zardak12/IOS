//
//  ImageViewExtension.swift
//  Shneiderman_Mark
//
//  Created by Марк Шнейдерман on 31.01.2021.
//

import UIKit

//MARK: -метод для парсинга фотографиии
extension UIImageView {
  func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
      contentMode = mode
      URLSession.shared.dataTask(with: url) { data, response, error in
          guard
              let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
              let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
              let data = data, error == nil,
              let image = UIImage(data: data)
              else { return }
          DispatchQueue.main.async() { [weak self] in
              self?.image = image
          }
      }.resume()
  }

}
