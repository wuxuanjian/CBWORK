//
//  CBIntegralWallModel.m
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBIntegralWallModel.h"
#import "SvIncrementallyImage.h"

@implementation CBIntegralWallModel
@synthesize adId = _adId;            //广告id
@synthesize adName = _adName;          //广告名称
@synthesize adDetails = _adDetails;       //广告详情
@synthesize adPoint = _adPoint;         //广告得分
@synthesize adPointDetails = _adPointDetails;  //广告得分详情
@synthesize adSkipUrl = _adSkipUrl;       //广告跳转链接
@synthesize adIconUrl = _adIconUrl;       //广告图标链接

@synthesize adPackegName = _adPackegName;    //广告包名
@synthesize adVertisers = _adVertisers;     //广告商
@synthesize adFeedbackUrl = _adFeedbackUrl;   //广告下载反馈url

@synthesize svincrementallyImage = _svincrementallyImage;

-(id) init
{
    self = [super init];
    if(self)
    {
        _adId = @"";
        _adName = @"";
        _adDetails = @"";
        _adPoint = @"";
        _adPointDetails = @"";
        _adSkipUrl = @"";
        _adIconUrl = @"";
        _adPackegName = @"";
        _adVertisers = @"";
        _adFeedbackUrl = @"";
        _svincrementallyImage = nil;
    }
    return self;
}

-(void) setAdIconUrl:(NSString *)iconUrl
{
    _adIconUrl = iconUrl;
    NSURL *url = [[NSURL alloc] initWithString:iconUrl];
    _svincrementallyImage = [[SvIncrementallyImage alloc] initWithURL:url];
    
}

@end
