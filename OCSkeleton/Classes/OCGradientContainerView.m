//
//  OCGradientContainerView.m
//  OCSkeleton
//
//  Created by Mayqiyue on 05/03/2018.
//

#import "OCGradientContainerView.h"
#import "OCGradientView.h"

@interface OCGradientContainerView ()
@property (nonatomic, strong) OCGradientView *gradientView;

@end

@implementation OCGradientContainerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpGradientView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUpGradientView];
    }
    return self;
}

- (void)setUpGradientView
{
    self.gradientView.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:self.gradientView];
    
    if (@available(iOS 9.0, *)) {
        [self.gradientView.topAnchor constraintEqualToAnchor:self.topAnchor].active = true;
        [self.gradientView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = true;
        [self.gradientView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = true;
        [self.gradientView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = true;
    }
}

- (OCGradientView *)gradientView
{
    if (!_gradientView) {
        _gradientView = [[OCGradientView alloc] init];
    }
    return _gradientView;
}

- (OCGradientLayer *)gradientLayer
{
    /// A convenient way to access the `OCGradientContainerView`'s corresponding `CAGradientLayer`.
    return (OCGradientLayer *)self.gradientView.layer;
}

@end
