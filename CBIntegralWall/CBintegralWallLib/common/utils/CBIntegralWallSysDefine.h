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

#define CBWALL_WALL_LIST_TITLE_HEIGHT 44   //标题栏的高度

//判断系统
#define CBWALL_NLSystemVersionGreaterOrEqualThan(version) ([[[UIDevice currentDevice] systemVersion] floatValue] >= version)
#define CBWALL_IOS7_OR_LATER CBWALL_NLSystemVersionGreaterOrEqualThan(7.0)

#endif
