//
//  ImageDownloader.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 30.01.2022.
//

import UIKit
import Alamofire

typealias DownloadImageCompletion = (_ image: UIImage?, _ error: Error?) -> Void

final class ImageDownloader {
    
    public func getImage(fromUrl url: URLConvertible, completion: @escaping DownloadImageCompletion) {
        AF.request(url).response(completionHandler: { (dataResponse) in
            if let error = dataResponse.error {
                completion(nil, error)
                return
        }

            guard let imageData = dataResponse.data else {
                let errorUserInfo = [NSLocalizedDescriptionKey: "Error: There is no data"]
                let error = NSError(domain:"Image", code:401, userInfo:errorUserInfo)
                completion(nil, error)
                
                return
            }
            
            guard let image = UIImage(data: imageData, scale: 1.0) else {
                let errorUserInfo = [NSLocalizedDescriptionKey: "Error of convertible from data to picture"]
                let error = NSError(domain:"Image", code:401, userInfo:errorUserInfo)
                completion(nil, error)
                
                return
            }
            
            completion(image, nil)
        })
    }
}

