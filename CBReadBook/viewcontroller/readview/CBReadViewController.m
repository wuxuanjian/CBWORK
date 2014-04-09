//
//  CBReadViewController.m
//  CBReadBook
//
//  Created by EinFachMann on 14-3-25.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBReadViewController.h"
#import "CBreadFile.h"

@interface CBReadViewController ()

@end

@implementation CBReadViewController
@synthesize textImageView1 = _textImageView1;
@synthesize textImageView2 = _textImageView2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    int index = 0;
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    index = [userDefaults integerForKey:@"NSUSERDEFAULTS_PAGE_READ"];
    
    NSString *path1 = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingFormat:@"/%d.png",index + 1];
    _textImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    UIImage* image1 = [UIImage imageWithContentsOfFile:path1];
    _textImageView1.image = image1;
    [self.view addSubview:_textImageView1];
    
    NSString *path2 = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingFormat:@"/%d.png",index];
    _textImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    UIImage* image2 = [UIImage imageWithContentsOfFile:path2];
    _textImageView2.image = image2;
    [self.view addSubview:_textImageView2];
    
    
    UIButton* leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width/2, [UIScreen mainScreen].applicationFrame.size.height)];
    [leftButton addTarget:self action:@selector(leftButtonSelector) forControlEvents:UIControlEventTouchDown];
    leftButton.titleLabel.textColor = [UIColor blueColor];
    [self.view addSubview:leftButton];
    
    UIButton* rightButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].applicationFrame.size.width/2, 0, [UIScreen mainScreen].applicationFrame.size.width/2, [UIScreen mainScreen].applicationFrame.size.height)];
    [rightButton addTarget:self action:@selector(rightButtonSelector) forControlEvents:UIControlEventTouchDown];
    rightButton.titleLabel.textColor = [UIColor blueColor];
    [self.view addSubview:rightButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


#define kDuration 0.7   // 动画持续时间(秒)
-(void) rightButtonSelector
{
    int index = 0;
    int count = 0;
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    index = [userDefaults integerForKey:@"NSUSERDEFAULTS_PAGE_READ"];
    count = [userDefaults integerForKey:@"NSUSERDEFAULTS_PAGE_COUNT"];
    index++;
    if(index > count)
    {
        return;
    }
    
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingFormat:@"/%d.png",index];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    if((index+1)%2 == 0)
    {
        _textImageView2.image = image;
    }
    else
    {
        _textImageView1.image = image;
    }
    [userDefaults setInteger:index forKey:@"NSUSERDEFAULTS_PAGE_READ"];
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionReveal;
    animation.subtype = kCATransitionFromRight;
    
    NSUInteger green = [[self.view subviews] indexOfObject:_textImageView1];
    NSUInteger blue = [[self.view subviews] indexOfObject:_textImageView2];
    [self.view exchangeSubviewAtIndex:green withSubviewAtIndex:blue];
    
    [[self.view layer] addAnimation:animation forKey:@"animation"];
}

-(void) leftButtonSelector
{
    int index = 0;
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    index = [userDefaults integerForKey:@"NSUSERDEFAULTS_PAGE_READ"];
    index--;
    if (index < 0)
    {
        return;
    }
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingFormat:@"/%d.png",index];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    if((index)%2 == 0)
    {
        _textImageView2.image = image;
    }
    else
    {
        _textImageView1.image = image;
    }
    [userDefaults setInteger:index forKey:@"NSUSERDEFAULTS_PAGE_READ"];
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionMoveIn;
    animation.subtype = kCATransitionFromLeft;
    
    NSUInteger green = [[self.view subviews] indexOfObject:_textImageView1];
    NSUInteger blue = [[self.view subviews] indexOfObject:_textImageView2];
    [self.view exchangeSubviewAtIndex:green withSubviewAtIndex:blue];
    [[self.view layer] addAnimation:animation forKey:@"animation"];
}


+(void) generateImage
{
    UIView* textViewBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height)];
    UITextView* textFileView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height)];
    textFileView.font = [UIFont systemFontOfSize:17];
    //    _textFileView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    [textFileView setEditable:NO];
    [textViewBgView addSubview:textFileView];
    NSString* str = [CBreadFile readTextFile];
    textFileView.text = str;
    textFileView.contentOffset = CGPointMake(0, 0);
    
    NSString* str1 = @"小说";
    CGSize  size = [str1 sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(320, 480)];
    CGFloat strH = size.height;
    NSInteger cont = (textFileView.frame.size.height - 20)/strH;
    CGFloat textContentSizeH = cont*strH;
    
    CGFloat y = 0;
    int i = 0;
    for (i = 0;  1 ; i++ )
    {
        y = i * textContentSizeH - 11;
        textFileView.contentOffset = CGPointMake(0, y);
        CGFloat h = textFileView.contentSize.height;
        NSLog(@"y = %f, h = %f",y,h);
        if(y > h)
        {
            break;
        }
        [CBReadViewController screenShotFrom:textFileView.superview frame:CGRectMake(0, 0, 320, textContentSizeH)];
    }
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:i forKey:@"NSUSERDEFAULTS_PAGE_COUNT"];
    [userDefaults setInteger:0 forKey:@"NSUSERDEFAULTS_PAGE_READ"];
}

+(UIImage *) screenShotFrom:(UIView *)view frame:(CGRect)frame
{
    if(UIGraphicsBeginImageContextWithOptions != NULL)
    {
        UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0);
    } else {
        UIGraphicsBeginImageContext(frame.size);
    }
    
    //获取图像
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    static int indexMap = 0;
    //保存图像
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingFormat:@"/%d.png",indexMap];

    if ([UIImagePNGRepresentation(image) writeToFile:path atomically:YES]) {
        indexMap += 1;
        NSLog(@"Succeeded!");
    }
    else {
        NSLog(@"Failed!");
    }
    return image;
}



@end
