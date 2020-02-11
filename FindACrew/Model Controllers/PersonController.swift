//
//  PersonController.swift
//  FindACrew
//
//  Created by scott harris on 2/11/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import Foundation

class PersonController {
    let baseURL = URL(string: "https://swapi.co/api/people")!
    
    var people: [Person] = []
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
        
    }
    
    func searchForPeopleWith(searchTerm: String, completion: @escaping () -> Void) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [searchTermQueryItem]
        
        guard let requestURL = urlComponents?.url else {
            print("Request URL is nil")
            completion()
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error fething data: \(error)")
                return
            }
            
            guard let data = data else {
                NSLog("No data returned from data task.")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let personSearch = try jsonDecoder.decode(PersonSearch.self, from: data)
                self.people.append(contentsOf: personSearch.results)
                
            } catch {
                NSLog("Unable to decode data into object of type [Person]: \(error)")
            }
            completion()
            
        }
        
        dataTask.resume()
        
    }
    
}
