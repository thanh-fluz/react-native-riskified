# react-native-riskified

## Getting started

`$ npm install react-native-riskified --save`

### Mostly automatic installation

`$ react-native link react-native-riskified`

## Usage

```javascript
import ReactNativeRiskified from "react-native-riskified"

/**
 Entry point, should be called at the end of applicationDidFinishLaunching:
 @param shopName The Riskified account name (shop.com)
 @param sessionID The initial session's unique identifier
 @param enableDebugging Controls debug logging to NSLog
 */
ReactNativeRiskified.startBeacon((shopName: string), (sessionID: string), (enableDebugging: boolean)) // => void

/**
 Updates that the user has begun a new browsing session
 @param sessionID The new session's unique identifier
 */
ReactNativeRiskified.updateSessionToken((sessionID: string)) // => void

/**
 Manually log a request to a specific URL.
 @param requestURL The remote url that the host app sent a request to.
 */
ReactNativeRiskified.logRequest((requestURL: string)) // => void

/**
   Get the unique Riskified Identifier.
 */
const riskifiedDeviceID = ReactNativeRiskified.rCookie(
  (successCallback: (riskifiedDeviceID: string) => string),
  (errorCallback: (errorMsg: string) => string)
) // => string
```