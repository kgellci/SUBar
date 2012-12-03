//
//  SUBar.h
//  SUBar
//
//  Created by Gellci, Kriser on 12/2/12.
//  Copyright (c) 2012 Gellci, Kriser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SUBar : UITextField <UITextFieldDelegate>

@property (nonatomic, weak) UIWebView *webView;

- (void) setupSUBarWithWebView:(UIWebView *)webView;
- (void) loadWebPageFromString:(NSString *)string;

@end
