//
//  CBIntegralWallView.h
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBIntegralWallSysDefine.h"
#import "CBintegralWallListView.h"

@interface CBIntegralWallView : UIView

@property (nonatomic,readwrite) BOOL screenAnimated;

//屏幕旋转监听
-(void) notificationCenter;

- (void)deviceOrientationDidChange:(NSNotification *)notification;

@end
