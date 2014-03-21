//
//  CBAdDetailsView.m
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBAdDetailsView.h"
#import "SvIncrementallyImage.h"
#import <QuartzCore/QuartzCore.h>

@interface CBAdDetailsView()
{
    
}
@property (nonatomic,strong) UIImageView* iconImageView;
@property (nonatomic,strong) UILabel* iconLabel ;
@property (nonatomic,strong) UILabel* adNameLabel;
@property (nonatomic,strong) UILabel* adDetailsLabel;
@property (nonatomic,strong) UIButton* closeBut;
@property (nonatomic,strong) UILabel* adPointTitleLabel;
@property (nonatomic,strong) UILabel* adPointLabel;
@property (nonatomic,strong) UITextView* adDescription;
@property (nonatomic,strong) UIButton* downloadBut;
@end

@implementation CBAdDetailsView
@synthesize adModel = _adModel;
@synthesize adDetailsBgView = _adDetailsBgView;
@synthesize svincrementallyImage = _svincrementallyImage;
@synthesize iconImageView = _iconImageView;
@synthesize iconTimer = _iconTimer;
@synthesize iconLabel = _iconLabel;
@synthesize adNameLabel = _adNameLabel;
@synthesize adDetailsLabel = _adDetailsLabel;
@synthesize closeBut = _closeBut;
@synthesize adPointTitleLabel = _adPointTitleLabel;
@synthesize adPointLabel = _adPointLabel;
@synthesize adDescription = _adDescription;
@synthesize downloadBut = _downloadBut;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.alpha = 0.0;
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
    }
    return self;
}

-(void) showDetailsView:(CBIntegralWallModel*)model bgViewObj:(UIView*)bgview
{
    
    _adModel = model;
    _adDetailsBgView = bgview;
    
    _svincrementallyImage = model.svincrementallyImage;
    
    _iconLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 70, 40)];
    _iconLabel.textColor = [UIColor whiteColor];
    _iconLabel.backgroundColor = [UIColor clearColor];
    _iconLabel.font = [UIFont boldSystemFontOfSize:22];
    _iconLabel.textAlignment = NSTextAlignmentCenter;
    _iconLabel.text = @"icon";
    [self addSubview:_iconLabel];
    
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 70, 70)];
    _iconImageView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
    _iconImageView.image = _svincrementallyImage.image;
    [self addSubview:_iconImageView];
    
    _adNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 10, 130, 30)];
    _adNameLabel.font = [UIFont systemFontOfSize:20];
    _adNameLabel.backgroundColor = [UIColor clearColor];
    _adNameLabel.textColor = [UIColor blackColor];
    _adNameLabel.text = _adModel.adName;
    [self addSubview:_adNameLabel];
    
    _adDetailsLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 40, 130, 30)];
    _adDetailsLabel.font = [UIFont systemFontOfSize:15];
    _adDetailsLabel.backgroundColor = [UIColor clearColor];
    _adDetailsLabel.textColor = [UIColor grayColor];
    _adDetailsLabel.text = _adModel.adDetails;
    [self addSubview:_adDetailsLabel];
    
    _closeBut = [UIButton buttonWithType:UIButtonTypeCustom];
    _closeBut.frame = CGRectMake(220, 0, 40, 40);
    _closeBut.titleLabel.font = [UIFont systemFontOfSize:24];
    [_closeBut setTitle:@"X" forState:UIControlStateNormal];
    _closeBut.titleLabel.textColor = [UIColor whiteColor];
    [_closeBut addTarget:self action:@selector(closeButSelector) forControlEvents:UIControlEventTouchDown];
    [self addSubview:_closeBut];
    
    _adPointTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 100, 50)];
    _adPointTitleLabel.font = [UIFont systemFontOfSize:17];
    _adPointTitleLabel.backgroundColor = [UIColor grayColor];
    _adPointTitleLabel.textColor = [UIColor blackColor];
    _adPointTitleLabel.textAlignment = NSTextAlignmentRight;
    _adPointTitleLabel.text = @"获得积分：";
    [self addSubview:_adPointTitleLabel];
    
    _adPointLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 90, 160, 50)];
    _adPointLabel.font = [UIFont systemFontOfSize:17];
    _adPointLabel.backgroundColor = [UIColor grayColor];
    _adPointLabel.textColor = [UIColor blueColor];
    _adPointLabel.text = [NSString stringWithFormat:@"%@积分",_adModel.adPoint];
    [self addSubview:_adPointLabel];
    
    _adDescription = [[UITextView alloc] initWithFrame:CGRectMake(10, 140, 240, 100)];
    _adDescription.backgroundColor = [UIColor clearColor];
    _adDescription.font = [UIFont systemFontOfSize:12];
    _adDescription.textColor = [UIColor blackColor];
    _adDescription.text = _adModel.adPointDetails;
    [_adDescription setEditable:NO];
    [self addSubview:_adDescription];
    
    _downloadBut = [UIButton buttonWithType:UIButtonTypeCustom];
    _downloadBut.frame = CGRectMake(10, 250, 240, 40);
    _downloadBut.backgroundColor = [UIColor orangeColor];
    [_downloadBut setTitle:@"下载安装" forState:UIControlStateNormal];
    [_downloadBut addTarget:self action:@selector(DownloadButSelector) forControlEvents:UIControlEventTouchDown];
    [self addSubview:_downloadBut];
    
    
    _iconTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target: self selector: @selector(showIconSelector) userInfo: nil repeats: YES];
}

-(void) setSonViewForm:(CGRect)sonViewForm
{
    _iconLabel.frame = CGRectMake(10, 25, 70, 40);
    _iconImageView.frame = CGRectMake(10, 10, 70, 70);
    _adNameLabel.frame  = CGRectMake(90, 10, sonViewForm.size.width -130, 30);
    _adDetailsLabel.frame = CGRectMake(90, 40, sonViewForm.size.width -130, 30);
    _closeBut.frame = CGRectMake(sonViewForm.size.width - 40, 0, 40, 40);
    _adPointTitleLabel.frame = CGRectMake(0, 85, 100, 50);
    _adPointLabel.frame = CGRectMake(100, 85, sonViewForm.size.width - 100, 50);
    _adDescription.frame = CGRectMake(10, 135, sonViewForm.size.width - 20, sonViewForm.size.height - 185);
    _downloadBut.frame = CGRectMake(10, sonViewForm.size.height - 50, sonViewForm.size.width - 20, 40);
}

-(void) showIconSelector
{
    _iconImageView.image = _svincrementallyImage.image;
    if(_iconImageView.image && _iconTimer)
    {
        _iconImageView.backgroundColor = [UIColor clearColor];
        [_iconTimer invalidate];
        _iconTimer = nil;
    }
}

-(void) showIntegralWallView:(CGRect)showRect
{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1.0;
        self.frame = showRect;
        
    }];
    
    CGRect rectangleBounds1 = CGRectMake(0.0f, 0.0f, showRect.size.width+1, showRect.size.height+1);
    CGPathRef rectangleShadowPath1 = [UIBezierPath bezierPathWithRoundedRect:rectangleBounds1 byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(6, 6)].CGPath;
    self.layer.cornerRadius = 6;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0f, 3.0f);
    self.layer.shadowOpacity = 0.6;
    self.layer.shadowRadius = 1.0;
    self.layer.shadowPath = rectangleShadowPath1;
    
}

-(void) closeIntegralWallView
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 0.0;
        
    }];
}

- (void)shakeAnimationForView
{
    // 获取到当前的View
    CALayer *viewLayer = self.layer;
    
    // 获取当前View的位置
    CGPoint position = viewLayer.position;
    
    // 移动的两个终点位置
    CGPoint x = CGPointMake(position.x, position.y + 10);
    CGPoint y = CGPointMake(position.x, position.y - 10);
    
    // 设置动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    // 设置运动形式
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    // 设置开始位置
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    
    // 设置结束位置
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    
    // 设置自动反转
    [animation setAutoreverses:YES];
    
//    //设置开始时间
//    [animation setBeginTime:0.5];
    
    // 设置时间
    [animation setDuration:0.1];
    
    // 设置次数
    [animation setRepeatCount:1];
    
    // 添加上动画
    [viewLayer addAnimation:animation forKey:nil];
    
}


-(void)DownloadButSelector
{
    
}

-(void)closeButSelector
{
    [self closeIntegralWallView];
    [NSTimer scheduledTimerWithTimeInterval:0.3 target: self selector: @selector(hiddenRemoveFromView) userInfo: nil repeats: NO];
}

-(void) hiddenRemoveFromView
{
    if(_iconTimer)
    {
        [_iconTimer invalidate];
        _iconTimer = nil;
    }
    [_adDetailsBgView removeFromSuperview];
}


@end
