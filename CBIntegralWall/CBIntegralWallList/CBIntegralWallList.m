//
//  CBIntegralWallList.m
//  CBIntegralWallList
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBIntegralWallList.h"
#import "CBIntegralWallView.h"
#import "CBIntegralWallSysDefine.h"

@implementation CBIntegralWallList

+(void) addAdListView
{
    CBIntegralWallView* integralWalll = [[CBIntegralWallView alloc] initWithFrame:CGRectMake(0, CBWALL_UISCREEN_FRAME_HEIGHT + 20, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_UISCREEN_FRAME_HEIGHT )];
    integralWalll.backgroundColor = [UIColor grayColor];
    [[UIApplication sharedApplication].keyWindow addSubview:integralWalll];
    [integralWalll showIntegralWallView];
    
}


@end
