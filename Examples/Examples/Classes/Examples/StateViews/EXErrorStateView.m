//
//  EXErrorStateView
//  Examples
//
//  Created by Paul Taykalo on 7/22/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "EXErrorStateView.h"

@interface EXErrorStateView ()

@property (nonatomic, strong) UILabel * messageLabel;
@property (nonatomic, strong) UIButton * reloadButton;
@end

@implementation EXErrorStateView {

}


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.messageLabel = [UILabel new];
        self.reloadButton = [UIButton new];
        [self.reloadButton setTitle:@"Reload" forState:UIControlStateNormal];
        [self.reloadButton setTitle:@"!Reload!" forState:UIControlStateHighlighted];
        [[self reloadButton] addTarget:self action:@selector(reloadButtonPressed)
                      forControlEvents:UIControlEventTouchUpInside];
        [[self reloadButton] sizeToFit];

        [[self messageLabel] setBackgroundColor:[UIColor clearColor]];

        [self addSubview:self.messageLabel];
        [self addSubview:self.reloadButton];

        [self setBackgroundColor:[UIColor redColor]];

    }
    return self;
}


- (void)reloadButtonPressed {
  if (self.reloadBlock) {
      [self reloadBlock]();
  }
}


- (void)setMessage:(NSString *)message {
    _message = message;
    self.messageLabel.text = _message;
    [self.messageLabel sizeToFit];
    [self setNeedsLayout];
}


- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat selfWidth = self.frame.size.width;
    CGFloat selfHeight = self.frame.size.height;
    CGFloat messageLabelWidth = self.messageLabel.frame.size.width;
    CGFloat messageLabelHeight = self.messageLabel.frame.size.height;
    self.messageLabel.frame = CGRectMake((selfWidth - messageLabelWidth) / 2, (selfHeight - messageLabelHeight) / 2, messageLabelWidth, messageLabelHeight);
    self.reloadButton.center = CGPointMake(self.messageLabel.center.x, self.messageLabel.center.y + messageLabelHeight / 2 + self.reloadButton.frame.size.height / 2 + 10);
}


@end