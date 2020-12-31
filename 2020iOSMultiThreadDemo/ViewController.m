//
//  ViewController.m
//  2020iOSMultiThreadDemo
//
//  Created by ASSASSIN on 2020/12/30.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "MTFileManager.h"
#import "Reachability.h"

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
    
    NSString *url = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattachments.gfan.com%2Fforum%2Fattachments2%2F201304%2F18%2F001339jv88x0qs06vo3qq6.jpg&refer=http%3A%2F%2Fattachments.gfan.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611978224&t=d6fb4fb9b069f0b43564588fe8318360";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    

    [NSURLSessionDownloadTask sha];
    
    [[NSURLSession sharedSession] downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    
        
        NSLog(@"location === %@",location);
    }];
    
    
    
    [[AFHTTPSessionManager manager] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress --- %@",downloadProgress);
        
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        [MTFileManager createDirectoriesForPath:@"2020MT"];
        NSString *path = [MTFileManager pathForDocumentsDirectoryWithPath:@"2020MT"];
        return [NSURL URLWithString:path];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        NSLog(@"filePath == %@",filePath);
    }];
    
    Reachability *reach = [[Reachability alloc] init];
    [reach currentReachabilityStatus];
}


@end
