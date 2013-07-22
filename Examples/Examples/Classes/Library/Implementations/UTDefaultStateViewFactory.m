//
//  UTDefaultStateViewFactory
//  UAToday
//
//  Created by Paul Taykalo on 7/17/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "UTDefaultStateViewFactory.h"
#import "EXLoadingStateView.h"
#import "EXErrorStateView.h"


@implementation UTDefaultStateViewFactory {

}

- (UIView *)viewForState:(UTViewState)state {
    return [self viewForState:state error:nil];
}


- (UIView *)viewForState:(UTViewState)state error:(NSError *)error {
    switch (state) {
        case UTStateViewStateBase: {

            break;
        }

        case UTStateViewStateLoading: {
            EXLoadingStateView * view = [EXLoadingStateView new];

            return view;

        }
        case UTStateViewStateNoData: {
            UIView * view = [UIView new];
            [view setBackgroundColor:[UIColor blueColor]];
            return view;
        }

        case UTStateViewStateError: {
            EXErrorStateView * view = [EXErrorStateView new];
            view.message = [error localizedDescription];
            return view;
        }
    }

    return nil;
}


@end