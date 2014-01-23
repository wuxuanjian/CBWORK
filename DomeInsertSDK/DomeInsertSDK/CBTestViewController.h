//
//  CBTestViewController.h
//  DomeInsertSDK
//
//  Created by EinFachMann on 13-12-20.
//  Copyright (c) 2013年 CB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBinsertScreenSDK.h"

@interface CBTestViewController : UIViewController<CBInsertScreenDeleage>

@property (nonatomic,strong) IBOutlet UITextField*  textField;

-(IBAction)textButton:(id)sender;


-(IBAction)biaoqingBut:(id)sender;

@end
