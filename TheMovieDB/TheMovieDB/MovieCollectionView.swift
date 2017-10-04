//
//  MovieCollectionView.swift
//  TheMovieDB
//
//  Created by Jeniffer Acosta Orrego on 9/7/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class MovieCollectionView: UICollectionView, MovieDataListView {

    var movieDataSource: MovieDataSource?
    
    func configure(){
        self.dataSource = self
        register(UINib(nibName: "CustomCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CustomCollectionViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        super.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        configure()
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.itemSize = CGSize(width: width / 2.1, height: height/2.5)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
}

extension MovieCollectionView: UICollectionViewDataSource, UITableViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Number items")
        return movieDataSource?.numberOfItems(at: section) ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cell for item")
        let cell = dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        movieDataSource?.configure(cell: cell, atIndex: indexPath)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("Number sections")
        return movieDataSource?.numberOfSections() ?? 1
    }
}
