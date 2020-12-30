//
//  ViewController.m
//  2020iOSMultiThreadDemo
//
//  Created by ASSASSIN on 2020/12/30.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BOOL ss = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]];
    
}


@end
