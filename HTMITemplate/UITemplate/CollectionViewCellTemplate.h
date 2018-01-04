//
//  CollectionViewCellTemplate.h
//  HTMITemplate
//
//  Created by wlq on 17/5/11.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubmodelInterfaceTemplate.h"

@interface CollectionViewCellTemplate : UICollectionViewCell

@property (nonatomic,strong) id<SubmodelInterfaceTemplate> dataSource;

@end
