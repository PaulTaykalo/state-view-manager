//
//  UTStateViewFactoryProtocol
//  UAToday
//
//  Created by Paul Taykalo on 7/17/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger , UTViewState) {
    UTStateViewStateBase,
    UTStateViewStateLoading,
    UTStateViewStateNoData,
    UTStateViewStateError
};

/*
View factory
 */
@protocol UTStateViewFactoryProtocol<NSObject>


- (UIView *)viewForState:(UTViewState)state;

- (UIView *)viewForState:(UTViewState)state error:(NSError *)error;



@end