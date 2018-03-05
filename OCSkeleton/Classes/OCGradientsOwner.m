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
    }
}

@end

