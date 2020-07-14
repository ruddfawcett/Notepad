//
//  Style.swift
//  Notepad
//
//  Created by Rudd Fawcett on 10/14/16.
//  Copyright © 2016 Rudd Fawcett. All rights reserved.
//

import Foundation

public struct Style {
    public var name: String?
    var regex: NSRegularExpression!
    public var attributes: [NSAttributedString.Key: Any] = [:]
    var groups: [String]?

    public init(element: Element, attributes: [NSAttributedString.Key: Any], groups: [String]? = nil, name: String? = nil) {
        self.name = name
        self.regex = element.toRegex()
        self.attributes = attributes
        self.groups = groups
    }

    public init(regex: NSRegularExpression, attributes: [NSAttributedString.Key: Any], groups: [String]? = nil, name: String? = nil) {
        self.name = name
        self.regex = regex
        self.attributes = attributes
        self.groups = groups
    }

    public init() {
        self.regex = Element.unknown.toRegex()
    }
}
