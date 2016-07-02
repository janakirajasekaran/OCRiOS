//
//  TranslatorViewController.m
//  OCRiOS
//
//  Created by John Thomas on 24/12/1936 SAKA.
//  Copyright (c) 1936 SAKA Project. All rights reserved.
//

#import "TranslatorViewController.h"

@interface TranslatorViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation TranslatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://translate.google.co.in"]]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
