//
//  Storage.swift
//  Notepad
//
//  Created by Rudd Fawcett on 10/14/16.
//  Copyright © 2016 Rudd Fawcett. All rights reserved.
//


import UIKit

public class Storage: NSTextStorage {
    /// The Theme for the Notepad.
    var theme: Theme!

    /// The mutable attributed string behind the entire editor.
    var backingStore = NSMutableAttributedString()
    override public var string: String {
        get {
            return backingStore.string
        }
    }

    override init() {
        super.init()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Finds attributes within a given range on a String.
    ///
    /// - parameter location: How far into the String to look.
    /// - parameter range:    The range to find attributes for.
    ///
    /// - returns: The attributes on a String within a certain range.
    override public func attributes(at location: Int, effectiveRange range: NSRangePointer?) -> [String : Any] {
        return backingStore.attributes(at: location, effectiveRange: range)
    }

    /// Replaces edited characters within a certain range with a new string.
    ///
    /// - parameter range: The range to replace.
    /// - parameter str:   The new string to replace the range with.
    override public func replaceCharacters(in range: NSRange, with str: String) {
        self.beginEditing()
        backingStore.replaceCharacters(in: range, with: str)
        self.edited([.editedCharacters, .editedAttributes], range: range, changeInLength: str.characters.count - range.length)
        self.endEditing()
    }

    /// Sets the attributes on a string for a particular range.
    ///
    /// - parameter attrs: The attributes to add to the string for the range.
    /// - parameter range: The range in which to add attributes.
    override public func setAttributes(_ attrs: [String : Any]?, range: NSRange) {
        self.beginEditing()
        backingStore.setAttributes(attrs, range: range)
        self.edited(.editedAttributes, range: range, changeInLength: 0)
        self.endEditing()
    }

    /// Processes any edits made to the text in the editor.
    override public func processEditing() {
        let backingString = backingStore.string
        let nsRange = backingString.range(from: NSMakeRange(NSMaxRange(editedRange), 0))!
        let indexRange = backingString.lineRange(for: nsRange)
        let extendedRange: NSRange = NSUnionRange(editedRange, backingString.nsRange(from: indexRange))

        applyStyles(extendedRange)
        super.processEditing()
    }

    /// Applies styles to a range on the backingString.
    ///
    /// - parameter range: The range in which to apply styles.
    func applyStyles(_ range: NSRange) {
        let backingString = backingStore.string
        setAttributes(theme.body.attributes, range: range)

        for (style) in theme.styles {
            style.regex.enumerateMatches(in: backingString, options: .withoutAnchoringBounds, range: range, using: { (match, flags, stop) in
                if match != nil {
                    addAttributes(style.attributes, range: match!.rangeAt(0))
                }
            })
        }
    }
}
