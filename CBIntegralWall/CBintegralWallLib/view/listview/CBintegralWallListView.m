//
//  CBintegralWallListView.m
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBintegralWallListView.h"
#import "CBIntegralWallCell.h"
#import "CBIntegralWallModel.h"
#import "CBAdDetailsView.h"

@implementation CBintegralWallListView
@synthesize listTableView = _listTableView;
@synthesize listDataArray = _listDataArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _listDataArray = [[NSMutableArray alloc] initWithCapacity:3];
        for (int i = 0; i < 10; i++)
        {
            CBIntegralWallModel* model = [[CBIntegralWallModel alloc] init];
            model.adId = [NSString stringWithFormat:@"%d",i];
            model.adName = [NSString stringWithFormat:@"ad name %dW",i];
            model.adPoint = @"999";
            model.adDetails = @"好好先生";
            model.adPointDetails = @"测试数据，请留意。";
            [_listDataArray addObject:model];
        }
        
        _listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _listTableView.dataSource = self;
        _listTableView.delegate = self;
        [self addSubview:_listTableView];
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor clearColor];
        [_listTableView setTableFooterView:view];
        
        [_listTableView reloadData];
    }
    return self;
}


#pragma UITableView Delegate
//每个Section 的 rows个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_listDataArray count];
}

//row 的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"CBIntegralWallCell";
    CBIntegralWallCell *cell = nil; //(CBIntegralWallCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    cell = [[CBIntegralWallCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//去掉点击效果
    
    CBIntegralWallModel* model = [_listDataArray objectAtIndex:[indexPath row]];
    [cell showIntegralWall:model];

    return cell;
}

//listview 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBAdDetailsView* adDetailsView = [[CBAdDetailsView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self addSubview:adDetailsView];
    [adDetailsView showIntegralWallView];
}



@end
