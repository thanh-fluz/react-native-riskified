#import "ReactNativeRiskified.h"

@implementation ReactNativeRiskified

RCT_EXPORT_MODULE()

BOOL beaconState = FALSE;

RCT_EXPORT_METHOD(startBeacon
                  : (NSString *)shopName sessionToken
                  : (NSString *)sessionToken debugInfo
                  : (BOOL *)debugInfo) {
  if (!beaconState) {
    [RiskifiedBeacon startBeacon:shopName
                    sessionToken:sessionToken
                       debugInfo:debugInfo];
    beaconState = TRUE;
  }
}

RCT_EXPORT_METHOD(updateSessionToken : (NSString *)token) {
  [RiskifiedBeacon updateSessionToken:token];
}

@end
