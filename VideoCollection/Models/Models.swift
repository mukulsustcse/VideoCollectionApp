//
//  Models.swift
//  VideoCollection
//
//  Created by M. A. Alim Mukul on 19.09.22.
//

import Foundation

class Models :  Identifiable, Decodable {
    
    var uid:UUID?
    var id:Int
    var title:String
    var url:String
}
