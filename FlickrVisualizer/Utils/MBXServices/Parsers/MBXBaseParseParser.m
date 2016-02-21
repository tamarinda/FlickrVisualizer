//
//  MBXBaseParseParser.m
//  mbx
//
//  Created by Tamara Bernad on 27/09/15.
//  Copyright (c) 2015 moodbox. All rights reserved.
//

#import "MBXBaseParseParser.h"

@implementation MBXBaseParseParser
+ (instancetype)newParserWithModelClass:(Class)modelClass{
    return [[[self class] alloc] initWithModelClass:modelClass];
}
- (instancetype)initWithModelClass:(Class)modelClass{
    if(!(self == [super init]))return self;
    
    self.modelClass = modelClass;
    return self;
}
- (void)processDataArray:(NSArray *)data WithCompletion:(void (^)(id))completion{
    NSMutableArray *array = [NSMutableArray new];
    NSInteger __block nCompleted = 0;
    if (data.count == 0) {
        if(completion)completion(@[]);
    }
    for (NSObject *object in data) {
        [self processWithData:object AndCompletion:^(id result) {
            [array addObject:result];
            @synchronized(self) {
                nCompleted++;
                if (nCompleted == data.count) {
                    if(completion)completion(array);
                }
            }
        }];
    }
}
- (void)processWithData:(id)data AndCompletion:(void (^)(id))completion{
    id object = [[self.modelClass alloc] init];
    NSDictionary *objectData = (NSDictionary *)data;
    
    for (NSString *key in [objectData allKeys]) {
        if ([object respondsToSelector:NSSelectorFromString(key)] ) {
            if([[objectData valueForKey:key] isEqual:[NSNull null]]){
                [object setValue:nil forKey:key];
            }else{
                [object setValue:[objectData valueForKey:key] forKey:key];
            }
        }
    }
    if([objectData valueForKey:@"id"])[object setValue:[objectData valueForKey:@"id"] forKey:@"uid"];
    if(completion)completion(object);
}
@end
