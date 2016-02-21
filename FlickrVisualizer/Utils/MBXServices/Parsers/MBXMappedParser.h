//
//  MBXMappedParser.h
//  FlickrVisualizer
//
//  Created by Tamara Bernad on 21/02/16.
//  Copyright © 2016 Tamara Bernad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBXBaseParseParser.h"

@interface MBXMappedParser : MBXBaseParseParser
+ (instancetype)newParserWithModelClass:(Class)modelClass andMapping:(NSDictionary *)mapping;
@end
