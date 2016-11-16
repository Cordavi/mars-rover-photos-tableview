#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ContentManager;

@protocol ContentManagerDelegate <NSObject>

@required
-(void)photoJsonDidLoad:(ContentManager *)contentManagerDelegate;

@end

@interface ContentManager : NSObject

@property (nonatomic, weak) id <ContentManagerDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *photosJsonArray;
@property (strong, nonatomic) NSMutableDictionary *photosDictionary;
@property (strong, nonatomic) NSMutableDictionary *photosRequests;

-(id)delegate;
-(void)setDelegate:(id<ContentManagerDelegate>)newDelegate;
-(void)fetchPhotosJson;
-(void)fetchImageForIndexPath:(NSIndexPath *)indexPath;
-(UIImage *)imageForIndexPath:(NSIndexPath *)indexPath;
-(void)cancelNSURLSessionDataTaskForIndexPath:(NSIndexPath *)indexPath;

@end
