//
//  PlayVideoViewController.m
//  Vip
//
//  Created by 路 on 2018/3/6.
//  Copyright © 2018年 路. All rights reserved.
//

#import "PlayVideoViewController.h"
#import <WebKit/WKWebView.h>

@interface PlayVideoViewController (){
    WKWebView *_webView;
}
@end

@implementation PlayVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width , self.view.frame.size.height)];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
    [self.view addSubview:_webView];
 
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
