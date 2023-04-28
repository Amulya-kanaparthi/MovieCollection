//
//  MovieViewController.swift
//  MovieCollection
//
//  Created by user235836 on 5/8/23.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class MovieViewController: UIViewController {

    @IBOutlet var myTableView: UITableView!
    
    
    var limit : String =  ""
    var endYear : String =  ""
    var startYear : String =  ""
    var genre : String =  ""
   
    var resultArray : [JSON] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        response(limit: limit, endYear: endYear, startYear: startYear, genre: genre)
     }
    
    func response(limit : String , endYear : String, startYear : String, genre:String){
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key": "d6e2ab02ffmshfada9ca5c947cd1p1f15e7jsn6c6e3d625cbb",
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        ]

        let params : [String:Any] = ["limit":"\(limit)",
                                     "endYear":"\(endYear)",
                                     "startYear":"\(startYear)",
                                     "genre":"\(genre)" ]
        
        Alamofire.request("https://moviesdatabase.p.rapidapi.com/titles/x/upcoming",method: .get, parameters: params, headers: headers).responseJSON { (response) in
            if response.result.isSuccess{
                let JSONdata = JSON(response.result.value!)

                let movieArray = JSONdata["results"].arrayValue
                self.resultArray = movieArray
                print(self.resultArray.count)
                self.myTableView.reloadData()
            }
            else{
                print("error in getting data")
            }
        }
    }
    
}
extension MovieViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        
        cell.movieTitle.text = resultArray[indexPath.row]["titleText"]["text"].stringValue
        cell.releasedYear.text = resultArray[indexPath.row]["releaseYear"]["year"].stringValue
        
        if resultArray[indexPath.row]["titleType"]["isSeries"].boolValue {
            cell.seriesSwitch.isOn = true
        }else{
            cell.seriesSwitch.isOn = false
        }
        
        if resultArray[indexPath.row]["titleType"]["isEpisode"].boolValue {
            cell.episodeSwitch.isOn = true
        }else{
            cell.episodeSwitch.isOn = false
        }
        
        let urlImage = resultArray[indexPath.row]["primaryImage"]["url"].stringValue
        
        Alamofire.request(urlImage).responseImage { (response) in
            if let image = response.result.value
            {
                DispatchQueue.main.async {
                    cell.moviePoster.image = image
                }
            }
        }
        
        return cell
    }
    
    
}
