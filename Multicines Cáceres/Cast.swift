//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on June 23, 2019

import Foundation


class Cast : NSObject, NSCoding{
    
    var image : String!
    var name : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        image = dictionary["image"] as? String
        name = dictionary["name"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if image != nil{
            dictionary["image"] = image
        }
        if name != nil{
            dictionary["name"] = name
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        image = aDecoder.decodeObject(forKey: "image") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
    }
}
