//
//  CBIntegralWallCell.m
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBIntegralWallCell.h"

@implementation CBIntegralWallCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) showIntegralWall:(CBIntegralWallModel*)mode
{
    UIImageView* iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
    iconImageView.backgroundColor = [UIColor redColor];
    [self addSubview:iconImageView];
    
    UILabel* adNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 7, 170, 30)];
    adNameLabel.backgroundColor = [UIColor clearColor];
    adNameLabel.text = mode.adName;
    adNameLabel.font = [UIFont systemFontOfSize:20];
    adNameLabel.textColor = [UIColor blackColor];
    [self addSubview:adNameLabel];
    
    UILabel* adDetailsLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 34, 170, 15)];
    adDetailsLabel.backgroundColor = [UIColor clearColor];
    adDetailsLabel.text = mode.adDetails;
    adDetailsLabel.font = [UIFont systemFontOfSize:13];
    adDetailsLabel.textColor = [UIColor grayColor];
    [self addSubview:adDetailsLabel];
    
    UILabel* adPointDetailsLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 52, 170, 15)];
    adPointDetailsLabel.backgroundColor = [UIColor clearColor];
    adPointDetailsLabel.text = mode.adPointDetails;
    adPointDetailsLabel.font = [UIFont systemFontOfSize:13];
    adPointDetailsLabel.textColor = [UIColor blueColor];
    [self addSubview:adPointDetailsLabel];
    
    UIView* pointBgView = [[UIView alloc] initWithFrame:CGRectMake(260, 0, 60, 79)];
    pointBgView.backgroundColor = [UIColor yellowColor];
    [self addSubview:pointBgView];
    
    UILabel* pointLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 20, 60, 20)];
    pointLabel.backgroundColor = [UIColor clearColor];
    pointLabel.text = mode.adPoint;
    pointLabel.textColor = [UIColor blackColor];
    pointLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:pointLabel];
    
    UILabel* pointTestLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 40, 60, 20)];
    pointTestLabel.backgroundColor = [UIColor clearColor];
    pointTestLabel.text = @"积分";
    pointTestLabel.textColor = [UIColor blackColor];
    pointTestLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:pointTestLabel];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
