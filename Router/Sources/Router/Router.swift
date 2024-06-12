//
//
//  CharactersCoordinator.swift
//  RickAndMortyMVVMC
//
//  Created by Enrique P. Ortiz.
//  Linkedin: https://www.linkedin.com/in/enrique-poyato-ortiz-%EF%A3%BF-7447b3200/
//  Copyright © 2024 Enrique P. Ortiz. All rights reserved.
//
import SwiftUI

public class AnyIdentifiable: Identifiable {

    public let destination: any Identifiable

    public init(destination: any Identifiable) {
        self.destination = destination
    }
}

@Observable
public  final class Router {
    public var navPath = NavigationPath()
    public var presentedSheet: AnyIdentifiable?

    public init() {}

    public func presentSheet(destination: any Identifiable) {
        presentedSheet = AnyIdentifiable(destination: destination)
    }

    public func navigate(to destination: any Hashable) {
        navPath.append(destination)
    }

    public func navigateBack() {
        navPath.removeLast()
    }

    public func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
