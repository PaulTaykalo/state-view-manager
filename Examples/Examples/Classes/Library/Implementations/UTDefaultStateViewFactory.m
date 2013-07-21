//
//  UTDefaultStateViewFactory
//  UAToday
//
//  Created by Paul Taykalo on 7/17/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "UTDefaultStateViewFactory.h"


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

            UIView * view = [UIView new];
            [view setBackgroundColor:[UIColor greenColor]];
            [view setFrame:CGRectMake(0, 0, 100,100)];
            UIActivityIndicatorView * ind = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            [ind startAnimating];
            [ind sizeToFit];

            ind.frame = CGRectMake(50 - ind.frame.size.width / 2, 50 - ind.frame.size.height / 2, ind.frame.size.width, ind.frame.size.height);
            ind.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
            [view addSubview:ind];
            return view;

        }
        case UTStateViewStateNoData: {
            UIView * view = [UIView new];
            [view setBackgroundColor:[UIColor blueColor]];
            return view;
        }

        case UTStateViewStateError: {
            UIView * view = [UIView new];
            [view setBackgroundColor:[UIColor redColor]];
            return view;
        }
    }

    return nil;
}


@end