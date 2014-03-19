//
//  CBIntegralWallView.m
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBIntegralWallView.h"

@implementation CBIntegralWallView
@synthesize integralWallListView = _integralWallListView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat listViewHeight = frame.size.height;
        CGFloat listViewY = 0.0;
//        if (CBWALL_IOS7_OR_LATER)
        {
            listViewY = CBWALL_WALL_LIST_TITLE_HEIGHT;
            listViewHeight = listViewHeight - listViewY;
        }
        _integralWallListView = [[CBintegralWallListView alloc] initWithFrame:CGRectMake(0, listViewY, CBWALL_UISCREEN_FRAME_WIDTH, listViewHeight)];
        
        [self addSubview:_integralWallListView];
        
        UIView* headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_WALL_LIST_TITLE_HEIGHT)];
        headView.backgroundColor = [UIColor blueColor];
        [self addSubview:headView];
        
        UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_WALL_LIST_TITLE_HEIGHT)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:20];
        titleLabel.text = @"免费获取积分";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        
        UIButton* brackButton = [UIButton buttonWithType:UIButtonTypeCustom];
        brackButton.frame = CGRectMake(0, 0, 60, CBWALL_WALL_LIST_TITLE_HEIGHT);
        brackButton.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
        [brackButton setTitle:@"<" forState:UIControlStateNormal];
        [brackButton addTarget:self action:@selector(brackButSelector) forControlEvents:UIControlEventTouchDown];
        [self addSubview:brackButton];
        
    }
    return self;
}

-(void) showIntegralWallView
{
    [UIView beginAnimations:nil context:nil];//动画开始
    [UIView setAnimationDuration:0.3];
    
    self.frame = CGRectMake(0, 20, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_UISCREEN_FRAME_HEIGHT );
    
    [UIView commitAnimations];
}

-(void) hiddenIntegralWallView
{
    [UIView beginAnimations:nil context:nil];//动画开始
    [UIView setAnimationDuration:0.3];
    self.frame = CGRectMake(0, CBWALL_UISCREEN_FRAME_HEIGHT + 20, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_UISCREEN_FRAME_HEIGHT );
    [UIView commitAnimations];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target: self selector: @selector(hiddenRemoveFromView) userInfo: nil repeats: NO];
}

-(void) hiddenRemoveFromView
{
    [self removeFromSuperview];
}

-(void) brackButSelector
{
    [self hiddenIntegralWallView];
}


@end
