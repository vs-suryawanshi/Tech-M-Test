//
//  RowModel.swift
//  Tech-M-Test1
//
//  Created by Apps on 26/07/20.
//  Copyright © 2020 Vikramaditya. All rights reserved.
//

import Foundation

class RowModel {

    var title : String?
    var description : String?
    var imageHref : String?
    init(data : [String : Any]) {
        self.title = data["title"] as? String
        self.description = data["description"] as? String
        self.imageHref = data["imageHref"] as? String
    }
}
