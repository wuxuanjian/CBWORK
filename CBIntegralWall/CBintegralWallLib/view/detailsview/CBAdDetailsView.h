//
//  CBAdDetailsView.h
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBIntegralWallSysDefine.h"
#import "CBIntegralWallModel.h"

@class SvIncrementallyImage;
@interface CBAdDetailsView : UIView

@property (nonatomic) CGRect            sonViewForm;

@property (nonatomic,strong) CBIntegralWallModel* adModel;
@property (nonatomic,strong) UIView* adDetailsBgView;
@property (nonatomic,strong) SvIncrementallyImage *svincrementallyImage;
@property (nonatomic,strong) NSTimer* iconTimer;
-(void) showDetailsView:(CBIntegralWallModel*)model bgViewObj:(UIView*)bgview;

-(void) showIntegralWallView:(CGRect)showRect;

@end
