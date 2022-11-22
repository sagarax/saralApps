//
//  JSONHelper.swift
//  YYCTraffic
//
//  Created by Sagar Haval on 2022-11-20.
//

import Foundation

class JSONHelper {
    static func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    static func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
    
    /*static func parse(jsonData: Data) -> [IntersectionCamera] {
        do {
            let decodedData = try JSONDecoder().decode([IntersectionCamera].self,
                                                       from: jsonData)
            
            return decodedData
        } catch {
            print("decode error")
        }
    }*/
}
