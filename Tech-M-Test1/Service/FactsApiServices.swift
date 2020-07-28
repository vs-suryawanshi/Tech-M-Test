//
//  FactsApiServices.swift
//  Tech-M-Test1
//
//  Created by Apps on 26/07/20.
//  Copyright © 2020 Vikramaditya. All rights reserved.
//

import Foundation
struct FactApiServices {
    
    static let sharedInstance = FactApiServices()
    let apiService = APIService.sharedInstance
    
    func getFacts(success: @escaping(_ facts:FactsModel)->Void, failure: @escaping(_ error:String)->Void) {
        
        let apiURL = APIConstants.getFactsUrl
        apiService.get(url: apiURL, parameters: nil) { (successData) in
        
            let factModel = FactsModel.init(data: successData)
            success(factModel)
        }
    }
}
