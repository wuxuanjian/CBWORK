//
//  CBReadViewController.h
//  CBReadBook
//
//  Created by EinFachMann on 14-3-25.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBReadViewController : UIViewController<UITextViewDelegate>

@property (nonatomic,strong) UIImageView* textImageView1;
@property (nonatomic,strong) UIImageView* textImageView2;

+(void) generateImage;
@end
