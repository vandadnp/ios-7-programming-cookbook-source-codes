//
//  ViewController.m
//  Loading Web Pages with UIWebView
//
//  Created by Vandad NP on 23/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UIWebView *myWebView;
@end

@implementation ViewController

/* 1 */
- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.myWebView];
    
    NSString *htmlString = @"<br/>iOS 7 Programming <strong>Cookbook</strong>";
    
    [self.myWebView loadHTMLString:htmlString
                           baseURL:nil];
}

/* 2 */
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    self.myWebView.scalesPageToFit = YES;
//    [self.view addSubview:self.myWebView];
//    
//    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    [self.myWebView loadRequest:request];
//    
//}

//@interface ViewController () <UIWebViewDelegate>
//@property(nonatomic, strong) UIWebView *myWebView;
//@end
//
//@implementation ViewController
//
///* 3 */
//- (void)webViewDidStartLoad:(UIWebView *)webView{
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
//}
//    
//- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//}
//    
//- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//}
//    
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    self.myWebView.delegate = self;
//    self.myWebView.scalesPageToFit = YES;
//    [self.view addSubview:self.myWebView];
//    
//    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    [self.myWebView loadRequest:request];
//    
//}

@end
