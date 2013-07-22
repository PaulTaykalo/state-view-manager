//
//  EXLoadingStateView
//  Examples
//
//  Created by Paul Taykalo on 7/22/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "EXLoadingStateView.h"


@implementation EXLoadingStateView {

    UIActivityIndicatorView * _ind;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor greenColor]];
        _ind = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [_ind startAnimating];
        [_ind sizeToFit];

        _ind.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:_ind];

    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    _ind.frame = CGRectMake(self.frame.size.width / 2 - _ind.frame.size.width / 2,
                            self.frame.size.height / 2 - _ind.frame.size.height / 2,
                            _ind.frame.size.width,
                            _ind.frame.size.height);

}


@end