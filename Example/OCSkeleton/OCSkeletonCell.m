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
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imagePlaceholderView.layer.cornerRadius = self.imagePlaceholderView.bounds.size.width/2.0f;
}

- (NSArray <OCGradientLayer *>*)gradientLayers {
    if (self.titlePlaceholderView && self.subtitlePlaceholderView) {
        return @[self.titlePlaceholderView.gradientLayer, self.subtitlePlaceholderView.gradientLayer];
    }
    return nil;
}

@end
