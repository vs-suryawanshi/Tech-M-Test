//
//  FactsModel.swift
//  Tech-M-Test1
//
//  Created by Apps on 26/07/20.
//  Copyright © 2020 Vikramaditya. All rights reserved.
//

import Foundation

class FactsModel {
    
    var title : String?
    var rows = [RowModel]()
    required init(data : [String : Any]) {
        
        self.title = data["title"] as? String
        if let rows = data["rows"] as? [[String: Any]] {
            for row in rows {
                let rowModel = RowModel.init(data: row)
                self.rows.append(rowModel)
            }
        }
    }
}


