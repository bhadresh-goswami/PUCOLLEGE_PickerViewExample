//
//  ViewController.swift
//  multiplecomponentInPickerview
//
//  Created by COE-18 on 29/08/19.
//  Copyright © 2019 COE-18. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    //step1
    var CountryList = [CountryClass]()
    var StateList = [StateClass]()
    var CityList = [CityClass]()
    
    //step2
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        //step 4
        if component == 0 {
            return CountryList.count
        }
        //step 4 is end
            
        else if component == 1{
            return selectedStates.count
        }
        
        //step 11
        else if component == 2{
            return selectedCity.count
        }
        //step 11
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //step 5
        if component == 0{
            return CountryList[row].CountryName
        }
        //step 5 end
        else if component == 1{
            return selectedStates[row].StateName
        }
        //step 13
        else if component == 2{
            return selectedCity[row].CityName
        }
        //step 13
        return ""
    }
    
    //step 7
    var selectedStates = [StateClass]()
    //end step 7
    
    //step 10
    var selectedCity = [CityClass]()
    //end step 10
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //step 8
        if component == 0{
            
            selectedStates = StateList.filter({ (stateObj) -> Bool in
                if stateObj.RefCountryId == CountryList[row].CountryId{
                    return true
                }
                return false
            })
            pickerView.reloadComponent(1)
        }
        //end step 8
            
            //step 12
        else if component == 1{
            selectedCity = CityList.filter({ (cityObj) -> Bool in
                if cityObj.RefStateId == selectedStates[row].StateId{
                    return true
                }
                
                return false
            })
            
            pickerView.reloadComponent(2)
        }
        //end step 12
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //step 3
        var country = CountryClass()
        country.CountryId = 1
        country.CountryName = "Country _ 1"
        CountryList.append(country)
        
        country.CountryId = 2
        country.CountryName = "Country _ 2"
        CountryList.append(country)
        //end step 3
        
        //step 6
        var state = StateClass()
        state.RefCountryId = 1
        state.StateId = 1
        state.StateName = "State _ 1"
        StateList.append(state)
        
        state.RefCountryId = 2
        state.StateId = 2
        state.StateName = "State _ 2"
        StateList.append(state)
        //end step 6
        
        
        //step 9
        var city = CityClass()
        city.RefStateId = 1
        city.CityId = 1
        city.CityName = "City _ 1"
        CityList.append(city)
        
        city.CityId = 2
        city.RefStateId = 2
        city.CityName = "City _ 2"
        CityList.append(city)
        //end step 9
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

