//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on June 23, 2019

import Foundation


class MovieDetails : NSObject, NSCoding{
    
    var cast : [Cast]!
    var classification : String!
    var country : String!
    var director : String!
    var duration : String!
    var image : String!
    var releaseDate : String!
    var sinopsis : String!
    var tickets : [Schedule]!
    var title : String!
    var trailer : String!
    var year : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        classification = dictionary["classification"] as? String
        country = dictionary["country"] as? String
        director = dictionary["director"] as? String
        duration = dictionary["duration"] as? String
        image = dictionary["image"] as? String
        releaseDate = dictionary["releaseDate"] as? String
        sinopsis = dictionary["sinopsis"] as? String
        title = dictionary["title"] as? String
        trailer = dictionary["trailer"] as? String
        year = dictionary["year"] as? String
        cast = [Cast]()
        if let castArray = dictionary["cast"] as? [[String:Any]]{
            for dic in castArray{
                let value = Cast(fromDictionary: dic)
                cast.append(value)
            }
        }
        tickets = [Schedule]()
        if let ticketsArray = dictionary["tickets"] as? [[String:Any]]{
            for dic in ticketsArray{
                let value = Schedule(fromDictionary: dic)
                tickets.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if classification != nil{
            dictionary["classification"] = classification
        }
        if country != nil{
            dictionary["country"] = country
        }
        if director != nil{
            dictionary["director"] = director
        }
        if duration != nil{
            dictionary["duration"] = duration
        }
        if image != nil{
            dictionary["image"] = image
        }
        if releaseDate != nil{
            dictionary["releaseDate"] = releaseDate
        }
        if sinopsis != nil{
            dictionary["sinopsis"] = sinopsis
        }
        if title != nil{
            dictionary["title"] = title
        }
        if trailer != nil{
            dictionary["trailer"] = trailer
        }
        if year != nil{
            dictionary["year"] = year
        }
        if cast != nil{
            var dictionaryElements = [[String:Any]]()
            for castElement in cast {
                dictionaryElements.append(castElement.toDictionary())
            }
            dictionary["cast"] = dictionaryElements
        }
        if tickets != nil{
            var dictionaryElements = [[String:Any]]()
            for ticketsElement in tickets {
                dictionaryElements.append(ticketsElement.toDictionary())
            }
            dictionary["tickets"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        cast = aDecoder.decodeObject(forKey: "cast") as? [Cast]
        classification = aDecoder.decodeObject(forKey: "classification") as? String
        country = aDecoder.decodeObject(forKey: "country") as? String
        director = aDecoder.decodeObject(forKey: "director") as? String
        duration = aDecoder.decodeObject(forKey: "duration") as? String
        image = aDecoder.decodeObject(forKey: "image") as? String
        releaseDate = aDecoder.decodeObject(forKey: "releaseDate") as? String
        sinopsis = aDecoder.decodeObject(forKey: "sinopsis") as? String
        tickets = aDecoder.decodeObject(forKey: "tickets") as? [Schedule]
        title = aDecoder.decodeObject(forKey: "title") as? String
        trailer = aDecoder.decodeObject(forKey: "trailer") as? String
        year = aDecoder.decodeObject(forKey: "year") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if cast != nil{
            aCoder.encode(cast, forKey: "cast")
        }
        if classification != nil{
            aCoder.encode(classification, forKey: "classification")
        }
        if country != nil{
            aCoder.encode(country, forKey: "country")
        }
        if director != nil{
            aCoder.encode(director, forKey: "director")
        }
        if duration != nil{
            aCoder.encode(duration, forKey: "duration")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if releaseDate != nil{
            aCoder.encode(releaseDate, forKey: "releaseDate")
        }
        if sinopsis != nil{
            aCoder.encode(sinopsis, forKey: "sinopsis")
        }
        if tickets != nil{
            aCoder.encode(tickets, forKey: "tickets")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if trailer != nil{
            aCoder.encode(trailer, forKey: "trailer")
        }
        if year != nil{
            aCoder.encode(year, forKey: "year")
        }
    }
}
