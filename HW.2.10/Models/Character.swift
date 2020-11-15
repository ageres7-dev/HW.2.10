//
//  character.swift
//  HW.2.10
//
//  Created by Сергей on 14.11.2020.
//
struct Character: Decodable {
    var results: [Results]
    
}

struct Results: Decodable {
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
}
//
struct Origin: Decodable {
    let name: String
}

struct Location: Decodable {
    let name: String
}
