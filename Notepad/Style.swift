//
//  Style.swift
//  Notepad
//
//  Created by Rudd Fawcett on 10/14/16.
//  Copyright © 2016 Rudd Fawcett. All rights reserved.
//

import Foundation

public struct Style {
    var regex: NSRegularExpression!
    public var attributes: [NSAttributedString.Key: Any] = [:]

    public init(element: Element, attributes: [NSAttributedString.Key: Any]) {
        self.regex = element.toRegex()
        self.attributes = attributes
    }

    public init(regex: NSRegularExpression, attributes: [NSAttributedString.Key: Any]) {
        self.regex = regex
        self.attributes = attributes
    }

    public init() {
        self.regex = Element.unknown.toRegex()
    }
}
