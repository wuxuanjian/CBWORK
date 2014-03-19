//
//  CBMainViewController.h
//  WooTest
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBAppDelegate.h"

@interface CBMainViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *titleTextField;
@property (retain, nonatomic) IBOutlet UITextField *contentTextField;
@property (strong,nonatomic) CBAppDelegate *myDelegate;
@property (strong,nonatomic) NSMutableArray *entries;

//单击按钮后执行数据保存操作
- (IBAction)addToDB:(id)sender;

//单击按钮后执行查询操作
- (IBAction)queryFromDB:(id)sender;

//当通过键盘在UITextField中输入完毕后，点击屏幕空白区域关闭键盘的操作
-(IBAction)backgroundTapped:(id)sender;


@end
