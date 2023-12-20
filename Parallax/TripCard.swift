//
//  TripCard.swift
//  Parallax
//
//  Created by Prathamesh on 19/12/23.
//

import Foundation
import SwiftUI

//Trip Card Model
struct TripCard: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var image: String
    
}
    
    var tripCards: [TripCard] = [.init(title: "Mumbai", subTitle: "India", image: "Pic 3"),
                                 .init(title: "New York", subTitle: "USA", image: "Pic 2"),
                                 .init(title:"London", subTitle:"England", image: "Pic 1"),
                                 .init(title:"Alaska", subTitle:"USA", image: "Pic 5"),
                                 .init(title:"Paris", subTitle:"France", image: "Pic 4")
                                 
                                ]

