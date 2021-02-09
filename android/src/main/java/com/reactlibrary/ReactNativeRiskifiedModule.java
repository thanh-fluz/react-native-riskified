package com.reactlibrary;

import android.util.Log;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.riskified.android_sdk.RxBeacon;
import com.riskified.android_sdk.RiskifiedBeaconMain;
import com.riskified.android_sdk.RiskifiedBeaconMainInterface;

public class ReactNativeRiskifiedModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;
    private RiskifiedBeaconMainInterface RXBeacon;

    public ReactNativeRiskifiedModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "ReactNativeRiskified";
    }

    @ReactMethod
    public boolean startBeacon (String shopName, String sessionToken, Boolean enableDebugging) {
        try {
        Activity activity = this.reactContext.getCurrentActivity();
        if (activity == null)  {
            return false;
        } else {
            RXBeacon = new RiskifiedBeaconMain();
            RXBeacon.startBeacon(shopName, sessionToken, enableDebugging, (Application)reactContext.getApplicationContext());
            return true;
        }
        } catch (Exception error) {
        error.printStackTrace();
        Log.e("Unable to start Riskified Beacon: ", error.getMessage());
        return false;
        }
    }

    @ReactMethod 
    public boolean updateSessionToken(String sessionToken) {
        try {
        if (RXBeacon == null) {
            return false;
        } else {
            RXBeacon.updateSessionToken(sessionToken);
            return true;
        }
        } catch (Exception error) {
        error.printStackTrace();
        Log.e("Unable to update session token: ", error.getMessage());
        return false;
        }
    }

    @ReactMethod
    public void logRequest(String requestUrl) {
        try {
        if (RXBeacon != null) {
            RXBeacon.logRequest(requestUrl);
        }
        } catch (Exception error) {
        error.printStackTrace();
        Log.e("Unable to log request: ", error.getMessage());
        }
    }

    @ReactMethod
    public void logSensitiveDeviceInfo() {
        try {
            if (RXBeacon != null) {
                RXBeacon.logSensitiveDeviceInfo();
            }
        } catch (Exception error) {
            error.printStackTrace();
        }
    }

    @ReactMethod
    public void removeLocationUpdates() {
        try {
            if (RXBeacon != null) {
                RXBeacon.removeLocationUpdates();
            }
        } catch (Exception error) {
            error.printStackTrace();
        }
    }

    @ReactMethod
    public String rCookie () {
        try {
            String riskifiedDeviceID = RXBeacon.rCookie();
            return riskifiedDeviceID
        } catch (Exception error) {
             error.printStackTrace();
        }
    }
}
