//
//  UIImageView+load.m
//  HTMITemplate
//
//  Created by wlq on 17/5/8.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "UIImageView+load.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (load)

- (void)loadUrl:(NSString *)imageUrl placeholder:(NSString *)placeholder {
    [self sd_setImageWithURL:[NSURL URLWithString:[imageUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]] placeholderImage:[UIImage imageNamed:placeholder]];
}

@end
