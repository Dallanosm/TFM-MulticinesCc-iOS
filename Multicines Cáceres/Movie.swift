//
//  Created on June 22, 2019

import Foundation

class Movie : NSObject, NSCoding{
    
    var classification : String!
    var id : String!
    var img : String!
    var schedule : [Schedule]!
    var title : String!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(dictionary: [String:Any]){
        classification = dictionary["classification"] as? String
        id = dictionary["id"] as? String
        img = dictionary["img"] as? String
        title = dictionary["title"] as? String
        schedule = [Schedule]()
        if let scheduleArray = dictionary["schedule"] as? [[String:Any]]{
            for dic in scheduleArray{
                let value = Schedule(fromDictionary: dic)
                schedule.append(value)
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
        if id != nil{
            dictionary["id"] = id
        }
        if img != nil{
            dictionary["img"] = img
        }
        if title != nil{
            dictionary["title"] = title
        }
        if schedule != nil{
            var dictionaryElements = [[String:Any]]()
            for scheduleElement in schedule {
                dictionaryElements.append(scheduleElement.toDictionary())
            }
            dictionary["schedule"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        classification = aDecoder.decodeObject(forKey: "classification") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        img = aDecoder.decodeObject(forKey: "img") as? String
        schedule = aDecoder.decodeObject(forKey: "schedule") as? [Schedule]
        title = aDecoder.decodeObject(forKey: "title") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if classification != nil{
            aCoder.encode(classification, forKey: "classification")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if img != nil{
            aCoder.encode(img, forKey: "img")
        }
        if schedule != nil{
            aCoder.encode(schedule, forKey: "schedule")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
    }
    
}
