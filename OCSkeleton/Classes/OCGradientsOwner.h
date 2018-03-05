//
//  OCGradientsOwner.h
//  OCSkeleton
//
//  Created by Mayqiyue on 05/03/2018.
//

#import <Foundation/Foundation.h>
#import "OCGradientLayer.h"

@protocol OCGradientsOwner<NSObject>

- (NSArray <OCGradientLayer *>*)gradientLayers;

@end

@interface UIView (OCGradientsOwner)

- (void)slideToDir:(OCDirection)direction animations:(void (^)(CAAnimationGroup *))group;

- (void)stopSliding;

@end
