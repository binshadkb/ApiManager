//
//  PayloadParser.swift
//  ApiParser
//
//  Created by Binshad on 12/11/18.
//  Copyright © 2018 Binshad. All rights reserved.
//

import Foundation

class PayloadParser {
    
    
    func payload<T: Decodable>(from data: Data?, decodingType: T.Type) throws -> Decodable {
        
        guard let responseData = data else {
            throw APIError.invalidData
        }
        
        var _response: Dictionary<String, Any>?
        
        do {
            _response = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? Dictionary<String, Any>
        }
        catch {
            throw APIError.jsonParsingFailure
        }
        
        guard let response = _response, let result = response["result"] as? Bool, (response["payload"] != nil || response["message"] != nil) else {
            
            throw APIError.invalidData
        }
        
        if result {
            do {
                
                
//                if let array = response["payload"] as? NSArray {
//
//                    let jsonObject: [String: Any] = ["results": array]
//
//                    let payload = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
//                    return try JSONDecoder().decode(decodingType, from: payload)
//                }
//                else {
                    let payload = try JSONSerialization.data(withJSONObject: response["payload"]!, options: .prettyPrinted)
                    return try JSONDecoder().decode(decodingType, from: payload)
//                }
            }
            catch {
                throw APIError.jsonParsingFailure
            }
        }
        else {
            let error = APIError.runtimeError(response["message"] as! String)
            throw error
        }
    }
}
