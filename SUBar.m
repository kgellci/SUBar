//
//  SUBar.m
//  SUBar
//
//  Created by Gellci, Kriser on 12/2/12.
//  Copyright (c) 2012 Gellci, Kriser. All rights reserved.
//

#import "SUBar.h"

@implementation SUBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void) setupSUBarWithWebView:(UIWebView *)webView {
    self.delegate = self;
    self.webView = webView;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    [self loadWebPageFromString:textField.text];
}

- (void) loadWebPageFromString:(NSString *)string {
    NSURL *url = [NSURL URLWithString:string];
    
    // Check if the string has the ending charactaristics of a url and if so, add http:// to its beginning if
    // it does not already have it
    if ([string rangeOfString:@"."].location != NSNotFound) {
        if (!url.scheme) {
            url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", string]];
        }
    }
    
    // If the string does not seem to be a valid url, format it as a google search url
    if (!url.host) {
        NSString *googleSearch = [string stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.google.com/search?q=%@", googleSearch]];
    }
    
    // fill the textfield with any changes made to the string and load the url into the webview.
    self.text = [url absoluteString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
}
*/

@end
