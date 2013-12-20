//
//  CBTestViewController.m
//  DomeInsertSDK
//
//  Created by EinFachMann on 13-12-20.
//  Copyright (c) 2013年 CB. All rights reserved.
//

#import "CBTestViewController.h"
#import "CBinsertScreenSDK.h"

@interface CBTestViewController ()

@end

@implementation CBTestViewController

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
    [CBinsertScreenSDK insertScreenSDK];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textButton:(id)sender
{
    [CBinsertScreenSDK showInsertScreenSDK];
}

@end
