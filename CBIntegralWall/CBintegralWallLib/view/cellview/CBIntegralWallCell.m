//
//  CBIntegralWallCell.m
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBIntegralWallCell.h"
#import "SvIncrementallyImage.h"

@implementation CBIntegralWallCell
@synthesize iconImageView = _iconImageView;
@synthesize svincrementallyImage = _svincrementallyImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void) showIntegralWall:(CBIntegralWallModel*)mode cellWidth:(CGFloat)width
{
    self.frame = CGRectMake(0, 0, width, self.frame.size.height);
    
    _svincrementallyImage = mode.svincrementallyImage;
    
    self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    UILabel* iconLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 60, 40)];
    iconLabel.textColor = [UIColor whiteColor];
    iconLabel.backgroundColor = [UIColor clearColor];
    iconLabel.font = [UIFont boldSystemFontOfSize:20];
    iconLabel.textAlignment = NSTextAlignmentCenter;
    iconLabel.text = @"icon";
    [self addSubview:iconLabel];
    
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
    _iconImageView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
    _iconImageView.image = _svincrementallyImage.image;
    [self addSubview:_iconImageView];
    
    UILabel* adNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 7, width - 150, 30)];
    adNameLabel.backgroundColor = [UIColor clearColor];
    adNameLabel.text = mode.adName;
    adNameLabel.font = [UIFont systemFontOfSize:20];
    adNameLabel.textColor = [UIColor blackColor];
    [self addSubview:adNameLabel];
    
    UILabel* adDetailsLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 34, width - 150, 15)];
    adDetailsLabel.backgroundColor = [UIColor clearColor];
    adDetailsLabel.text = mode.adDetails;
    adDetailsLabel.font = [UIFont systemFontOfSize:13];
    adDetailsLabel.textColor = [UIColor grayColor];
    [self addSubview:adDetailsLabel];
    
    UILabel* adPointDetailsLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 52, width - 150, 15)];
    adPointDetailsLabel.backgroundColor = [UIColor clearColor];
    adPointDetailsLabel.text = mode.adPointDetails;
    adPointDetailsLabel.font = [UIFont systemFontOfSize:13];
    adPointDetailsLabel.textColor = [UIColor grayColor];
    [self addSubview:adPointDetailsLabel];
    
    UIView* pointBgView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width - 60, 0, 60, 79)];
    pointBgView.backgroundColor = [UIColor orangeColor];
    [self addSubview:pointBgView];
    
    UILabel* pointLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 60, 20, 60, 20)];
    pointLabel.backgroundColor = [UIColor clearColor];
    pointLabel.text = mode.adPoint;
    pointLabel.textColor = [UIColor whiteColor];
    pointLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:pointLabel];
    
    UILabel* pointTestLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 60, 40, 60, 20)];
    pointTestLabel.backgroundColor = [UIColor clearColor];
    pointTestLabel.text = @"积分";
    pointTestLabel.textColor = [UIColor whiteColor];
    pointTestLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:pointTestLabel];
    
        _iconTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target: self selector: @selector(showIconSelector) userInfo: nil repeats: YES];
    
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
