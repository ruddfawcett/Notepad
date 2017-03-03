![](https://cdn.rawgit.com/ruddfawcett/Notepad/master/resources/header.svg)

[![Version](https://img.shields.io/github/release/ruddfawcett/Notepad.svg)](https://github.com/ruddfawcett/Notepad/releases) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods compatible](https://img.shields.io/cocoapods/v/Notepad.svg)](https://cocoapods.org/pods/Notepad)

## Usage

```swift
let notepad = Notepad(frame: view.bounds, themeFile: "one-dark")
view.addSubview(notepad)
```
Notepad is just like any other UITextView, but you need to use the convenience initializer in order to use the themes. To create a new theme, copy one of the existing themes and edit the JSON.

Check out the [Xcode project](Example.xcodeproj) for an [example](Example). For full documentation read [the code](Notepad/Notepad.swift).

## Themes

Take a look at all of the [themes and swatches](themes.md) when choosing the theme for your Notepad, or as inspiration for a new one.

You can find all of the raw themes in the [themes folder](Notepad/themes), and the file names are case-sensitive.

### Custom Regex
Using regex, you can match custom patterns in your Notepad editor by passing a `regex` attribute in your theme. For example, one that highlights Twitter handles in a teal color:

```json
"handle": {
  "regex": "[@＠][a-zA-Z0-9_]{1,20}",
  "color": "#78ddd5"
}
```

## Installation

Copy the source from the Notepad folder to your project, or add Notepad to your Podfile if you're using CocoaPods.
