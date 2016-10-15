//
//  Style.swift
//  Notepad
//
//  Created by Rudd Fawcett on 10/14/16.
//  Copyright © 2016 Rudd Fawcett. All rights reserved.
//

import UIKit

struct Style {
    var regex: NSRegularExpression!
    var attributes: [String: AnyObject] = [:]
    
    init(element: Element, attributes: [String: AnyObject]) {
        self.regex = element.toRegex()
        self.attributes = attributes
    }
    
    init() {
        self.regex = Element.unknown.toRegex()
    }
}

