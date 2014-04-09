//
//  CBreadFile.m
//  CBReadBook
//
//  Created by EinFachMann on 14-3-24.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBreadFile.h"
#include <stdio.h>

@implementation CBreadFile



+(NSString*) readTextFile
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    NSArray *arr = [content componentsSeparatedByString:@" "];
    return content;
}


//文件分段读取
+(NSString *) readfile
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"txt"];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    [fileHandle seekToFileOffset:2000]; //开始位置
    NSData *data = [fileHandle readDataOfLength:2000]; //读取长度
    NSString *mmmmmmm = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"mmmmm = %@",mmmmmmm);
    [fileHandle closeFile];
    
    return mmmmmmm;
}


+(void) loadFileContentsIntoTextView
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"txt"];
    char *char_path = (char *)[path cStringUsingEncoding:NSASCIIStringEncoding];

    FILE *fp= fopen(char_path,"r");  /*文本方式打开*/
    
    char x[4230];
    fread(x,200,12 ,fp);
    printf(x);
    char c;
    while(!feof(fp))
    {
        c = fgetc(fp);
        if(!feof(fp))  /*双重判断，防止到达文件末尾时最后一个数据被读取两次*/
        {
            putchar(c);   /**/
        }
    }
    fclose(fp);  /*关闭文件流*/
}


@end
