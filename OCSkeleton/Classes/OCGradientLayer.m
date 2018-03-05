//
//  OCGradientLayer.m
//  OCSkeleton
//
//  Created by Mayqiyue on 05/03/2018.
//

#import "OCGradientLayer.h"

NSString *kSlidingAnimationKey = @"OCSkeleton.SlidingAnimation";

@implementation OCGradientLayer

- (void)slideToDir:(OCDirection)direction animations:(void (^)(CAAnimationGroup *))group
{
    if ([self animationForKey:kSlidingAnimationKey]) {
        return;
    }
    
    OCGradientTransition startPointTransition = transitionMaker(direction, OCGradientPropertyStartPoint);
    OCGradientTransition endPointTransition = transitionMaker(direction, OCGradientPropertyEndPoint);
    
    CABasicAnimation *startPointAnim = [CABasicAnimation animationWithKeyPath:@"startPoint"];
    startPointAnim.fromValue = [NSValue valueWithCGPoint:startPointTransition.start];
    startPointAnim.toValue = [NSValue valueWithCGPoint:startPointTransition.end];

    CABasicAnimation *endPointAnim = [CABasicAnimation animationWithKeyPath:@"endPoint"];
    endPointAnim.fromValue = [NSValue valueWithCGPoint:endPointTransition.start];
    endPointAnim.toValue = [NSValue valueWithCGPoint:endPointTransition.end];

    CAAnimationGroup *animGroup = [[CAAnimationGroup alloc] init];
    animGroup.animations = @[startPointAnim, endPointAnim];
    animGroup.duration = 1;
    animGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animGroup.repeatCount = HUGE_VALF;
    
    if (group) {
        group(animGroup);
    }
    [self addAnimation:animGroup forKey:kSlidingAnimationKey];
}

- (void)stopSliding
{
    [self removeAnimationForKey:kSlidingAnimationKey];
}

@end
