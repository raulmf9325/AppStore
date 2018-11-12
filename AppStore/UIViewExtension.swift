//
//  UIViewExtension.swift
//  AppStore
//
//  Created by Raul Mena on 11/11/18.
//  Copyright © 2018 Raul Mena. All rights reserved.
//

import UIKit

extension UIView{
    
    func addConstraintsWithFormat(format: String, views: UIView ...){
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

