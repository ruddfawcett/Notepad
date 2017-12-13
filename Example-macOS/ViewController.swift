//
//  ViewController.swift
//  Example macOS
//
//  Created by Christian Tietze on 21.07.17.
//  Copyright © 2017 Rudd Fawcett. All rights reserved.
//

import Cocoa
import Notepad

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    let storage = Storage()

    override func viewDidLoad() {
        super.viewDidLoad()

        let theme = Theme("one-dark")
        storage.theme = theme
        textView.backgroundColor = theme.backgroundColor
        textView.insertionPointColor = theme.tintColor
        textView.layoutManager?.replaceTextStorage(storage)

        if let testFile = Bundle.main.path(forResource: "tests", ofType: "md"),
            let text = try? String(contentsOfFile: testFile) {

            textView.string = text
        } else {
            print("Unable to load demo text.")
        }
    }
}
