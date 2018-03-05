//
//  OCGradientLayer.h
//  OCSkeleton
//
//  Created by Mayqiyue on 05/03/2018.
//

#import <QuartzCore/QuartzCore.h>
#import "OCSkeletonDefines.h"

@interface OCGradientLayer : CAGradientLayer

- (void)slideToDir:(OCDirection)direction animations:(void (^)(CAAnimationGroup *))group;

- (void)stopSliding;

@end
