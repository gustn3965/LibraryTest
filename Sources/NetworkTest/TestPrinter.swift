//
//  TestPrinter.swift
//  NetworkTest
//
//  Created by 박현수 on 9/13/24.
//

import Foundation
import Alamofire

public struct TestPrinter {
    
    public init() {} 
    
    public func getNumberString() async -> String {
        return await withCheckedContinuation { continuation in
            AF.request(URL(string:"http://numbersapi.com/5")!).response { response in
                switch response.result {
                case .success(let data):
                    continuation.resume(returning: String(data: data!, encoding: .utf8)!)
                case .failure(_):
                    print()
                    continuation.resume(returning: "failed.......")
                }
                
            }
        }
    }
}
