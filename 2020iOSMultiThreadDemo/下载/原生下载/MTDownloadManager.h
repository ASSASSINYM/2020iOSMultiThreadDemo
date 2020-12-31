//
//  MTDownloadManager.h
//  2020iOSMultiThreadDemo
//
//  Created by ASSASSIN on 2020/12/31.
//

#import <Foundation/Foundation.h>
#import "MTSSessionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MTDownloadManager : NSObject

/// 单例
+(instancetype)shareInstance;

/// 开启下载资源
/// @param url 下载地址
/// @param progressBlock 下载进度回调
/// @param stateBlock 下载状态回调
-(void)download:(NSString *)url
       progress:(ProgressBlock)progressBlock
          state:(StateBlock)stateBlock;

/// 获取下载进度
/// @param url 地址
-(CGFloat)progress:(NSString *)url;
/// 获取文件大小
/// @param url 地址
-(NSInteger)fileTotalLength:(NSString *)url;
/// 下载是否完成
/// @param url 地址
-(BOOL)isCompleted:(NSString *)url;
/// 删除
/// @param url 地址
-(void)deleteFile:(NSString *)url;
/// 删除全部
-(void)deleteAllFile;


@end

NS_ASSUME_NONNULL_END
