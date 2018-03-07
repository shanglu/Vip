//
//  ViewController.m
//  Vip
//
//  Created by 路 on 2018/3/6.
//  Copyright © 2018年 路. All rights reserved.
//

#import "ViewController.h"
#import "TVWebViewController.h"
#import "UIViewController+Nib.h"

@interface ViewController (){
    NSArray *_tvArray;
}
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _tvArray = @[@"http://v.youku.com",@"http://video.tudou.com",@"http://www.iqiyi.com",@"http://www.mgtv.com",@"http://www.le.com",@"https://v.qq.com",@"http://tv.sohu.com",@"http://v.pptv.com",@"http://www.acfun.cn"];
}


- (IBAction)btnClick:(UIButton *)sender {
    TVWebViewController *vc = [TVWebViewController loadFromStoryBoard:@"Main"];
    vc.urlString = _tvArray[sender.tag];
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
