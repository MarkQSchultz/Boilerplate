//
//  Storyboardable.swift
//  Boilerplate
//
//  Created by Mark Schultz on 12/29/16.
//  Copyright © 2016 QZero Labs, LLC. All rights reserved.
//

import UIKit

public protocol Storyboardable {
    static var storyboardName: String { get }
    static var storyboardIdentifier: String? { get }
}

public extension Storyboardable where Self: UIViewController {
    
    public static var storyboardName: String {
        return String(describing: Self.self)
    }
    
    public static var storyboardIdentifier: String? {
        return nil
    }
    
    public static func viewControllerFromStoryboard() -> Self {
        let name = storyboardName
        
        let sb = UIStoryboard(name: name, bundle: Bundle.init(for: Self.self))
        
        if let identifier = storyboardIdentifier {
            guard let vc = sb.instantiateViewController(withIdentifier: identifier) as? Self else {
                fatalError("Error instantiating \(type(of: self)) from storyboard with name \(name)")
            }
            
            return vc
        } else {
            guard let vc = sb.instantiateInitialViewController() as? Self else {
                fatalError("Error instantiating \(type(of: self)) from storyboard with name \(name)")
            }
            
            return vc
        }
    }
    
}
