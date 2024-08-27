//
//  Service.swift
//  CataasExample
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import Foundation

struct Service: ServiceProtocol {
    
    func fetch<T: Decodable>(_ type: T.Type, completion: @escaping(Result<T,ServiceError>) -> Void) {
        guard let url = URL(string: Constants.ENDPOINT.url) else {
            let error = ServiceError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if error is URLError {
                completion(Result.failure(ServiceError.generic))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(ServiceError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                    
                }catch {
                    completion(Result.failure(ServiceError.parsing(error as? DecodingError)))
                }

            }
        }

        task.resume()
    }
    
    func getBreeds(completion: @escaping(Result<[Breed], ServiceError>) -> Void) {
        guard let url = URL(string: Constants.ENDPOINT.url) else {
            let error = ServiceError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if error is URLError {
                completion(Result.failure(ServiceError.generic))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(ServiceError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let breeds = try decoder.decode([Breed].self, from: data)
                    completion(Result.success(breeds))
                    
                }catch {
                    completion(Result.failure(ServiceError.parsing(error as? DecodingError)))
                }
                
                
            }
        }

        task.resume()
    }
}
