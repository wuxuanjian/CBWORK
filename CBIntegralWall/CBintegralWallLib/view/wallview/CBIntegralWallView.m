//
//  CBIntegralWallView.m
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBIntegralWallView.h"

@interface CBIntegralWallView()
{
    
}
@property (nonatomic,strong) CBintegralWallListView* integralWallListView;
@property (nonatomic,strong) UIView* headView;
@property (nonatomic,strong) UILabel* titleLabel;
@property (nonatomic,strong) UIButton* brackButton;

@end

@implementation CBIntegralWallView
@synthesize integralWallListView = _integralWallListView;
@synthesize headView = _headView;
@synthesize titleLabel = _titleLabel;
@synthesize brackButton = _brackButton;
@synthesize screenAnimated = _screenAnimated;

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
        _integralWallListView.sonViewForm = _integralWallListView.frame;
        [self addSubview:_integralWallListView];
        
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_WALL_LIST_TITLE_HEIGHT)];
        _headView.backgroundColor = [UIColor blueColor];
        [self addSubview:_headView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_WALL_LIST_TITLE_HEIGHT)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.text = @"免费获取积分";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        
        _brackButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _brackButton.frame = CGRectMake(0, 0, 60, CBWALL_WALL_LIST_TITLE_HEIGHT);
        _brackButton.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
        [_brackButton setTitle:@"<" forState:UIControlStateNormal];
        [_brackButton addTarget:self action:@selector(brackButSelector) forControlEvents:UIControlEventTouchDown];
        [self addSubview:_brackButton];
    }
    return self;
}

-(void) showIntegralWallView:(CGRect)rectForm
{
    if (!_screenAnimated)
    {
        self.frame = rectForm;
    }
    else
    {
        _screenAnimated = NO;
        [UIView animateWithDuration:0.3 animations:^{
            
            self.frame = rectForm;

        }];
//        [UIView beginAnimations:nil context:nil];//动画开始
//        [UIView setAnimationDuration:0.3];
//        
//        self.frame = rectForm;
//        
//        [UIView commitAnimations];
        
    }
}



-(void) sonViewForm:(CGRect)rectForm
{
    CGFloat listViewHeight = rectForm.size.height;
    CGFloat listViewWidth = rectForm.size.width;
    CGFloat listViewY = 0.0;
    //        if (CBWALL_IOS7_OR_LATER)
    {
        listViewY = CBWALL_WALL_LIST_TITLE_HEIGHT;
        listViewHeight = listViewHeight - listViewY;
    }
    _integralWallListView.frame = CGRectMake(0, listViewY, listViewWidth, listViewHeight);
    _integralWallListView.sonViewForm = _integralWallListView.frame;
    
    _headView.frame = CGRectMake(0, 0, listViewWidth, CBWALL_WALL_LIST_TITLE_HEIGHT);
    _titleLabel.frame = CGRectMake(0, 0, listViewWidth, CBWALL_WALL_LIST_TITLE_HEIGHT);
    _brackButton.frame = CGRectMake(0, 0, 60, CBWALL_WALL_LIST_TITLE_HEIGHT);
}

-(void) hiddenIntegralWallView
{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, self.frame.size.height + 20, self.frame.size.width, self.frame.size.height);
    }];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target: self selector: @selector(hiddenRemoveFromView) userInfo: nil repeats: NO];
}

-(void) hiddenRemoveFromView
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeFromSuperview];
}

-(void) brackButSelector
{
    [self hiddenIntegralWallView];
}


//屏幕旋转监听
-(void) notificationCenter
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:)
												 name:UIDeviceOrientationDidChangeNotification object:nil];
}
#pragma mark -
#pragma mark 屏幕旋转

#define RADIANS(degrees) ((degrees * (float)M_PI) / 180.0f)

- (void)deviceOrientationDidChange:(NSNotification *)notification
{
	if (!self.superview)
    {
		return;
	}
	
	if ([self.superview isKindOfClass:[UIWindow class]])
    {
		[self setTransformForCurrentOrientation:YES];
	} else
    {
		self.frame = self.superview.bounds;
        //        self.bounds = self.superview.bounds;
		[self setNeedsDisplay];
	}
}

- (void)setTransformForCurrentOrientation:(BOOL)animated
{
	UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
	NSInteger degrees = 0;
	
	// Stay in sync with the superview
	if (self.superview)
    {
		self.bounds = self.superview.bounds;
		[self setNeedsDisplay];
	}
	
	if (UIInterfaceOrientationIsLandscape(orientation))
    {
		if (orientation == UIInterfaceOrientationLandscapeLeft)
        {
            degrees = -90;
        }
		else
        {
            degrees = 90;
        }
		// Window coordinates differ!
		self.bounds = CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.width);
	}
    else
    {
		if (orientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            degrees = 0;
        }
		else
        {
            degrees = 0;
        }
        self.bounds = CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.width);
	}
    self.backgroundColor = [UIColor clearColor];

	CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(RADIANS(degrees));
    

	[self setTransform:rotationTransform];

    if (UIInterfaceOrientationIsLandscape(orientation))
    {
		if (orientation == UIInterfaceOrientationLandscapeLeft)
        {
            [self showIntegralWallView:CGRectMake(20, 0, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_UISCREEN_FRAME_HEIGHT)];
            [self sonViewForm:CGRectMake(0, 0, CBWALL_UISCREEN_FRAME_HEIGHT, CBWALL_UISCREEN_FRAME_WIDTH)];
        }
		else
        {
            [self showIntegralWallView:CGRectMake(0, 0, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_UISCREEN_FRAME_HEIGHT)];
            [self sonViewForm:CGRectMake(0, 0, CBWALL_UISCREEN_FRAME_HEIGHT, CBWALL_UISCREEN_FRAME_WIDTH)];
        }
	}
    else
    {
		if (orientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            [self showIntegralWallView:CGRectMake(0, 20, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_UISCREEN_FRAME_HEIGHT )];
            [self sonViewForm:CGRectMake(0, 0, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_UISCREEN_FRAME_HEIGHT)];
        }
		else
        {
            [self showIntegralWallView:CGRectMake(0, 20, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_UISCREEN_FRAME_HEIGHT )];
            [self sonViewForm:CGRectMake(0, 0, CBWALL_UISCREEN_FRAME_WIDTH, CBWALL_UISCREEN_FRAME_HEIGHT)];
        }
	}
    
}


@end
