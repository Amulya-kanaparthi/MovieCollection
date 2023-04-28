//
//  MovieManager.swift
//  MovieCollection
//
//  Created by user235836 on 5/2/23.
//

import Foundation

struct MovieManager{
    
    
    
    
    func fetchMovieData(genre : String,limit : String,startYear : String,endYear : String){
        let urlString = "\(movieURL)genre=\(genre)&limit=\(limit)&startYear=\(startYear)&endYear=\(endYear)&key=\(key)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String){
        //1.Create URL
        if let url = URL(string: urlString){
            //2. Create URLSession
            let session = URLSession(configuration: .default)
            //3.Give the session a Task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print (error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(movieData: safeData)
                }
            }
                task.resume()
            }
        }
        
        func parseJSON(movieData : Data){
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(MovieData.self, from: movieData)
                print(decodedData)
            }catch{
                print(error)
            }
        }
    }

