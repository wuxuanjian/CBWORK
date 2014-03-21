//
//  CBIntegralWallUtils.h
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-20.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBIntegralWallList.h"
#import "CBIntegralWallSysDefine.h"
#import <CoreLocation/CoreLocation.h>

//appId：后期分配的应用唯一标示码
NSString* cbWallAppId();
//ua：user-agent
NSString* cbWallUserAgent();
//mac地址获取
NSString* cbWallMacaddress();

//获取运营商
NSString* cbWallCheckCarrier();
//sdkVersion：sdk版本号
NSString* cbWallSdkVersion();
//idfa:  广告标示符
NSString* cbWallIdfa();
//openUdid:可以替代UDID
NSString* cbWallOpenUDid();
//os：设备操作系统
NSString* cbWallSysOS();
//packageName：应用唯一标示
NSString* cbWallPackageName();
//应用包 版本号
NSString* cbWallVersionCode();

//设置经纬度
void setWallLocation(CLLocation* aLocation);
//设置定位省市设置
void setWallLocationCity(NSString* aProvince, NSString* aCity);
//设置定位成功与失败的状态
void setWallLocationState(BOOL aState);

//latitude纬度
NSString* cbWallLatitudeStr();
//longitude经度
NSString* cbWallLongitudeStr();
//定位省名称
NSString* cbWallProvinceStr();
//定位市名称
NSString* cbWallCityStr();
//定位状态
BOOL cbWallLocationState();

