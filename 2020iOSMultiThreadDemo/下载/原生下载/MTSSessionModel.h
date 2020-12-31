//
//  MTSSessionModel.h
//  2020iOSMultiThreadDemo
//
//  Created by ASSASSIN on 2020/12/31.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,DownloadState) {
    DownloadStateStart = 0,     /** 下载中 */
    DownloadStateSuspended,     /** 下载暂停 */
    DownloadStateCompleted,     /** 下载完成 */
    DownloadStateFailed         /** 下载失败 */
};

typedef void(^ProgressBlock)(NSInteger recievedSize,NSInteger expectedSize,CGFloat progress);//进度
typedef void(^StateBlock)(DownloadState state);//下载状态


NS_ASSUME_NONNULL_BEGIN

@interface MTSSessionModel : NSObject

/// 流
@property(nonatomic,strong)NSOutputStream *stream;
/// 下载地址
@property(nonatomic,copy)NSString *url;
/// 返回数据总长度
@property(nonatomic,assign)NSInteger totalLength;
/// 下载进度block
@property(nonatomic,copy)ProgressBlock progressBlock;
/// 下载进度
@property(nonatomic,copy)StateBlock stateBlock;

@end

NS_ASSUME_NONNULL_END
