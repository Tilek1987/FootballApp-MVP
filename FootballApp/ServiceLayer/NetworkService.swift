//
//  NetworkService.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func perform<T: Decodable>(_ request: Router, completion: @escaping ((Result<T,Error>) -> Void))
}

class NetworkService: NetworkServiceProtocol {
    
    var logger = Logger()
    var dataTask: URLSessionDataTask?
    var session: URLSession {
        return URLSession(configuration: .default)
    }
  
    func perform<T: Decodable>(_ router: Router, completion: @escaping ((Result<T, Error>) -> Void)) {
        
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        if !router.queryParams.isEmpty {
            components.queryItems = router.queryParams.map { URLQueryItem(name: $0, value: $1) }
        }
        
        guard let url = components.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = router.headers
        request.httpMethod = router.requestMethod.rawValue
        logger.log(request: request)
        
        dataTask = session.dataTask(with: request) { (data, response, error) in
            self.logger.log(data: data, response: response as? HTTPURLResponse, error: error)
            if let error = error {
                print(error)
                completion(.failure(error))
                return
            }
            
            guard let data = data, response != nil else {
                return
            }
            
            let responseObject = try? JSONDecoder().decode(T.self, from: data)
            
            DispatchQueue.main.async {
                completion(.success(responseObject!))
            }
        }
        dataTask?.resume()
    }
}
