//
//  HTMIBuilder.m
//  HTMIBuilder
//
//  Created by wlq on 17/08/2017.
//  Copyright © 2017 htmi. All rights reserved.
//

#import "HTMIBuilder.h"
#import "HTMIBuilder_iOS.h"
#import "HTMIBuilder_Android.h"

typedef NS_ENUM(NSUInteger, HTMIBuilderType) {
    HTMIBuilderTypeNone,
    HTMIBuilderTypeiOS,
    HTMIBuilderTypeAndroid,
};

@implementation HTMIBuilder

+ (void)runWithFileParser:(NSDictionary *)config success:(void (^)())success failure:(void (^)())failure {

    HTMIBuilderType builderType = HTMIBuilderTypeNone;
    if ([config[@"builderType"] caseInsensitiveCompare:@"iOS"] == NSOrderedSame) {
        builderType = HTMIBuilderTypeiOS; success();
    } else if ([config[@"builderType"] caseInsensitiveCompare:@"Android"] == NSOrderedSame) {
        builderType = HTMIBuilderTypeAndroid; success();
    } else {
        failure(); return;
    }
    
    HTMIBuilder * builder = [HTMIBuilder builderWithType:builderType];
    builder.user = [[NSHomeDirectory() componentsSeparatedByString:@"/"] objectAtIndex:2];
    builder.prefix = config[@"prefix"];
    builder.module = config[@"module"];
    builder.parameter = config[@"parameter"];
    builder.dataList = config[@"dataList"];
    builder.actionList = config[@"actionList"];
    [builder build];
}

- (void)build {
    NSLog(@"please enter the right builder type!");
}

+ (HTMIBuilder *)builderWithType:(HTMIBuilderType)builderType {

    switch (builderType) {
        case HTMIBuilderTypeiOS:
            return [HTMIBuilder_iOS new];
            break;
        case HTMIBuilderTypeAndroid:
            return [HTMIBuilder_Android new];
            break;
        case HTMIBuilderTypeNone:
            return [HTMIBuilder new];
            break;
        default:
            break;
    }
}

@end
