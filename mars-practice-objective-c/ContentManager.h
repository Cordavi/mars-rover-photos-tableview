#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ContentManager : NSObject

-(void)fetchPhotosJson;
-(void)fetchImageForIndexPath:(NSIndexPath *)indexPath;
-(UIImage *)imageForIndexPath:(NSIndexPath *)indexPath;
-(void)cancelNSURLSessionDataTaskForIndexPath:(NSIndexPath *)indexPath;

@end
