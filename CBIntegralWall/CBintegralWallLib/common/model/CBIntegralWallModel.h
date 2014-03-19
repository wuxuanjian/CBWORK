//
//  CBIntegralWallModel.h
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBIntegralWallSysDefine.h"

@interface CBIntegralWallModel : NSObject

@property (nonatomic,strong) NSString* adId;            //广告id
@property (nonatomic,strong) NSString* adName;          //广告名称
@property (nonatomic,strong) NSString* adDetails;       //广告详情
@property (nonatomic,strong) NSString* adPoint;         //广告得分
@property (nonatomic,strong) NSString* adPointDetails;  //广告得分详情
@property (nonatomic,strong) NSString* adSkipUrl;       //广告跳转链接
@property (nonatomic,strong) NSString* adIconUrl;       //广告图标链接

@property (nonatomic,strong) NSString* adPackegName;    //广告包名
@property (nonatomic,strong) NSString* adVertisers;     //广告商
@property (nonatomic,strong) NSString* adFeedbackUrl;   //广告下载反馈url

@end
