//
//  CBAdDetailsBgView.h
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-20.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBIntegralWallSysDefine.h"
#import "CBAdDetailsView.h"

@interface CBAdDetailsBgView : UIView

@property (nonatomic,strong) CBAdDetailsView* adDetailsView;
@property (nonatomic) CGRect            sonViewForm;
-(void) showAdDetailsView:(CBIntegralWallModel*)model;

@end
