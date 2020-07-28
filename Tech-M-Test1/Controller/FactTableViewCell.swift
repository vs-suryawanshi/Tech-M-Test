//
//  FactTableViewCell.swift
//  Tech-M-Test1
//
//  Created by Apps on 26/07/20.
//  Copyright © 2020 Vikramaditya. All rights reserved.
//

import UIKit

class FactTableViewCell: UITableViewCell {
    
       let titleLabel = UILabel()
       let detailLabel = UILabel()
       let image_View = UIImageView()

       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)


           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           detailLabel.translatesAutoresizingMaskIntoConstraints = false
           image_View.translatesAutoresizingMaskIntoConstraints = false

           contentView.addSubview(titleLabel)
           contentView.addSubview(detailLabel)
           contentView.addSubview(image_View)
        
           titleLabel.numberOfLines = 0
           detailLabel.numberOfLines = 0
        
           titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 18)

           let viewsDict = [
               "image" : image_View,
               "name" : titleLabel,
               "detail" : detailLabel,
               ] as [String : Any]
          
         contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[name]-[detail]-[image]-|", options: [], metrics: nil, views: viewsDict))
         contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[name]-|", options: [], metrics: nil, views: viewsDict))
         contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[detail]-|", options: [], metrics: nil, views: viewsDict))
         contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image]-|", options: [], metrics: nil, views: viewsDict))
        
       }

       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
