//
//  NetworkManager.swift
//  FlickrClientApp
//
//  Created by İrem Akgoz on 1.10.2022.
//

import Foundation
class Networkmanager{
    static let shared = Networkmanager()

     func  fetchImage(with url : String?, completion: @escaping (Data) -> Void){
        
        if let urlString = url ,let url =  URL(string: urlString) {
            let request = URLRequest(url: url )
            URLSession.shared.dataTask(with: request) { data , response, error in
                if let error = error {
                    debugPrint(error)
                    return
                }
                if let data = data {
                    DispatchQueue.main.async {
                       completion(data)

                    }
                }
            }.resume()
       
        }

    }
    
}
