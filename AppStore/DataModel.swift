//
//  DataModel.swift
//  AppStore
//
//  Created by Raul Mena on 11/12/18.
//  Copyright © 2018 Raul Mena. All rights reserved.
//

import UIKit

class Category: Decodable{
    var name: String?
    var apps: [App]?
    
    static func fetchFeaturedApps(completionHandler: @escaping ([Category]) -> ()){
        let jsonUrlString = "https://api.letsbuildthatapp.com/appstore/featured"
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // check error
            // check response 200 OK
            guard let data = data else {return}
            
            do{
                let featuredWebsite = try JSONDecoder().decode(FeaturedWebsite.self, from: data)
                
                guard let categories = featuredWebsite.categories else {return}
                
                /*  1- We use a completion handler because the lines of code that are passed as parameter: reload data and update categories
                       should execute only when finished downloading from the internet
                    2- We execute the completion handler asynchronously because updating the UI can only occur in the main thread
                 */
                DispatchQueue.main.async(execute: {
                    completionHandler(categories)
                })
                
            } catch let jsonError{
                print("Error while parsing JSON ", jsonError)
            }
            }.resume()
    }

}

class App: Decodable{
    var Id: CGFloat?
    var Name: String?
    var Category: String?
    var ImageName: String?
    var Price: CGFloat?
}


struct FeaturedWebsite: Decodable{
    var bannerCategory: BannerCategory?
    var categories: [Category]?
}

struct BannerCategory: Decodable{
    var apps: [Apps]?
}

struct Apps: Decodable{
    var ImageName: String?
}