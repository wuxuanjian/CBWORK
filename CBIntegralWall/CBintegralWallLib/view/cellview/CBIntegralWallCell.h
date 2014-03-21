//
//  CBIntegralWallCell.h
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBIntegralWallModel.h"
#import "CBIntegralWallSysDefine.h"

@class SvIncrementallyImage;
@interface CBIntegralWallCell : UITableViewCell

@property (nonatomic,strong) SvIncrementallyImage *svincrementallyImage;
@property (nonatomic,strong) UIImageView* iconImageView;
@property (nonatomic,strong) NSTimer* iconTimer;

-(void) showIntegralWall:(CBIntegralWallModel*)mode cellWidth:(CGFloat)width;


@end
