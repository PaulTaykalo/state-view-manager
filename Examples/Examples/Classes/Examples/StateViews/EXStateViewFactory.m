//
//  EXStateViewFactory
//  Examples
//
//  Created by Paul Taykalo on 7/22/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "EXStateViewFactory.h"
#import "EXLoadingStateView.h"
#import "EXErrorStateView.h"


@implementation EXStateViewFactory {

}

- (id)init {
    self = [super init];
    if (self) {


        [self addForState:UTStateViewStateBase viewCreationBlock:^UIView *(NSError * error) {
            // Nothing here for base state view
            return nil;
        }];


        [self addForState:UTStateViewStateLoading viewCreationBlock:^UIView *(NSError * error) {
            EXLoadingStateView * view = [EXLoadingStateView new];
            view.tag = 1001;
            return view;
        }];


        [self addForState:UTStateViewStateNoData viewCreationBlock:^UIView *(NSError * error) {
            UIView * view = [UIView new];
            [view setBackgroundColor:[UIColor blueColor]];
            view.tag = 1002;
            return view;
        }];


        [self addForState:UTStateViewStateError viewCreationBlock:^UIView *(NSError * error) {
            EXErrorStateView * view = [EXErrorStateView new];
            view.message = [error localizedDescription];
            view.tag = 1003;
            return view;
        }];

    }
    return self;
}

@end