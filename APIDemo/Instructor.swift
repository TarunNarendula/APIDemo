//
//  Instructor.swift
//  APIDemo
//
//  Created by Atirek Sharma on 26/04/18.
//  Copyright © 2018 Atirek Sharma. All rights reserved.
//

import Foundation
import ObjectMapper

class Instructor: Mappable{
  //  var status: Int?
  //var message: String?
    var object: Data?
    var array:[Data]?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
       // status <- map["status"]
        //message <- map["message"]
        object <- map["data"]
        array <- map["data"]
    }
}
class Data: Mappable{
    
    var app : AppVersionData?
    var auth: String?
    var booking:[BookingData]?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        
        app <- map["app_version_data"]
        booking <- map["booking"]
        auth <- map["authToken"]
    }
    }
class AppVersionData: Mappable{
    
    var id:String?
    var AppType:String?
    var LatestIOSVersion :String?
    var bookingiteminfo : Booking_item_info?
    
    required init?(map: Map){
    }
    
    func mapping(map:Map) {
        id <- map["_id"]
        AppType <- map["appType"]
        LatestIOSVersion <- map["latestIOSVersion"]
        bookingiteminfo <- map["booking_item_info"]
    }
}

class BookingData:Mappable {
    
    var booking_item_info:Booking_item_info?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        booking_item_info <- map["booking_item_info"]
    }
}

    class Booking_item_info:Mappable {
   
    var gig_id : String?
    var gig_name:String?
    var service_name:String?
    var service_id:String?
    
    required init?(map: Map) {
    }
    func mapping(map:Map) {
        gig_id <- map["gig_id"]
        gig_name <- map["gig_name"]
        service_name <- map["service_name"]
        service_id <- map["service_id"]
    }
}

