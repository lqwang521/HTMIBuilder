//
//  ViewController.m
//  HTMIBuilder
//
//  Created by wlq on 17/08/2017.
//  Copyright © 2017 htmi. All rights reserved.
//

#import "ViewController.h"
#import "HTMIBuilder.h"
#import "HTMIFileParser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    __block NSString * title = nil;
    __block NSString * message = nil;
    [HTMIBuilder runWithFileParser:[HTMIFileParser parser_plist_r] success:^{
        title = @"Build Finished"; message = @"please view the floder on the desktop";
    } failure:^{
        title = @"Build Error!!!"; message = @"please enter the right builder type!!";
    }];

    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        exit(0);
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
