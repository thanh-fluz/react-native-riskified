#import "ReactNativeRiskified.h"

@implementation ReactNativeRiskified

@interface RiskifiedBeacon : NSObject

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);

}

RCT_EXPORT_METHOD(startBeacon:(NSString *)shopName sessionToken:(NSString *)token debugInfo:(BOOL)debug)
{
   
}

@end
