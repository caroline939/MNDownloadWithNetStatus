//
//  ViewController.m
//  根据网络状态下载图片
//
//  Created by caroline on 16/5/7.
//  Copyright © 2016年 Weenie. All rights reserved.
//

#import "ViewController.h"
#import <UIImageView+WebCache.h>
#import <AFNetworking.h>
#import "UIImageView+Download.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISwitch *turnonAndOff;
@property(nonatomic,strong)NSString *smallImage;
@property(nonatomic,strong)NSString *bigImage;
#define cachePath  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]

@end

@implementation ViewController



//如果没有存如偏好设置,哪么默认就是0,就是关着的---->那就是无论是什么网络都下载大图
- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL notalwaysDownloadOriginalImage = [[NSUserDefaults standardUserDefaults] boolForKey:@"notalwaysDownloadOriginalImage"];
    self.turnonAndOff.on = notalwaysDownloadOriginalImage;
   
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    self.smallImage = @"http://www.easyicon.net/api/resizeApi.php?id=1194913&size=64";
    self.bigImage = @"http://www.easyicon.net/api/resizeApi.php?id=1142208&size=128";
    
    [self.imageView MN_setImageWithOriginalImageURL:_bigImage thumbnailImageURL:_smallImage placeholderImage:[UIImage imageNamed:@"Snip20160507_14"]];
}
- (IBAction)setSwitch:(UISwitch *)sender {
    if ([sender isOn]) {
        //存入偏好设置,如果是打开的,哪么就是仅在wifi状态下下载图片
        NSUserDefaults *defautls = [NSUserDefaults standardUserDefaults];
        [defautls setBool:YES forKey:@"notalwaysDownloadOriginalImage"];
        [defautls synchronize];
        
       
    }else
    {
        //存入偏好设置,如果是关闭的,哪么就是不管在什么状态下都下载图片
        NSUserDefaults *defautls = [NSUserDefaults standardUserDefaults];
        [defautls setBool:NO forKey:@"notalwaysDownloadOriginalImage"];
        [defautls synchronize];
        

    }
}
- (IBAction)clearMemory:(id)sender {
    NSArray *subpaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:cachePath error:nil];
    
    for (NSString *subPath in subpaths) {
        
        NSString *filePath = [cachePath stringByAppendingPathComponent:subPath];
        
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
    

}




@end
