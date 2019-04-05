//
//  UniversalTypes.swift
//  Notepad
//
//  Created by Christian Tietze on 2017-07-21.
//  Copyright © 2017 Rudd Fawcett. All rights reserved.
//

#if os(iOS)
    import UIKit
    public typealias UniversalColor = UIColor
    public typealias UniversalFont = UIFont
    public typealias UniversalFontDescriptor = UIFontDescriptor
    public typealias UniversalTraits = UIFontDescriptor.SymbolicTraits
#elseif os(macOS)
    import AppKit
    public typealias UniversalColor = NSColor
    public typealias UniversalFont = NSFont
    public typealias UniversalFontDescriptor = NSFontDescriptor
    public typealias UniversalTraits = NSFontDescriptor.SymbolicTraits
#endif
