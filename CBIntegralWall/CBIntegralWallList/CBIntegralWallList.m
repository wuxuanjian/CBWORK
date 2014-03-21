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
#import "CBWallNetWorkEngine.h"
#import "CBWallGPSEngine.h"

static CBIntegralWallList*  wallsdk = nil;


@interface CBIntegralWallList()
{
    
}
@property (nonatomic,strong) CBWallGPSEngine*  gpsEngine;      //定位引擎
@property (nonatomic,strong) CBIntegralWallView* integralWalll; //广告墙
@property (nonatomic,strong) CBWallNetWorkEngine* workEngine;

@end

@implementation CBIntegralWallList
@synthesize gpsEngine = _gpsEngine;      //定位引擎
@synthesize integralWalll = _integralWalll; //广告墙
@synthesize workEngine = _workEngine;

+(id) shareWallList
{
    if(wallsdk == nil)
    {
        wallsdk = [[CBIntegralWallList alloc] init];
    }
    [wallsdk showWallView];
    return wallsdk;
}

-(id) init
{
    self = [super init];
    if (self)
    {
        [self gpsLocation];
        [self netWorkEngine];
    }
    return self;
}


-(void) showWallView
{
    if(!_integralWalll)
    {
        _integralWalll = [[CBIntegralWallView alloc] initWithFrame:CGRectMake(0, CBWALL_UISCREEN_FRAME_HEIGHT + 20, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_UISCREEN_FRAME_HEIGHT )];
        _integralWalll.backgroundColor = [UIColor grayColor];
    }
    _integralWalll.screenAnimated = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:_integralWalll];
    [_integralWalll notificationCenter];
    [_integralWalll deviceOrientationDidChange:nil];
//    [_integralWalll showIntegralWallView];
}

-(void) gpsLocation
{
    if(!_gpsEngine)
    {
        _gpsEngine = [[CBWallGPSEngine alloc] init];
    }
    [_gpsEngine startLocation:^(BOOL aState)
     {
     }];
}

-(void) netWorkEngine
{
    if (!_workEngine)
    {
        _workEngine = [[CBWallNetWorkEngine alloc] initWithHostName:NET_WORK_SERVER_URL customHeaderFields:nil];
    }
    
    [_workEngine postDataToServer:^(NSString *responseString) {
        
    } netWorkError:^(NSError *err) {
        
    }];
}

@end
