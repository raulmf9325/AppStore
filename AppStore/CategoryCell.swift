//
//  CategoryCell.swift
//  AppStore
//
//  Created by Raul Mena on 11/11/18.
//  Copyright © 2018 Raul Mena. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        appsCollectionView.clipsToBounds = false
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: "AppCellId")
        
        addSubview(appsCollectionView)
        addSubview(dividerLineView)
        addSubview(nameLabel)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: appsCollectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: appsCollectionView)
        nameLabel.frame = CGRect(x: 13, y: 5, width: frame.width, height: 20)
        dividerLineView.frame = CGRect(x: 10, y: frame.height + 25, width: frame.width, height: 1)
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Best New Apps"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = appsCollectionView.dequeueReusableCell(withReuseIdentifier: "AppCellId", for: indexPath) as! AppCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 25)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AppCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        imageView.frame = CGRect(x: 0, y: 15, width: frame.width, height: frame.width)
        
        /*      the collectionView property clipsToBounds must be set to false for this to work -> placing an item outside the cell with CGRect
        */
        nameLabel.frame = CGRect(x: 5, y: frame.width + 16, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 5, y: frame.width + 54, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 5, y: frame.width + 72, width: frame.width, height: 20)
    }
    
    let imageView: UIImageView = {
        let image = UIImage(named: "Frozen")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Disney Build It: Frozen"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Entertainment"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$3.99"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        return label
    }()
    
}
