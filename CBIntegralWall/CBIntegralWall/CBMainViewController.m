//
//  CBMainViewController.m
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBMainViewController.h"
#import "CBIntegralWallList.h"

@interface CBMainViewController ()

@end

@implementation CBMainViewController

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
    
    UIButton* button1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 300, 45)];
    button1.backgroundColor = [UIColor greenColor];
    [button1 addTarget:self action:@selector(buttonpageselector) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button1];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonpageselector
{
    [CBIntegralWallList addAdListView];
}

@end
