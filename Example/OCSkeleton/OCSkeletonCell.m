//
//  OCSkeletonCell.m
//  OCSkeleton_Example
//
//  Created by Mayqiyue on 05/03/2018.
//  Copyright © 2018 mayqiyue. All rights reserved.
//

#import "OCSkeletonCell.h"

@implementation OCSkeletonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.titlePlaceholderView addSubview:self.titleLabel];
    [self.subtitlePlaceholderView addSubview:self.subTitleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imagePlaceholderView.layer.cornerRadius = self.imagePlaceholderView.bounds.size.width/2.0f;
    self.imagePlaceholderView.clipsToBounds = true;
    self.titleLabel.frame = self.titleLabel.superview.bounds;
    self.subTitleLabel.frame = self.subTitleLabel.superview.bounds;
}

- (NSArray <OCGradientLayer *>*)gradientLayers {
    if (self.titlePlaceholderView && self.subtitlePlaceholderView) {
        return @[self.titlePlaceholderView.gradientLayer, self.subtitlePlaceholderView.gradientLayer];
    }
    return nil;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.textColor = [UIColor blackColor];
    }
    return _subTitleLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

@end
