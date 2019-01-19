//
//  Response.swift
//  CarSample
//
//  Created by Admin on 1/17/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation

public enum ResponseError: Error {
    case nilData
    case decodeError
}

//MARK: -

struct Response: Codable {
    
    let page: Int
    let pageSize: Int
    let totalPageCount: Int
    let data: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case data = "wkda"
        case page, pageSize, totalPageCount
    }
    
}


//MARK: -
enum APIResponse<T> where T: Codable {
    
    case value(_ : T)
    case error(_: Int?,_: Error?, _ :Data?)
    

    
    init(_ response: (r: HTTPURLResponse?, data: Data?, error: Error?)) {
        
        guard (response.r?.statusCode == 200 || response.r?.statusCode == 201), response.error == nil else {
            
            self = .error(response.r?.statusCode, response.error, response.data)
            return
        }
        
        guard let data = response.data else {
            self = .error(response.r?.statusCode, ResponseError.nilData, nil)
            return
        }
        
        
        do {
            let decoder = JSONDecoder()
            self = .value(try decoder.decode(T.self, from: data))
        } catch let decodeError {
            print(decodeError)
            self = .error(response.r?.statusCode, ResponseError.decodeError, nil)
        }
        
        
    }
    
}
