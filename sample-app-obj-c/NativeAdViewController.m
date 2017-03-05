//
//  StandardAdViewController.m
//  sample-app-obj-c
//
//  Created by Giuseppe Barbalinardo on 3/5/17.
//  Copyright © 2017 Giuseppe Barbalinardo. All rights reserved.
//

#import "NativeAdViewController.h"
#import "AdnomusSdk-Swift.h"

@interface NativeAdViewController () <AdNomusContextDelegate, AdNomusNativeDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textResponse;
@property (weak, nonatomic) IBOutlet UITextField *contentText;
@property (weak, nonatomic) IBOutlet UITextView *contextIdView;
@property (weak, nonatomic) IBOutlet UITextField *contextIdText;
@property (weak, nonatomic) IBOutlet UITextField *contentUrlText;
@property (strong, nonatomic) AdNomusNativeObject *nativeObject;
@property AdSize adSize;

@end

@implementation NativeAdViewController
- (IBAction)getNativeAdWithContent:(id)sender {
    self.textResponse.text = @"";

    [[AdNomusControl sharedInstance] nativeAdWithContent:self.contentText.text adSize:self.adSize adKind:AdKindNative nativeDelegate:self];
}

- (IBAction)getContextForContent:(id)sender {
    self.textResponse.text = @"";
    [[AdNomusControl sharedInstance] adContextWithContent:self.contentText.text contextDelegate:self];
    
}
- (IBAction)getNativeAdWithContext:(id)sender {
    self.textResponse.text = @"";
    [[AdNomusControl sharedInstance] nativeAdWithContext:self.contextIdText.text adSize:self.adSize adKind:AdKindNative nativeDelegate:self];
}
- (IBAction)getNativeAdWithContentURL:(id)sender {
    
    self.textResponse.text = @"";
    NSURL *url = [[NSURL alloc] initWithString:self.contentUrlText.text];
    [[AdNomusControl sharedInstance] nativeAdWithContentURL:url adSize:self.adSize adKind:AdKindNative nativeDelegate:self];
}


- (void)didReceiveResponseWithNativeObject:(AdNomusNativeObject *)nativeResponse{
    self.nativeObject = nativeResponse
    ;    self.textResponse.text = self.nativeObject.description;
}

- (void)didReceiveResponseWithContext:(AdNomusContextObject *)context{
    self.contextIdView.text = context.contextId;
    
}
- (IBAction)reportAdShown:(id)sender {

    [self.nativeObject reportAdShown];

}

- (IBAction)reportAdClicked:(id)sender {
    
    [self.nativeObject reportAdClicked];
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
