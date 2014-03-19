//
//  CBintegralWallListView.h
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBIntegralWallSysDefine.h"

@interface CBintegralWallListView : UIView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView* listTableView;
@property (nonatomic,strong) NSMutableArray* listDataArray;


@end
