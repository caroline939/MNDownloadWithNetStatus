//
//  UIImageView+Download.h
//  BuDeJie
//
//  Copyright © 2016年 Weenie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>

@interface UIImageView (Download)
- (void)MN_setImageWithOriginalImageURL:(NSString *)originalImageURL thumbnailImageURL:(NSString *)thumbnailImageURL placeholderImage:(UIImage *)placeholderImage;

/**
 *   设置imageView显示的图片
 *
 *  @param originalImageURL 原图URL
 *  @param thumbnailImageURL   缩略图URL
 *  @param placeholderImage 占位图片
 *  @param completedBlock    获取图片完毕之后会调用的block
 */
- (void)MN_setImageWithOriginalImageURL:(NSString *)originalImageURL thumbnailImageURL:(NSString *)thumbnailImageURL placeholderImage:(UIImage *)placeholderImage completed:(SDWebImageCompletionBlock)completedBlock;

- (void)MN_setImageWithOriginalImageURL:(NSString *)originalImageURL thumbnailImageURL:(NSString *)thumbnailImageURL;

- (void)MN_setImageWithOriginalImageURL:(NSString *)originalImageURL thumbnailImageURL:(NSString *)thumbnailImageURL completed:(SDWebImageCompletionBlock)completedBlock;
@end
