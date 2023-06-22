//
//  ViewCoding.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 21/06/23.
//

protocol ViewCoding {
    func configure()
    func buildHierarchy()
    func buildConstraints()
    func render()
    func setupView()
}

extension ViewCoding {
    func setupView() {
        configure()
        buildHierarchy()
        buildConstraints()
        render()
    }
    
    func configure() { }
}
