//
//  File.swift
//  Tech-M-Test1
//
//  Created by Apps on 26/07/20.
//  Copyright © 2020 Vikramaditya. All rights reserved.
//


import Foundation

class ViewModel {
    
    var factApiService = FactApiServices()
    
    var factModel : FactsModel?
    
    func getTitle() -> String? {
        return factModel?.title
    }
    
    func getfactsFromApi(success: @escaping(_ facts:FactsModel)->Void) {
        
        factApiService.getFacts(success: { (factModel) in
            self.factModel = factModel
            success(factModel)
        }) { (error) in
            
        }
    }
    
    
}
