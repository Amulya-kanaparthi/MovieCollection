//
//  MovieManager.swift
//  MovieCollection
//
//  Created by user235836 on 5/6/23.
//

import Foundation
import Alamofire
import SwiftyJSON

struct MovieManager {
    let headers: HTTPHeaders = [
        "X-RapidAPI-Key": "d6e2ab02ffmshfada9ca5c947cd1p1f15e7jsn6c6e3d625cbb",
        "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
    ]
    let params : [String:Any] = ["limit":"50",
                                 "endYear":"2022",
                                 "startYear":"2020",
                                 "genre":"Action" ]
    
    
    func response(){
        Alamofire.request("https://moviesdatabase.p.rapidapi.com/titles/x/upcoming",method: .get, parameters: params, headers: headers).responseJSON { (response) in
            if response.result.isSuccess{
                let JSONdata = JSON(response.result.value!)
                let resultArray = JSONdata["results"].arrayValue
                
                var title = []
                var image = []
                var releasedYear = []
                var series = []
                var episode = []
                
                
                for results in resultArray{
                    title.append(results["titleText"]["text"])
                    image.append(results["primaryImage"]["url"])
                    releasedYear.append(results["releaseYear"]["year"])
                    series.append(results["titleType"]["isSeries"])
                    episode.append(results["titleType"]["isEpisode"])
                }
                
            }
            
        }
        
    }
}
