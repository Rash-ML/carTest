//
//  APIController.swift
//  CarSample
//
//  Created by Admin on 1/17/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation

enum APIURLError: Error {
    
    case badUrlPath
    
}

//MARK: -
struct APIController {
    
    let route: Route
    var urlcomponents = URLComponents()
    
    init(route: Route) {
        self.route = route
        urlcomponents.scheme = "http"
        urlcomponents.host = "api-aws-eu-qa-1.auto1-test.com"
        urlcomponents.path = route.path
    }
    
    mutating func createUrl() throws -> URL {
        
        
        let deafultKeyQueryItem = URLQueryItem(name: "wa_key", value: "coding-puzzle-client-449cc9d")
        
        
        switch route {
        case .getManufactures(let page,let pageSize):
            
            let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
            let pageSizeQueryItem = URLQueryItem(name: "pageSize", value: "\(pageSize)")
            self.urlcomponents.queryItems = [pageQueryItem,pageSizeQueryItem,deafultKeyQueryItem]
            
            break
        }
        
        guard let url = urlcomponents.url else { throw APIURLError.badUrlPath }
        return url
    }
    
}
