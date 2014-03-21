//
//  CBWallNetWorkEngine.m
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-20.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CBWallNetWorkEngine.h"

@implementation CBWallNetWorkEngine

-(MKNetworkOperation*) postDataToServer:(CBNetWorkComplete)completeblock netWorkError:(CBNetWorkError)errorblock
{
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                @"test",@"appId",
                                nil];
    
    MKNetworkOperation *op = [self operationWithPath:@"androidService/advertisingIos/findAdverByClient.h"
                                              params:dic
                                          httpMethod:@"POST"];
    //[op setUsername:@"bobs@thga.me" password:@"12345678"];
    
    [op onCompletion:^(MKNetworkOperation *operation)
     {
         NSString* responseStr = operation.responseString;
         completeblock(responseStr);
     }
             onError:^(NSError *error)
     {
         errorblock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;
}


@end
