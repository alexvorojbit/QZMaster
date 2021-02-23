//
//  TodayVCNetworkManager.swift
//  FitMom
//
//  Created by Alexandru Vorojbit on 7/30/20.
//  Copyright © 2020 Alexandru Vorojbit. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let takeQuizVCJSON = "https://fitmomproject-jsonfiles.s3.us-east-2.amazonaws.com/today_vc.json"
    private let quizBusinessDetailsJSON = "https://fitmomproject-jsonfiles.s3.us-east-2.amazonaws.com/business.json"
    private let quizEntertainmentDetailsJSON = "https://fitmomproject-jsonfiles.s3.us-east-2.amazonaws.com/entertainment.json"
    
    func getTakeQuizVCData(completion: @escaping (Result<[Section], ErrorMessage>) -> Void) {
        
        guard let url = URL(string: takeQuizVCJSON) else {
            completion(.failure(.unableToDownload))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completion(.failure(.unableToDownload))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let sections = try decoder.decode([Section].self, from: data)
                completion(.success(sections))
                print(sections)
            } catch {
                completion(.failure(.invalidData))
            }
            
        }.resume()
    }
    
//    func getQuizBusinessDetailsData(completion: @escaping (Result<[ItemDetails], ErrorMessage>) -> Void) {
//        
//        guard let url = URL(string: quizBusinessDetailsJSON) else {
//            completion(.failure(.unableToDownload))
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            
//            if let _ = error {
//                completion(.failure(.unableToDownload))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let foodAndDrink = try decoder.decode([ItemDetails].self, from: data)
//                completion(.success(foodAndDrink))
//                print(foodAndDrink)
//            } catch {
//                completion(.failure(.invalidData))
//            }
//            
//        }.resume()
//    }
//    
//    
//    func getQuizEntertainmentDetailsData(completion: @escaping (Result<[ItemDetails], ErrorMessage>) -> Void) {
//        
//        guard let url = URL(string: quizEntertainmentDetailsJSON) else {
//            completion(.failure(.unableToDownload))
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            
//            if let _ = error {
//                completion(.failure(.unableToDownload))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let foodAndDrink = try decoder.decode([ItemDetails].self, from: data)
//                completion(.success(foodAndDrink))
//                print(foodAndDrink)
//            } catch {
//                completion(.failure(.invalidData))
//            }
//            
//        }.resume()
//    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                // success
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
    
}

