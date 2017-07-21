//
//  Notepad.swift
//  Notepad
//
//  Created by Rudd Fawcett on 10/14/16.
//  Copyright © 2016 Rudd Fawcett. All rights reserved.
//

#if os(iOS)
import UIKit

public class Notepad: UITextView {

    var storage: Storage = Storage()

    /// Creates a new Notepad.
    ///
    /// - parameter frame:     The frame of the text editor.
    /// - parameter themeFile: The name of the theme file to use.
    ///
    /// - returns: A new Notepad.
    convenience public init(frame: CGRect, themeFile: String) {
        self.init(frame: frame, textContainer: nil)
        let theme = Theme(themeFile)
        self.storage.theme = theme
        self.backgroundColor = theme.backgroundColor
        self.tintColor = theme.tintColor
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    convenience public init(frame: CGRect, theme: Theme) {
        self.init(frame: frame, textContainer: nil)
        self.storage.theme = theme
        self.backgroundColor = theme.backgroundColor
        self.tintColor = theme.tintColor
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        let layoutManager = NSLayoutManager()
        let containerSize = CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude)
        let container = NSTextContainer(size: containerSize)
        container.widthTracksTextView = true

        layoutManager.addTextContainer(container)
        storage.addLayoutManager(layoutManager)
        super.init(frame: frame, textContainer: container)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let layoutManager = NSLayoutManager()
        let containerSize = CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude)
        let container = NSTextContainer(size: containerSize)
        container.widthTracksTextView = true

        layoutManager.addTextContainer(container)
        storage.addLayoutManager(layoutManager)
    }
}
#endif
