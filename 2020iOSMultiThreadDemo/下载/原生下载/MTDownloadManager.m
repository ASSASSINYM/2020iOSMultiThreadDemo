//
//  MTDownloadManager.m
//  2020iOSMultiThreadDemo
//
//  Created by ASSASSIN on 2020/12/31.
//

#import "MTDownloadManager.h"
#import "MTFileManager.h"
#import "NSString+Hash.h"

// 保存文件名
#define MTFileName(url) url.md5String
#define MTCachePathName @"MTDownloadCache"

static MTDownloadManager *manager = nil;

@interface MTDownloadManager ()<NSCopying,NSURLSessionDelegate>

/// 保存所有任务（下载地址url MD5 加密之后作为key）
@property(nonatomic,strong)NSMutableDictionary *tasks;
/// 保存所有关于下载的信息
@property(nonatomic,strong)NSMutableDictionary *sessionModels;
//@property(nonatomic,strong)NSArray<MTSSessionModel *> *models;

@end

@implementation MTDownloadManager

#pragma mark - singleton

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

#pragma mark - getter

-(NSMutableDictionary *)tasks {
    if (!_tasks) {
        _tasks = [NSMutableDictionary dictionary];
    }
    return _tasks;
}

-(NSMutableDictionary *)sessionModels {
    if (!_sessionModels) {
        _sessionModels = [NSMutableDictionary dictionary];
    }
    return _sessionModels;
}

#pragma mark - method

-(void)download:(NSString *)url progress:(ProgressBlock)progressBlock state:(StateBlock)stateBlock {
    if (!url) {
        return;
    }
    if ([self isCompleted:url]) {
        stateBlock(DownloadStateCompleted);
        return;
    }
    //开始或暂停
    if ([self.tasks valueForKey:MTFileName(url)]) {
        [self handle:url];
        return;
    }
    //创建缓存文件目录
    [MTFileManager createDirectoriesForPath:MTCachePathName];
    
    NSURLSessionConfiguration *configure = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configure delegate:self delegateQueue:queue];
    //创建流
    NSString *cachePath = [MTFileManager pathForDocumentsDirectoryWithPath:MTCachePathName];
    NSString *path = [cachePath stringByAppendingPathComponent:MTFileName(url)];
    NSOutputStream *stream = [NSOutputStream outputStreamToFileAtPath:path append:YES];
    //创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
}


-(void)handle:(NSString *)url {
    
}

/// 开始下载
/// @param url 地址
-(void)start:(NSString *)url {
    
}

/// 停止下载
/// @param url 地址
-(void)pause:(NSString *)url {
    
}

-(NSURLSessionDataTask *)getTask:(NSString *)url {
    return nil;
}

-(MTSSessionModel *)getSessionModel:(NSUInteger)taskIdentifier {
    return nil;
}

-(CGFloat)progress:(NSString *)url {
    return 1;
}

-(NSInteger)fileTotalLength:(NSString *)url {
    return 1000;
}

-(BOOL)isCompleted:(NSString *)url {
    return YES;
}

-(void)deleteFile:(NSString *)url {
    
}

-(void)deleteAllFile {
    
}


@end
