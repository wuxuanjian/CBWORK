//
//  CBIntegralWallUtils.m
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-20.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBIntegralWallUtils.h"
//获取mac地址头文件
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
//获取运营商头文件
#import<CoreTelephony/CTTelephonyNetworkInfo.h>
#import<CoreTelephony/CTCarrier.h>
//获取系统版本号和机型
#import "sys/utsname.h"
//获取idfat头文件
#import <AdSupport/AdSupport.h>
#import "OpenUDID.h"
#import <UIKit/UIKit.h>

//*******************************
#define CB_IOS_SDK_APPID             CB_AD_IOS_SDK_APPID        //appId：后期分配的应用唯一标示码
#define CB_IOS_SDK_PACKAGENAME       CB_AD_IOS_SDK_PACKAGENAME  //packageName：应用唯一标示
#define CB_IOS_SDK_VERSION           @"1.1.4"                   //sdkVersion：sdk版本号
//*******************************

//***********************************************************************************
//appId：后期分配的应用唯一标示码
NSString* cbWallAppId()
{
    return CB_IOS_SDK_APPID;
}

//ua：user-agent
NSString* cbWallUserAgent()
{
    //here use sys/utsname.h
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *model = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if(model == nil)
    {
        return @"";
    }
    return model;
}

//mac地址获取
NSString* cbWallMacaddress()
{
	int                    mib[6];
	size_t                len;
	char                *buf;
	unsigned char        *ptr;
	struct if_msghdr    *ifm;
	struct sockaddr_dl    *sdl;
	
	mib[0] = CTL_NET;
	mib[1] = AF_ROUTE;
	mib[2] = 0;
	mib[3] = AF_LINK;
	mib[4] = NET_RT_IFLIST;
	
	if ((mib[5] = if_nametoindex("en0")) == 0)
    {
		return NULL;
	}
	
	if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0)
    {
		return NULL;
	}
	
	if ((buf = malloc(len)) == NULL) {
		return NULL;
	}
	
	if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
		printf("Error: sysctl, take 2");
		return NULL;
	}
	
	ifm = (struct if_msghdr *)buf;
	sdl = (struct sockaddr_dl *)(ifm + 1);
	ptr = (unsigned char *)LLADDR(sdl);
	// NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
	NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
	free(buf);
    
    if(outstring == nil)
    {
        return @"";
    }
	return [outstring uppercaseString];
	
}

//获取运营商
//用来辨别设备所使用网络的运营商
NSString* cbWallCheckCarrier()
{
    NSString *ret = [[NSString alloc]init];
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    if (carrier == nil)
    {
        return @"0";
    }
    NSString *code = [carrier mobileNetworkCode];
    if ([code isEqualToString:@""])
    {
        return @"0";
        
    }
    if ([code isEqualToString:@"00"] || [code isEqualToString:@"02"] || [code isEqualToString:@"07"]) {
        
        ret = @"移动";
    }
    if ([code isEqualToString:@"01"]|| [code isEqualToString:@"06"] )
    {
        ret = @"联通";
    }
    if ([code isEqualToString:@"03"]|| [code isEqualToString:@"05"] ) {
        ret = @"电信";;
    }
    if(ret == nil)
    {
        return @"";
    }
    return ret;
}

//sdkVersion：sdk版本号
NSString* cbWallSdkVersion()
{
    return CB_IOS_SDK_VERSION;
}

//idfa:  广告标示符
NSString* cbWallIdfa()
{
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    if(idfa == nil)
    {
        return @"";
    }
    return idfa;
}

//openUdid:可以替代UDID
NSString* cbWallOpenUDid()
{
    NSString* openUDID = [OpenUDID value];
    if(openUDID == nil)
    {
        return @"";
    }
    return openUDID;
}

//os：设备操作系统
NSString* cbWallSysOS()
{
    //返回ios系统版本
    NSString *version =    [[UIDevice currentDevice] systemVersion];
    if(version == nil)
    {
        return @"";
    }
    return version;
}

//packageName：应用唯一标示
NSString* cbWallPackageName()
{
    return CB_IOS_SDK_PACKAGENAME;
}

//应用包 版本号
NSString* cbWallVersionCode()
{
    NSString *verson = [[[NSBundle mainBundle] infoDictionary] objectForKey: @"CFBundleShortVersionString"];
    if(verson == nil)
    {
        return @"";
    }
    return verson;
}


//设置经纬度
void setWallLocation(CLLocation* aLocation)
{
    NSString* latitude = [NSString stringWithFormat: @"%f",aLocation.coordinate.latitude];
    NSString* longitude = [NSString stringWithFormat: @"%f",aLocation.coordinate.longitude];
    NSUserDefaults *accountDefaults = [NSUserDefaults standardUserDefaults];
    [accountDefaults setObject:longitude forKey:USERDEFAULTS_CB_LONGITUDE_KEY];//经度
    [accountDefaults setObject:latitude forKey:USERDEFAULTS_CB_LATITUDE_KEY];//纬度
}

//设置定位省市设置
void setWallLocationCity(NSString* aProvince, NSString* aCity)
{
    NSUserDefaults *accountDefaults = [NSUserDefaults standardUserDefaults];
    [accountDefaults setObject:aProvince forKey:USERDEFAULTS_CB_PROVINCE_KEY];//省
    [accountDefaults setObject:aCity forKey:USERDEFAULTS_CB_CITY_NAME_KEY];//市
}

//设置定位成功与失败的状态
void setWallLocationState(BOOL aState)
{
    NSUserDefaults *accountDefaults = [NSUserDefaults standardUserDefaults];
    [accountDefaults setBool:aState forKey:USERDEFAULTS_CB_GPS_STATE_KEY];//定位成功
}

//latitude纬度
NSString* cbWallLatitudeStr()
{
    NSUserDefaults *accountDefaults = [NSUserDefaults standardUserDefaults];
    NSString* latitudeStr = [accountDefaults objectForKey:USERDEFAULTS_CB_LATITUDE_KEY];
    if(latitudeStr == nil)
    {
        return @"";
    }
    return latitudeStr;
}

//longitude经度
NSString* cbWallLongitudeStr()
{
    NSUserDefaults *accountDefaults = [NSUserDefaults standardUserDefaults];
    NSString* longitudeStr = [accountDefaults objectForKey:USERDEFAULTS_CB_LONGITUDE_KEY];
    if(longitudeStr == nil)
    {
        return @"";
    }
    return longitudeStr;
}

//定位省名称
NSString* cbWallProvinceStr()
{
    NSUserDefaults *accountDefaults = [NSUserDefaults standardUserDefaults];
    NSString* province = [accountDefaults objectForKey:USERDEFAULTS_CB_PROVINCE_KEY];
    if(province == nil)
    {
        return @"";
    }
    return province;
}

//定位市名称
NSString* cbWallCityStr()
{
    NSUserDefaults *accountDefaults = [NSUserDefaults standardUserDefaults];
    NSString* city = [accountDefaults objectForKey:USERDEFAULTS_CB_CITY_NAME_KEY];
    if(city == nil)
    {
        return @"";
    }
    return city;
}

//定位状态
BOOL cbWallLocationState()
{
    NSUserDefaults *accountDefaults = [NSUserDefaults standardUserDefaults];
    BOOL state = [accountDefaults boolForKey:USERDEFAULTS_CB_GPS_STATE_KEY];
    return state;
}

//***********************************************************************************

