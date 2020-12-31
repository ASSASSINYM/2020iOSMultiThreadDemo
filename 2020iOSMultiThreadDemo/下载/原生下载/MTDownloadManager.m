//
//  MTDownloadManager.m
//  2020iOSMultiThreadDemo
//
//  Created by ASSASSIN on 2020/12/31.
//

#import "MTDownloadManager.h"
#import "MTFileManager.h"


static MTDownloadManager *manager = nil;

@interface MTDownloadManager ()<NSCopying>

@end

@implementation MTDownloadManager

+(instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
        
        
    });
    return manager;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [super allocWithZone:zone];
    });
    return manager;
}

-(id)copyWithZone:(NSZone *)zone {
    return manager;
}

-(CGFloat)progress:(NSString *)url {
    return 1;
}



@end
