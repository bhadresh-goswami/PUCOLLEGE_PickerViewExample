//
//  LocationClass.swift
//  multiplecomponentInPickerview
//
//  Created by COE-18 on 29/08/19.
//  Copyright © 2019 COE-18. All rights reserved.
//

import UIKit

class LocationClass: NSObject {

}

struct CountryClass {
    var CountryId:Int?
    var CountryName:String?
}
struct StateClass {
    var StateId:Int?
    var StateName:String?
    var RefCountryId:Int?
}
struct CityClass {
    var CityId:Int?
    var CityName:String?
    var RefStateId:Int?
    
}
