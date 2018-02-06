# Facebook Login API integration with iOS

`Facebook Login API integration with iOS` is the code repository demonstrating how to integrate Facebook Login API into iOS application using Objective-C.

## Setup

1. Select an App or Create a New App 
    * Use this [link](https://developers.facebook.com/docs/facebook-login/ios)

2.  Set up Your Development Environment
    *   Go to your project's root directory and do `pod init` to initializa Cocoapods dependenct manager. This will create `Podfile`
    *   Edit `Podfile` and copy `pod 'FBSDKLoginKit'`
    *   `pod install` - to install `FBSDKLoginKit`
    *   Close XCode project and open Workspace that Cocoapods created in the same root directory.

3. Register and Configure Your App with Facebook
    *   Add your Bundle Identifier
        *  Copy bundleID from XCode project and register.

4. Configure Your info.plist
    * Edit your `Info.plist` file with the given.

    ```
    <key>CFBundleURLTypes</key>
        <array>
            <dict>
                <key>CFBundleURLSchemes</key>
                <array>
                    <string>fb152778262047139</string>
                </array>
            </dict>
        </array>
        <key>FacebookAppID</key>
        <string>152778262047139</string>
        <key>FacebookDisplayName</key>
        <string>Github demo for iOS</string>
    ```

*   To use any of the Facebook dialogs (e.g., Login, Share, App Invites, etc.) that can perform an app switch to Facebook apps, your application's info.plist also needs to include
```
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>fbapi</string>
  <string>fb-messenger-share-api</string>
  <string>fbauth2</string>
  <string>fbshareextension</string>
</array>
```

<!-- ### Code -->
<!-- Please check out our YouTube video [here]() for more coding related changes to integrate APIs. -->

