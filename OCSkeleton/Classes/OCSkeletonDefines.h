//
//  OCSkeletonDefines.h
//  OCSkeleton
//
//  Created by Mayqiyue on 05/03/2018.
//

#ifndef OCSkeletonDefines_h
#define OCSkeletonDefines_h

typedef enum {
    OCDirectionRight = 0,
    OCDirectionLeft,
} OCDirection;

typedef enum  {
    OCGradientPropertyStartPoint = 0,
    OCGradientPropertyEndPoint,
} OCGradientProperty;

typedef struct {
    CGPoint start;
    CGPoint end;
} OCGradientTransition;

static OCGradientTransition transitionMaker(OCDirection dir, OCGradientProperty position) {
    if (dir == OCDirectionLeft) {
        OCGradientTransition transition;
        if (position == OCGradientPropertyStartPoint) {
            transition.start = CGPointMake(1, 0.5);
            transition.end = CGPointMake(-1, 0.5);
        }
        else {
            transition.start = CGPointMake(2, 0.5);
            transition.end = CGPointMake(0, 0.5);
        }
        
        return transition;
    }

    OCGradientTransition transition;
    if (position == OCGradientPropertyStartPoint) {
        transition.start = CGPointMake(-1, 0.5);
        transition.end = CGPointMake(1, 0.5);
    }
    else {
        transition.start = CGPointMake(0, 0.5);
        transition.end = CGPointMake(2, 0.5);
    }
    
    return transition;
}

#endif /* OCSkeletonDefines_h */
