//
//  Data.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-18.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

let tabs = [
    Page(image: "mo", title: "Search for objects around the city", text: "Scroll through nearby objects or go to Objects window to find all objects in the city."),
    Page(image: "mo", title: "Find objects in maps", text: "To find an object in a map, go to Map window and browse manually, or open an object you like from Objects window and tap 'Find in Maps'."),
    Page(image: "mo", title: "Get directions to objects", text: "To get directions to selected object, go to Objects window and tap on 'Directions'. You'll be redirected to your standard maps app with directions."),
    Page(image: "mo", title: "Scan objects for instant information", text: "Open Camera window and point rear camera to an object. You'll get instant information about the object when you're not further at a right distance from the object. Tap on the 3D title to get to object information window."),
    Page(image: "mo", title: "Take virtual excursions in museums", text: "In object information window tap on 'Virtual excursion' button to start a guided tour in a museum. You'll be shown virtual directions to the objects. Get closer to the marked object to get object title.")
]

struct Page {
    let image: String
    let title: String
    let text: String
}
