//
//  TBWThumbsVM.h
//  FlickrVisualizer
//
//  Created by Tamara Bernad on 20/02/16.
//  Copyright © 2016 Tamara Bernad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBXListViewModelProtocol.h"
#import "TBWFlickrPhoto.h"

@protocol TBWThumbsVMDelegate;
@interface TBWThumbsVM : NSObject<MBXListViewModelProtocol>

@property(nonatomic, weak)id<TBWThumbsVMDelegate> delegate;
- (void)retrieveDataForPage:(NSInteger)page;
- (void)setNumberOfItemsPerPage:(NSInteger)nItemsPerPage;
- (void)checkDataForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)getFlickrPhotoIdAtIndexPath:(NSIndexPath *)indexPath;
- (void)setTags:(NSArray *)tags;
@end

@protocol TBWThumbsVMDelegate <NSObject>
- (void)TBWThumbsVMDidLoadData:(TBWThumbsVM *)viewModel;
@end