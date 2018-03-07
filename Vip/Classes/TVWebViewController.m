//
//  TVWebViewController.m
//  Vip
//
//  Created by 路 on 2018/3/6.
//  Copyright © 2018年 路. All rights reserved.
//

#import "TVWebViewController.h"
#import "PlayVideoViewController.h"
#import "UIViewController+Nib.h"


@interface TVWebViewController ()<UIWebViewDelegate>{
    NSString *_url;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

@end

@implementation TVWebViewController

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
    self.navigationController.navigationBar.hidden = YES;
    self.indicatorView.hidden = NO;
    [self.indicatorView startAnimating];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
}


- (IBAction)back {
    if (self.webView.canGoBack) {
        [self.webView goBack];
    } else {
        [self.indicatorView stopAnimating];
        self.indicatorView.hidden = YES;
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    self.indicatorView.hidden = NO;
    [self.indicatorView startAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self.indicatorView stopAnimating];
    self.indicatorView.hidden = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.indicatorView stopAnimating];
    self.indicatorView.hidden = YES;
    self.titleLab.text = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    _url = request.URL.absoluteString;
    return YES;
}

- (IBAction)playClick {
    TVWebViewController *vc = [TVWebViewController loadFromStoryBoard:@"Main"];
    vc.urlString = [NSString stringWithFormat:@"http://api.baiyug.cn/vip/index.php?url=%@",_url];
    [self.navigationController pushViewController:vc animated:YES];
//    PlayVideoViewController *vc = [PlayVideoViewController new];
//    vc.urlString = [NSString stringWithFormat:@"http://api.baiyug.cn/vip/index.php?url=%@",_url];
//    [self.navigationController pushViewController:vc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
