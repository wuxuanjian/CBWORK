//
//  CBAdDetailsView.m
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBAdDetailsView.h"

@implementation CBAdDetailsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.frame = CGRectMake(-300, -300, 280, 250);
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

-(void) showIntegralWallView
{
    [UIView beginAnimations:nil context:nil];//动画开始
     [UIView  setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.4];
    
    self.frame = CGRectMake(20, 80, 280, 250 );
    [UIView commitAnimations];
    
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


@end
