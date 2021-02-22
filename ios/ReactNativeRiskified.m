#import "ReactNativeRiskified.h"

@implementation ReactNativeRiskified

RCT_EXPORT_MODULE()

BOOL beaconState = NO;

RCT_EXPORT_METHOD(startBeacon
                  : (NSString *)shopName sessionToken
                  : (NSString *)sessionToken debugInfo
                  : (BOOL *)debugInfo) {
  if (!beaconState) {
    [RiskifiedBeacon startBeacon:shopName
                     sessionToken:sessionToken
                     debugInfo:debugInfo];
    beaconState = YES;
  }
}

RCT_EXPORT_METHOD(updateSessionToken : (NSString *)token) {
  [RiskifiedBeacon updateSessionToken:token];
}

RCT_EXPORT_METHOD(logRequest: (NSURL *)url) {
  [RiskifiedBeacon logRequest:url];
}

RCT_EXPORT_METHOD(logSensitiveDeviceInfo) {
  [RiskifiedBeacon logSensitiveDeviceInfo];
}

RCT_EXPORT_METHOD(rCookie 
                         : (RCTResponseSenderBlock)successCallback
            errorCallback: (RCTResponseSenderBlock)errorCallback) {
  @try {
    NSString *riskifiedDeviceID = [RiskifiedBeacon rCookie];
    successCallback(@[riskifiedDeviceID]);
  }
  @catch ( NSException *e ) {
    errorCallback(@[e]);
  }
}
@end