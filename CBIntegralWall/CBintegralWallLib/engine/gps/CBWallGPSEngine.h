//
//  CBWallGPSEngine.h
//  CBIntegralWall
//
//  Created by EinFachMann on 14-3-20.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

typedef void (^CBLocationNameBlock)(BOOL aState);
@interface CBWallGPSEngine : NSObject<CLLocationManagerDelegate,MKReverseGeocoderDelegate>
{
    CLLocationCoordinate2D _coordinate;
    CLGeocoder *_geoCoder;
    MKReverseGeocoder *_reverseGeocoder;
}

@property (nonatomic,strong) CLLocationManager* locationManage;
@property (nonatomic, strong) CLGeocoder *geoCoder;
@property (nonatomic, strong) MKReverseGeocoder *reverseGeocoder;

- (id)init;
- (void)startLocation:(CBLocationNameBlock)locatBlock;
-(void) stopLocation;


@end
