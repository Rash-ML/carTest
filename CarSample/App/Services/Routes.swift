//
//  Routes.swift
//  CarSample
//
//  Created by Admin on 1/17/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation

var baseURL: String = "http://api-aws-eu-qa-1.auto1-test.com"

//MARK: - Router
enum HTTPMethod: String
{
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

//MARK: -
enum Route {
    
    case getManufactures(page: Int, pageSize: Int)
    
    var method: HTTPMethod {
        switch self {
        case .getManufactures(_,_):
            return .get
        }
    }
    
    var  path: String {
        
        switch self {
        case .getManufactures(_,_):
            return "/v1/car-types/manufacturer"
        }
    }
    
    
    //MARK: -
    func asURLRequest() -> URLRequest? {
        
        do {
         
            var apicontroller = APIController(route: self)
            let url = try apicontroller.createUrl()
            let urlRequest = URLRequest(url: url)
            
            switch self {
                //set body if needed
            case .getManufactures(_, _):
                break
            }
            
            return urlRequest
            
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
}
