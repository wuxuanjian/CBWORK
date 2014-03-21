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
#import "CBAdDetailsBgView.h"

@interface CBintegralWallListView()
{
    
}
@property (nonatomic,strong) CBAdDetailsBgView* adDetailsView ;
@property (nonatomic,strong) UITableView* listTableView;

@end

@implementation CBintegralWallListView
@synthesize listTableView = _listTableView;
@synthesize adDetailsView = _adDetailsView;
@synthesize listDataArray = _listDataArray;
@synthesize sonViewForm = _sonViewForm;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _listDataArray = [[NSMutableArray alloc] initWithCapacity:3];
        for (int i = 0; i < 20; i++)
        {
            CBIntegralWallModel* model = [[CBIntegralWallModel alloc] init];
            model.adId = [NSString stringWithFormat:@"%d",i];
            model.adName = [NSString stringWithFormat:@"ad name %dW",i];
            model.adPoint = @"999";
            model.adDetails = @"好好先生";
            model.adPointDetails = @"测试数据，请留意。 测试数据，请留意。测试数据，请留意。测试数据，请留意。测试数据，请留意。测试数据，请留意。测试数据，请留意。测试数据，请留意。测试数据，请留意。";
            model.adIconUrl = @"http://c.hiphotos.baidu.com/image/w%3D2048/sign=c7075266123853438ccf8021a72bb17e/"
            "4ec2d5628535e5dd153c04d574c6a7efce1b62ac.jpg";
            [_listDataArray addObject:model];
        }
        
        _listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _listTableView.dataSource = self;
        _listTableView.delegate = self;
        [self addSubview:_listTableView];
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor clearColor];
        [_listTableView setTableFooterView:view];
    }
    return self;
}

-(void) setSonViewForm:(CGRect)sonViewForm
{
    _listTableView.frame = CGRectMake(0, 0, sonViewForm.size.width, sonViewForm.size.height);
    [_listTableView reloadData];
    if (_adDetailsView)
    {
        _adDetailsView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height );
        _adDetailsView.sonViewForm = _adDetailsView.frame;
    }
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
    if(!cell)
    {
        cell = [[CBIntegralWallCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//去掉点击效果
    
    CBIntegralWallModel* model = [_listDataArray objectAtIndex:[indexPath row]];
    [cell showIntegralWall:model cellWidth:self.frame.size.width];

    return cell;
}

//listview 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_adDetailsView)
    {
        _adDetailsView = nil;
    }
    _adDetailsView = [[CBAdDetailsBgView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height )];
    _adDetailsView.sonViewForm = _adDetailsView.frame;
    [self addSubview:_adDetailsView];
    CBIntegralWallModel* model = [_listDataArray objectAtIndex:[indexPath row]];
    [_adDetailsView showAdDetailsView:model];
}



@end
