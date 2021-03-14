//
//  Extensions.swift
//  Notepad
//
//  Created by Rudd Fawcett on 10/14/16.
//  Copyright © 2016 Rudd Fawcett. All rights reserved.
//

import Foundation

#if os(iOS)
    import struct UIKit.CGFloat
#elseif os(macOS)
    import struct AppKit.CGFloat
#endif

extension UniversalColor {
    /// Converts a hex color code to UIColor.
    /// http://stackoverflow.com/a/33397427/6669540
    ///
    /// - parameter hexString: The hex code.
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension String {
    /// Converts a Range<String.Index> to an NSRange.
    /// http://stackoverflow.com/a/30404532/6669540
    ///
    /// - parameter range: The Range<String.Index>.
    ///
    /// - returns: The equivalent NSRange.
    func nsRange(from range: Range<String.Index>) -> NSRange {
        let from = range.lowerBound.samePosition(in: utf16)
        let to = range.upperBound.samePosition(in: utf16)
        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from!),
                       length: utf16.distance(from: from!, to: to!))
    }

    /// Converts a String to a NSRegularExpression.
    ///
    /// - returns: The NSRegularExpression.
    func toRegex() -> NSRegularExpression {
        var pattern: NSRegularExpression = NSRegularExpression()

        do {
            try pattern = NSRegularExpression(pattern: self, options: .anchorsMatchLines)
        } catch {
            print(error)
        }

        return pattern
    }

    /// Converts a NSRange to a Range<String.Index>.
    /// http://stackoverflow.com/a/30404532/6669540
    ///
    /// - parameter range: The NSRange.
    ///
    /// - returns: The equivalent Range<String.Index>.
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
}

extension UniversalFont {
    func with(traits: String, size: CGFloat) -> UniversalFont? {
        guard let traits = getTraits(from: traits) else {
            return self
        }
        let descriptor = fontDescriptor.withSymbolicTraits(traits) ?? UniversalFontDescriptor(fontAttributes: [:])
        return UniversalFont(descriptor: descriptor, size: size)
    }
    
    private func getTraits(from traits: String) -> UniversalTraits? {
        #if os(iOS)
        switch traits {
            case "italic": return .traitItalic
            case "bold": return .traitBold
            case "expanded": return .traitExpanded
            case "condensed": return .traitCondensed
            default: return nil
        }
        #elseif os(macOS)
        switch traits {
            case "italic": return .italic
            case "bold": return .bold
            case "expanded": return .expanded
            case "condensed": return .condensed
            default: return nil
        }
        #endif
    }
}
