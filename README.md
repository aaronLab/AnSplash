#  AnSplash

This is an app for SwiftUI exercise, using [Unsplash API](http://api.unsplash.com/).
There's nothing on this app yet, but I'll try to keep updating this.

## How to Test

1. Sign up for [Unsplash Developers](https://unsplash.com/developers) first.
2. Get the api key(Access & Secret).
3. Create your own file that has api key like below. (Do not forget to add the file in your .gitignore file, if you will upload your project on GitHub).
    ```Swift
    // APIKey.swift
    let ACCESS_KEY = "YOUR_ACCESS_KEY"
    let SECRET_KEY = "YOUR_SECRET_KEY"
    ```
4. You might need to change your api key constant name, which is at the 16th line of `PhotoServices.swift` file.

## Dependency
- [SDWebImage](https://github.com/SDWebImage/SDWebImage)
- [SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI)

## License
- Available under the [MIT License](https://github.com/aaronLab/AnSplash/blob/main/LICENSE)
