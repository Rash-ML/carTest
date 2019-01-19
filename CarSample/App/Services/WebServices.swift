//
//  WebServices.swift
//  CarSample
//
//  Created by Admin on 1/17/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import Foundation


func dispatchRequest<T: Codable>(responseType: T.Type,
                                 request: URLRequest,
                                 _ callBack: @escaping (APIResponse<T>) -> ()) {
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request , completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print("API Error: \(error?.localizedDescription ?? "")")
        }
        guard let httpResponse = response as? HTTPURLResponse else { return }
        print("Status Code: \(httpResponse.statusCode)")
        
        let apiresponse = APIResponse<T>((r: httpResponse,data: data, error: error))
        callBack(apiresponse)
        
    })
    
    dataTask.resume()
    
}

//MARK: - WEB SERVICES
func getManufacteres(page: Int, pageSize: Int,
                     _ callBack: @escaping ([Manufacture]) -> (),
                     _ failed: @escaping (Error?) -> ()) {
    
    guard let request = Route.getManufactures(page: page, pageSize: pageSize).asURLRequest() else { return }
    dispatchRequest(responseType: Response.self,request: request) {  apiResponse in
        switch apiResponse {
        case .value(let response):
            
            
            var manufactures: [Manufacture] = []
            manufactures = response.data.compactMap({
                let manufacture = Manufacture(id: $0.key,name: $0.value)
                return manufacture
            })
            
            callBack(manufactures)
            
            break
        case .error(_, let error, _):
            failed(error)
            break
        }
    }
    
}
