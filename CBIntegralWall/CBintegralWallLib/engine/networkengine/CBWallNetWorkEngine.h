//
//  CBWallNetWorkEngine.h
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-20.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkKit.h"    // MKNetWorkKit 网络第三方库

typedef void (^CBNetWorkComplete)(NSString* responseString);
typedef void (^CBNetWorkError)(NSError* err);
@interface CBWallNetWorkEngine : MKNetworkEngine
-(MKNetworkOperation*) postDataToServer:(CBNetWorkComplete)completeblock netWorkError:(CBNetWorkError)errorblock;

@end
