//
//  Deal.swift
//  gameDeals
//
//  Created by Furkan Erzurumlu on 4.10.2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let deal = try? newJSONDecoder().decode(Deal.self, from: jsonData)

import Foundation

// MARK: - DealElement
struct Deals: Codable {
    let data: [DealElement]
}

struct DealElement: Codable {
    let internalName, title: String
    let metacriticLink: String?
    let dealID, storeID, gameID, salePrice: String
    let normalPrice, isOnSale, savings, metacriticScore: String
    let steamRatingText: SteamRatingText?
    let steamRatingPercent, steamRatingCount, steamAppID: String
    let releaseDate, lastChange: Int
    let dealRating: String
    let thumb: String
}

enum SteamRatingText: String, Codable {
    case mixed = "Mixed"
    case mostlyNegative = "Mostly Negative"
    case mostlyPositive = "Mostly Positive"
    case overwhelminglyPositive = "Overwhelmingly Positive"
    case positive = "Positive"
    case veryPositive = "Very Positive"
}

typealias Deal = [DealElement]
