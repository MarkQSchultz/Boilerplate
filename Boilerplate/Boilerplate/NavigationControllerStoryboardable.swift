//
//  NavigationControllerStoryboardable.swift
//  Boilerplate
//
//  Created by Mark Schultz on 12/29/16.
//  Copyright © 2016 QZero Labs, LLC. All rights reserved.
//

import Foundation

public protocol NavigationControllerStoryboardable {
    static var storyboardName: String { get }
}

public extension NavigationControllerStoryboardable where Self: UIViewController {
    
    public static var storyboardName: String {
        return String(describing: Self.self)
    }
    
    public static func navControllerFromStoryboard() -> UINavigationController {
        let name = storyboardName
        
        let sb = UIStoryboard(name: name, bundle: Bundle(for: Self.self))
        
        guard let vc = sb.instantiateInitialViewController() as? UINavigationController else {
            fatalError("Error instantiating \(type(of: self)) from storyboard with name \(name)")
        }
        
        return vc
    }
    
}
