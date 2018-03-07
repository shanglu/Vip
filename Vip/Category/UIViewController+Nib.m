//
//  UIViewController+Nib.m
//  Vip
//
//  Created by 路 on 2018/3/6.
//  Copyright © 2018年 路. All rights reserved.
//

#import "UIViewController+Nib.h"
#import <objc/runtime.h>

static const char kDidSetupConstraintsKey;

@implementation UIViewController (Nib)
- (void)setDidSetupConstraints:(BOOL)didSetupConstraints
{
    objc_setAssociatedObject(self, &kDidSetupConstraintsKey, @(didSetupConstraints), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)didSetupConstraints
{
    return [objc_getAssociatedObject(self, &kDidSetupConstraintsKey) boolValue];
}

+ (instancetype)loadFromNib
{
    return [[self alloc] initWithNibName:NSStringFromClass(self) bundle:nil];
}

+ (instancetype)loadFromStoryBoard:(NSString *)storyBoard
{
    UIViewController * board = [[UIStoryboard storyboardWithName:storyBoard bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass(self)];
    return board;
}

+ (instancetype)loadInitialViewControllerFromStoryBoard:(NSString *)storyBoard
{
    UIViewController * board = [[UIStoryboard storyboardWithName:storyBoard bundle:nil] instantiateInitialViewController];
    return board;
}


@end
