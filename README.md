![](https://cdn.rawgit.com/ruddfawcett/Notepad/master/header.svg)

[![Version](https://img.shields.io/github/release/ruddfawcett/Notepad.svg)](https://github.com/ruddfawcett/Notepad/releases) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods compatible](https://img.shields.io/cocoapods/v/Notepad.svg)](https://cocoapods.org/pods/Notepad)

## Usage

```swift
let notepad = Notepad(view.bounds, themeFile: "one-dark")
view.addSubview(notepad)
```
Notepad is just like any other UITextView, but you need to use the convenience initializer in order to use the themes. To create a new theme, copy one of the existing themes and edit the JSON.

Check out the [Xcode project](Example.xcodeproj) for an [example](Example). For full documentation read [the code](Notepad/Notepad.swift).

## Installation

Copy the source from the Notepad folder to your project, or add Notepad to your Podfile if you're using CocoaPods.
