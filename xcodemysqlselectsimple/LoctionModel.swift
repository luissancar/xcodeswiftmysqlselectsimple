
//
//  LocationModel.swift
//  xcodemysql
//
//  Created by Luis José Sánchez Carrasco on 2/1/18.
//  Copyright © 2018 Luis José Sánchez Carrasco. All rights reserved.
//
import Foundation


class LocationModel: NSObject {
    
    //properties
    
    var cod: String?
    var cosa: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(cod: String, cosa: String) {
        
        self.cod = cod
        self.cosa = cosa
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "cod: \(cod), cosa: \(cosa)"
        
    }
    
    
}
