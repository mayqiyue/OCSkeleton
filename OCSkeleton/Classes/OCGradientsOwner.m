//
//  GradientsOwner.m
//  OCSkeleton
//
//  Created by Mayqiyue on 05/03/2018.
//

#import "OCGradientsOwner.h"

@implementation UIView (OCGradientsOwner)

- (void)slideToDir:(OCDirection)direction animations:(void (^)(CAAnimationGroup *))group
{
    if (![self conformsToProtocol:@protocol(OCGradientsOwner)]) {
        return;
    }
    
    NSArray *layers = [self performSelector:@selector(gradientLayers)];
    for (OCGradientLayer *layer in layers) {
        [layer slideToDir:direction animations:group];
        layer.hidden = false;
    }
    
    if ([self respondsToSelector:@selector(skeletonViews)]) {
        NSArray *views = [self performSelector:@selector(skeletonViews)];
        for (UIView *view in views) {
            view.hidden = false;
        }
    }
}

- (void)stopSliding
{
    if (![self conformsToProtocol:@protocol(OCGradientsOwner)]) {
        return;
    }
    
    NSArray *layers = [self performSelector:@selector(gradientLayers)];
    for (OCGradientLayer *layer in layers) {
        [layer stopSliding];
        layer.hidden = true;
    }
    
    if ([self respondsToSelector:@selector(skeletonViews)]) {
        NSArray *views = [self performSelector:@selector(skeletonViews)];
        for (UIView *view in views) {
            view.hidden = true;
        }
    }
}

@end

