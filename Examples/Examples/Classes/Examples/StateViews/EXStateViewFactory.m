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

        [self addStateViewCreationBlock:^UIView *(NSError * error) {
            // Nothing here for base state view
            return nil;
        }
                           forViewState:UTStateViewStateBase];


        [self addStateViewCreationBlock:^UIView *(NSError * error) {
            return [EXLoadingStateView new];
        }
                           forViewState:UTStateViewStateLoading];


        [self addStateViewCreationBlock:^UIView *(NSError * error) {
            UIView * view = [UIView new];
            [view setBackgroundColor:[UIColor blueColor]];
            return view;
        }
                           forViewState:UTStateViewStateNoData];


        [self addStateViewCreationBlock:^UIView *(NSError * error) {
            EXErrorStateView * view = [EXErrorStateView new];
            view.message = [error localizedDescription];
            return view;
        }
                           forViewState:UTStateViewStateError];

    }
    return self;
}

@end