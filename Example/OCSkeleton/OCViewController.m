//
//  OCViewController.m
//  OCSkeleton
//
//  Created by mayqiyue on 03/05/2018.
//  Copyright (c) 2018 mayqiyue. All rights reserved.
//

#import "OCViewController.h"
#import "OCSkeletonCell.h"
#import <OCSkeleton.h>

UIColor *brightened(UIColor *raw, CGFloat factor) {
    CGFloat h,s,b,a;
    [raw getHue:&h saturation:&s brightness:&b alpha:&a];
    return [UIColor colorWithHue:h saturation:s brightness:b*factor alpha:a];
}

@interface OCViewController () {
    BOOL isLoading;
    NSTimer *timer;
}
@end

@implementation OCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Contacts";
    self.tableView.scrollEnabled = false;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(OCSkeletonCell.class) bundle:nil] forCellReuseIdentifier:@"cellid"];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    isLoading = true;
}

- (void)tick
{
    isLoading = !isLoading;
    [self.tableView reloadData];
}

#pragma mark- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.view.frame.size.height/70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OCSkeletonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark- UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(OCSkeletonCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (CAGradientLayer *layer in cell.gradientLayers) {
        UIColor *baseColor = [UIColor colorWithRed:223.0/255. green:223.0/255 blue:223.0/255 alpha:1.0];
        layer.colors = @[(id)baseColor.CGColor, (id)brightened(baseColor, 0.93).CGColor,(id) baseColor.CGColor];
        layer.hidden = !isLoading;
    }
    
    if (isLoading) {
        cell.titlePlaceholderView.backgroundColor = [UIColor colorWithRed:223.0/255. green:223.0/255 blue:223.0/255 alpha:1.0];
        cell.subtitlePlaceholderView.backgroundColor = [UIColor colorWithRed:223.0/255. green:223.0/255 blue:223.0/255 alpha:1.0];
        cell.imagePlaceholderView.image = nil;
        cell.titleLabel.text = nil;
        cell.subTitleLabel.text = nil;
        
        [cell slideToDir:OCDirectionRight animations:nil];
    }
    else {
        cell.imagePlaceholderView.image = [UIImage imageNamed:@"avatar.jpeg"];
        cell.titleLabel.text = @"Title";
        cell.subTitleLabel.text = @"This is subtitle";
        
        cell.titlePlaceholderView.backgroundColor = [UIColor clearColor];
        cell.subtitlePlaceholderView.backgroundColor = [UIColor clearColor];
        
        [cell stopSliding];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}


@end

