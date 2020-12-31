//
//  ViewController.m
//  2020iOSMultiThreadDemo
//
//  Created by ASSASSIN on 2020/12/30.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "MTFileManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",NSHomeDirectory());
    
    [MTFileManager createDirectoriesForPath:@"shit"];
    
    [MTFileManager createFileAtPath:@"fuck.txt"];
    
    NSString *path = [MTFileManager pathForDocumentsDirectoryWithPath:@"shit"];
    
    NSLog(@"%@",path);
}


@end
