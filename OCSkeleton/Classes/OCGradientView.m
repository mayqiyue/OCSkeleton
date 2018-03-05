//
//  OCGradientView.m
//  Pods-OCSkeleton_Example
//
//  Created by Mayqiyue on 05/03/2018.
//

#import "OCGradientView.h"
#import "OCGradientLayer.h"

@implementation OCGradientView

+ (Class)layerClass {
    return [OCGradientLayer class];
}

- (OCGradientLayer *)gradientlayer {
    return (id)self.layer;
}

@end
