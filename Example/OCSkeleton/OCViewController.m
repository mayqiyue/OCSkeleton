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

@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Contacts";
    self.tableView.scrollEnabled = false;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(OCSkeletonCell.class) bundle:nil] forCellReuseIdentifier:@"cellid"];
}

#pragma mark- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.view.frame.size.height/70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OCSkeletonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    for (CAGradientLayer *layer in cell.gradientLayers) {
        UIColor *baseColor = cell.titlePlaceholderView.backgroundColor;
        layer.colors = @[(id)baseColor.CGColor, (id)[UIColor blueColor].CGColor,(id) baseColor.CGColor];
    }
    return cell;
}

#pragma mark- UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(OCSkeletonCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell slideToDir:OCDirectionRight animations:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}

@end
