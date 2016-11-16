#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NasaPhoto : NSObject

-(NSURL *)imageURL;
-(NSDate *)createdDate;
-(instancetype)initWithPhotoJson:(NSDictionary *)photosJson;

@end
