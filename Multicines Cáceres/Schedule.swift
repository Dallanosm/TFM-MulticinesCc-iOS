//
//  Created on June 22, 2019

import Foundation


class Schedule : NSObject, NSCoding{
    
    var paymentUrl : String!
    var price : String!
    var time : String!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        paymentUrl = dictionary["paymentUrl"] as? String
        price = dictionary["price"] as? String
        time = dictionary["time"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if paymentUrl != nil{
            dictionary["paymentUrl"] = paymentUrl
        }
        if price != nil{
            dictionary["price"] = price
        }
        if time != nil{
            dictionary["time"] = time
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        paymentUrl = aDecoder.decodeObject(forKey: "paymentUrl") as? String
        price = aDecoder.decodeObject(forKey: "price") as? String
        time = aDecoder.decodeObject(forKey: "time") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if paymentUrl != nil{
            aCoder.encode(paymentUrl, forKey: "paymentUrl")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if time != nil{
            aCoder.encode(time, forKey: "time")
        }
    }
}
