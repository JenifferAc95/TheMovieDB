//
//  TableViewController.swift
//  TheMovieDB
//
//  Created by Jeniffer Acosta Orrego on 9/5/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var movieDataListView: MovieDataListView = TableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let listView = movieDataListView as! UIView
        movieDataListView.movieDataSource = self
        view.addSubview(listView)
        listView.addConstraints(toFillSuperView: view)
    }
}

extension TestViewController: MovieDataSource {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(at section: Int) -> Int {
        return 10
    }
    
    func configure(cell: MovieDataCell, atIndex indexPath: IndexPath) {
        cell.movieTitleLabel.text = String(indexPath.row)
    }
}

extension UIView {
    func addConstraints(toFillSuperView superView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-(0)-[subview]-(0)-|",
                                                                options: NSLayoutFormatOptions(rawValue:0),
                                                                metrics: nil,
                                                                views: ["subview" : self]))
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[subview]-(0)-|",
                                                                options: NSLayoutFormatOptions(rawValue:0),
                                                                metrics: nil,
                                                                views: ["subview" : self]))
    }
}
