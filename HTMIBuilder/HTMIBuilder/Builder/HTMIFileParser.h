//
//  HTMIFileParser.h
//  HTMIBuilder
//
//  Created by wlq on 17/08/2017.
//  Copyright © 2017 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMIFileParser : NSObject

+ (NSDictionary *)parser_plist_r;

+ (void)parser_rw:(NSString *)path code:(NSString *)code filename:(NSString *)filename header:(NSString *)header parameter:(NSMutableArray *)parameter;

@end
