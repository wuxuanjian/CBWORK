//
//  CBIntegralWallSysDefine.h
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#ifndef CBIntegralWall_CBIntegralWallSysDefine_h
#define CBIntegralWall_CBIntegralWallSysDefine_h

#define CBWALL_UISCREEN_FRAME_WIDTH  [UIScreen mainScreen].applicationFrame.size.width     //屏幕宽度
#define CBWALL_UISCREEN_FRAME_HEIGHT [UIScreen mainScreen].applicationFrame.size.height   //屏幕高度
//#define CBWALL_UISCREEN_FRAME_WIDTH  320     //屏幕宽度
//#define CBWALL_UISCREEN_FRAME_HEIGHT ([UIScreen mainScreen].applicationFrame.size.height > 480)?570:480   //屏幕高度


#define CBWALL_WALL_LIST_TITLE_HEIGHT 44   //标题栏的高度

//判断系统
#define CBWALL_NLSystemVersionGreaterOrEqualThan(version) ([[[UIDevice currentDevice] systemVersion] floatValue] >= version)
#define CBWALL_IOS7_OR_LATER CBWALL_NLSystemVersionGreaterOrEqualThan(7.0)

//NSUserDefaults存储key
#define USERDEFAULTS_CB_GPS_STATE_KEY @"USERDEFAULTS_SDK_CB_GPS_STATE"       //定位状态
#define USERDEFAULTS_CB_LONGITUDE_KEY @"USERDEFAULTS_SDK_CB_LONGITUDE"       //longitude 经度
#define USERDEFAULTS_CB_LATITUDE_KEY  @"USERDEFAULTS_SDK_CB_LATITUDE"       //latitude 纬度
#define USERDEFAULTS_CB_CITY_NAME_KEY @"USERDEFAULTS_SDK_CB_CITY_NAME"       //城市名city
#define USERDEFAULTS_CB_PROVINCE_KEY  @"USERDEFAULTS_SDK_CB_PROVINCE"        //省份名


//服务端访问URL
#define NET_WORK_SERVER_URL @"push.hi6yx.com:8090" //测试地址

#endif
