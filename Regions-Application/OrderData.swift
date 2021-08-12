//
//  OrderData.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 11.08.2021.
//

import Foundation

public struct OrderData: Codable {
    public let vehicleType: String?
    public let vehicleWeight: String?
    public let manualWeight: String?
    public let matter: String
    public let dimension: String?
    public let insurance: String?
    
    
    public init(
        vehicleType: String?,
        vehicleWeight: String?,
        manualWeight: String?,
        matter: String,
        dimension: String?,
        insurance: String?
    ) {
        self.vehicleType = vehicleType
        self.vehicleWeight = vehicleWeight
        self.manualWeight = manualWeight
        self.matter = matter
        self.dimension = dimension
        self.insurance = insurance
    }
}
