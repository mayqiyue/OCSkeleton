//
//  OCSkeletonCell.h
//  OCSkeleton_Example
//
//  Created by Mayqiyue on 05/03/2018.
//  Copyright © 2018 mayqiyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OCSkeleton.h>

@interface OCSkeletonCell : UITableViewCell <OCGradientsOwner>

@property (weak, nonatomic) IBOutlet UIImageView *imagePlaceholderView;
@property (weak, nonatomic) IBOutlet OCGradientContainerView *titlePlaceholderView;
@property (weak, nonatomic) IBOutlet OCGradientContainerView *subtitlePlaceholderView;

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *subTitleLabel;

@end
