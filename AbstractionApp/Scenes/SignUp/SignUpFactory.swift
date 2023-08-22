//
//  SignUpFactory.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 21/08/23.
//

import UIKit

struct SignUpFactory {
    
    static func make() -> UIViewController {
        return SignUpViewController()
    }
}
