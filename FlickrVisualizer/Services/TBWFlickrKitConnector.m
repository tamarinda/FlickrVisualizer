//
//  TBWFlickrKitConnector.m
//  FlickrVisualizer
//
//  Created by Tamara Bernad on 20/02/16.
//  Copyright © 2016 Tamara Bernad. All rights reserved.
//

#import "TBWFlickrKitConnector.h"
#import "FlickrKit.h"

@implementation TBWFlickrKitConnector
- (void)getObjectsWithParams:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    [[FlickrKit sharedFlickrKit] call:@"flickr.photos.search" args:params maxCacheAge:FKDUMaxAgeOneHour completion:^(NSDictionary *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (response) {
                success(response);
            } else {
                if(failure)failure(error);
            }
        });
    }];
}
- (void)getObjectWithParams:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    [[FlickrKit sharedFlickrKit] call:@"flickr.photos.getInfo" args:params maxCacheAge:FKDUMaxAgeOneHour completion:^(NSDictionary *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (response) {
                success(response);
            } else {
                if(failure)failure(error);
            }
        });
    }];
}
@end
