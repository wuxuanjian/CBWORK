//
//  CBAdDetailsBgView.m
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-20.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBAdDetailsBgView.h"

@implementation CBAdDetailsBgView
@synthesize adDetailsView = _adDetailsView;
@synthesize sonViewForm = _sonViewForm;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
    }
    return self;
}

-(void) showAdDetailsView:(CBIntegralWallModel*)model
{
    CGFloat adDetailsViewX = 30;
    CGFloat adDetailsViewy = 30;
    CGFloat adDetailsViewW = 260;
    CGFloat adDetailsViewH = 300;
    if(self.frame.size.width == 320)
    {
        adDetailsViewW = 260;
        adDetailsViewH = 300;
        
    }
    else if(self.frame.size.width > 600)
    {
        adDetailsViewW = 400;
        adDetailsViewH = 320;
    }
    else
    {
        adDetailsViewW = 400;
        adDetailsViewH = 230;
    }
    _adDetailsView = [[CBAdDetailsView alloc] initWithFrame:CGRectMake(-300, -100, adDetailsViewW, adDetailsViewH)];
    [self addSubview:_adDetailsView];
    [_adDetailsView showDetailsView:model bgViewObj:self];

    adDetailsViewX = (self.frame.size.width-adDetailsViewW)/2;
    adDetailsViewy = (self.frame.size.height-adDetailsViewH)/2;
    [_adDetailsView showIntegralWallView:CGRectMake(adDetailsViewX, adDetailsViewy, adDetailsViewW, adDetailsViewH )];
    _adDetailsView.sonViewForm = _adDetailsView.frame;
}

-(void) hiddenRemoveFromView
{
    [self removeFromSuperview];
}

-(void) setSonViewForm:(CGRect)sonViewForm
{
    CGFloat adDetailsViewX = 30;
    CGFloat adDetailsViewy = 30;
    CGFloat adDetailsViewW = 260;
    CGFloat adDetailsViewH = 300;
    
    if(sonViewForm.size.width == 320)
    {
        adDetailsViewW = 260;
        adDetailsViewH = 300;
        
    }
    else if(sonViewForm.size.width > 600)
    {
        adDetailsViewW = 420;
        adDetailsViewH = 360;
    }
    else
    {
        adDetailsViewW = 400;
        adDetailsViewH = 230;
    }
    adDetailsViewX = (self.frame.size.width-adDetailsViewW)/2;
    adDetailsViewy = (self.frame.size.height-adDetailsViewH)/2;
    _adDetailsView.frame = CGRectMake(adDetailsViewX, adDetailsViewy, adDetailsViewW, adDetailsViewH );
    _adDetailsView.sonViewForm = _adDetailsView.frame;
}


@end
