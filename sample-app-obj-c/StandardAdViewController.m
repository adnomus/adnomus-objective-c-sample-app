//
//  StandardAdViewController.m
//  sample-app-obj-c
//
//  Created by Giuseppe Barbalinardo on 3/5/17.
//  Copyright © 2017 Giuseppe Barbalinardo. All rights reserved.
//

#import "StandardAdViewController.h"
#import "AdnomusSdk-Swift.h"
#import <WebKit/WebKit.h>

@interface StandardAdViewController () <AdNomusContextDelegate>

@property (weak, nonatomic) IBOutlet UITextField *contentText;
@property (weak, nonatomic) IBOutlet UITextView *contextIdView;
@property (weak, nonatomic) IBOutlet UITextField *contextIdText;
@property (weak, nonatomic) IBOutlet UITextField *contentUrlText;
@property (weak, nonatomic) IBOutlet UIView *adViewContainer;
@property AdSize adSize;
@end

@implementation StandardAdViewController

- (IBAction)getNormalAdWithContent:(id)sender {
    CGRect frame = self.adViewContainer.frame;
    AdNomusControl *adManager = [AdNomusControl sharedInstance];
    WKWebView *webView = [adManager standardWebViewWithContent:self.contentText.text frame:frame adSize:self.adSize adKind:AdKindStandard];
    [self.view addSubview:webView];
}

- (IBAction)getContextForContent:(id)sender {
    AdNomusControl *adManager = [AdNomusControl sharedInstance];
    [adManager adContextWithContent:self.contentText.text contextDelegate:self];
}


- (IBAction)getNormalAdWithContext:(id)sender {
    CGRect frame = self.adViewContainer.frame;
    WKWebView *webView = [[AdNomusControl sharedInstance] standardWebViewWithContext:self.contextIdText.text frame:frame adSize:self.adSize adKind:AdKindStandard];
    [self.view addSubview:webView];
    
}

- (IBAction)getNormalAdWithContentURL:(id)sender {
    CGRect frame = self.adViewContainer.frame;
    NSURL *url = [[NSURL alloc] initWithString:self.contentUrlText.text];
    WKWebView *webView = [[AdNomusControl sharedInstance] standardWebViewWithContentURL:url frame:frame adSize:self.adSize adKind:AdKindStandard];
    [self.view addSubview:webView];

}

- (void)didReceiveResponseWithContext:(AdNomusContextObject *)context {
    self.contextIdView.text = context.contextId;
}

- (IBAction)adSizeDidChange:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.adSize = AdSizeS728x90;
            break;
        case 1:
            self.adSize = AdSizeS168x28;
            break;
        case 2:
            self.adSize = AdSizeS216x36;
            break;
        case 3:
            self.adSize = AdSizeS300x50;
            break;
        case 4:
            self.adSize = AdSizeS320x50;
            break;
        case 5:
            self.adSize = AdSizeS728x90;
            break;
        case 6:
            self.adSize = AdSizeS168x28;
            break;
        case 7:
            self.adSize = AdSizeS300x50;
            break;
            
            
        default:
            break;
    }
}


@end
