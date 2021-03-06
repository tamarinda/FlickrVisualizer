//
//  MBXBaseService.m
//  sven-10
//
//  Created by Tamara Bernad on 27/09/15.
//  Copyright (c) 2015 moodbox. All rights reserved.
//

#import "MBXBaseService.h"
@implementation MBXBaseService
- (id)initWithParser:(id<MBXServiceParserProtocol>)parser
        AndConnector:(id<MBXServiceConnectorProtocol>)connector{
    
    if(!(self = [super init]))return nil;
    
    self.parser = parser;
    self.connector = connector;
    
    return self;
}
- (void)getObjectsWithParams:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    MBXBaseService __weak *weakSelf = self;
    [self.connector getObjectsWithParams:params success:^(id responseObject) {
        if(weakSelf.parser != nil)
            [weakSelf.parser processDataArray:responseObject WithCompletion:success];
        else
            success(responseObject);
    } failure:failure];
}
- (void)getObjectWithParams:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    MBXBaseService __weak *weakSelf = self;
    [self.connector getObjectWithParams:params success:^(id responseObject) {
        if(weakSelf.parser != nil)
            [weakSelf.parser processWithData:responseObject AndCompletion:success];
        else
            success(responseObject);
    } failure:failure];
}
@end
