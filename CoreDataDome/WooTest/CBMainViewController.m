//
//  CBMainViewController.m
//  WooTest
//
//  Created by EinFachMann on 14-3-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBMainViewController.h"
#import "CBEntity.h"

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

@synthesize titleTextField;
@synthesize contentTextField;
@synthesize myDelegate = _myDelegate;
@synthesize entries = _entries;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //获取当前应用程序的委托（UIApplication sharedApplication为整个应用程序上下文）
    self.myDelegate = (CBAppDelegate *)[[UIApplication sharedApplication] delegate];
    
}

- (void)viewDidUnload
{
    [self setTitleTextField:nil];
    [self setContentTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



//单击按钮后执行数据保存操作
- (IBAction)addToDB:(id)sender {
    
    //让CoreData在上下文中创建一个新对象(托管对象)
    CBEntity *entry = (CBEntity *)[NSEntityDescription insertNewObjectForEntityForName:@"CBEntity" inManagedObjectContext:self.myDelegate.managedObjectContext];
    
    [entry setName:self.titleTextField.text];
    [entry setAge:self.contentTextField.text];
    [entry setEndate:[NSDate date]];
    
    NSError *error;
    
    //托管对象准备好后，调用托管对象上下文的save方法将数据写入数据库
    BOOL isSaveSuccess = [self.myDelegate.managedObjectContext save:&error];
    
    if (!isSaveSuccess) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Save successful!");
    }
}

//单击按钮后执行查询操作
- (IBAction)queryFromDB:(id)sender {
    //创建取回数据请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    //设置要检索哪种类型的实体对象
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CBEntity"inManagedObjectContext:self.myDelegate.managedObjectContext];
    //设置请求实体
    [request setEntity:entity];
    //指定对结果的排序方式
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"endate"ascending:NO];
    NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptions];
    
    NSError *error = nil;
    //执行获取数据请求，返回数组
    NSMutableArray *mutableFetchResult = [[self.myDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    self.entries = mutableFetchResult;
    
    NSLog(@"The count of entry:%i",[self.entries count]);
    
    for (CBEntity *entry in self.entries) {
        NSLog(@"Title:%@---Content:%@---Date:%@",entry.name,entry.age,entry.endate);
    }
    
}

//更新操作
-(void)updateEntry:(CBEntity *)entry
{
    [entry setName:self.titleTextField.text];
    [entry setAge:self.contentTextField.text];
    [entry setEndate:[NSDate date]];
    
    NSError *error;
    BOOL isUpdateSuccess = [self.myDelegate.managedObjectContext save:&error ];
    if (!isUpdateSuccess) {
        NSLog(@"Error:%@,%@",error,[error userInfo]);
    }
}

//删除操作
-(void)deleteEntry:(CBEntity *)entry
{
    [self.myDelegate.managedObjectContext deleteObject:entry];
    [self.entries removeObject:entry];
    
    NSError *error;
    if (![self.myDelegate.managedObjectContext save:&error]) {
        NSLog(@"Error:%@,%@",error,[error userInfo]);
    }
}

//当通过键盘在UITextField中输入完毕后，点击屏幕空白区域关闭键盘的操作
-(IBAction)backgroundTapped:(id)sender
{
    [titleTextField resignFirstResponder];
    [contentTextField resignFirstResponder];
}
@end
