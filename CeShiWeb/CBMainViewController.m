//
//  CBMainViewController.m
//  CeShiWeb
//
//  Created by EinFachMann on 14-4-1.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBMainViewController.h"

@interface CBMainViewController ()

@end

@implementation CBMainViewController
@synthesize webView = _webView;


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
    
    NSString *filePath = [CBMainViewController dbPath];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: filePath]]];
    // Do any additional setup after loading the view from its nib.
}


+(NSString *) dbPath
{
    NSString *dbPath = nil;
    
    if (!dbPath)
    {
        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex: 0];
        
        dbPath = [documentPath stringByAppendingPathComponent: [NSString stringWithFormat:@"HTML/%@.%@",@"index", @"html"]];
        
        NSLog(@"dbPath = %@", dbPath);
    }
    
    return dbPath;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
