//
//  MovieData.swift
//  MovieCollection
//
//  Created by user235836 on 5/3/23.
//

import Foundation

struct MovieData : Codable{
    let results : [Results]
}

struct  Results : Codable{
    let primaryImage : PrimaryImage
    let titileType : titleType
    let titleText : titleText
    let releaseYear : releaseYear
}
struct PrimaryImage : Codable{
    let url : URL
}
struct titleType : Codable{
    let isSeries : Bool
    let isEpisode : Bool
}
struct titleText : Codable{
    let text : String
}
struct releaseYear : Codable{
    let year : Date
}

