//
//  APIService.swift
//  Tech-M-Test1
//
//  Created by Apps on 26/07/20.
//  Copyright © 2020 Vikramaditya. All rights reserved.
//

import Foundation
class APIService {
    static let sharedInstance = APIService()
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    
    func  get(url :String, parameters: [String: AnyObject]?, success: @escaping(_ json: [String : Any])->Void) {
        
        dataTask?.cancel()
        if var urlComponents = URLComponents(string: url) {
            guard let url = urlComponents.url else {
                return
            }
            dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
                defer {
                    self?.dataTask = nil
                }
                if let error = error {
                    //self?.errorMessage += "DataTask error: " +
                    error.localizedDescription + "\n"
                } else if
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    DispatchQueue.main.async {
                        if let data = data {
                            if let stringData = String(data: data, encoding: String.Encoding.ascii) {
                                if let jsonData = stringData.data(using: String.Encoding.utf8) {
                                    do {
                                        let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
                                        success(json)
                                    
                                        
                                    } catch {
                                        NSLog("ERROR \(error.localizedDescription)")
                                    }
                                }
                            }
                        }
                    }
                }
            }
            // 7
            dataTask?.resume()
        }
        
    }
}
