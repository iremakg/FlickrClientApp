//
//  photos.swift
//  FlickrClientApp
//
//  Created by İrem Akgoz on 1.10.2022.
//

import Foundation

struct Photos : Codable{
   let page: Int?
   let pages: Int?
   let perpage: Int?
   let total: Int?
   let photo: [Photo]?
       
   }
