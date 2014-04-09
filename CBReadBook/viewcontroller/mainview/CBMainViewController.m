//
//  CBMainViewController.m
//  CBReadBook
//
//  Created by EinFachMann on 14-3-24.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBMainViewController.h"
#import "CBReadViewController.h"
#import "CBreadFile.h"

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
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor greenColor];
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(20, 80, 300, 40)];
    [button setTitle:@"Read" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(readButSelector) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [CBReadViewController generateImage];
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

-(void) readButSelector
{
    CBReadViewController* readview = [[CBReadViewController alloc] init];
    [self.navigationController pushViewController:readview animated:YES];
}

@end
