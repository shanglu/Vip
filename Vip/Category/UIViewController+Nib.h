//
//  UIViewController+Nib.h
//  Vip
//
//  Created by 路 on 2018/3/6.
//  Copyright © 2018年 路. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Nib)
+ (instancetype)loadFromNib;
+ (instancetype)loadFromStoryBoard:(NSString *)storyBoard;
+ (instancetype)loadInitialViewControllerFromStoryBoard:(NSString *)storyBoard;
@end
