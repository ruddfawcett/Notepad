//
//  ViewController.swift
//  Notepad
//
//  Created by Rudd Fawcett on 10/14/16.
//  Copyright © 2016 Rudd Fawcett. All rights reserved.
//

import UIKit
import Notepad

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let editor = Notepad(frame: self.view.bounds, themeFile: "one-dark")

        let testFile = Bundle.main.path(forResource: "tests", ofType: "md")
        do {
            let text = try String(contentsOfFile: testFile!)
            editor.text = text
        } catch {
            print(error)
        }

        editor.textContainerInset = UIEdgeInsetsMake(40, 20, 40, 20)
        self.view.addSubview(editor)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
