//
//  CBTestViewController.m
//  DomeInsertSDK
//
//  Created by EinFachMann on 13-12-20.
//  Copyright (c) 2013年 CB. All rights reserved.
//

#import "CBTestViewController.h"


@interface CBTestViewController ()

@end

@implementation CBTestViewController
@synthesize textField = _textField;

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
    [CBinsertScreenSDK insertScreenSDKView:self.view adDeleage:self];
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

-(IBAction)biaoqingBut:(id)sender
{
    NSLog(@"\U0001f42f _textfield.text%@", _textField.text);
}


@end
