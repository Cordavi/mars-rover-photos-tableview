#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NasaPhoto : NSObject

-(NSURL *)imageURL;
-(NSDate *)createdDate;
-(NSString *)roverName;
-(NSString *)cameraName;
-(instancetype)initWithPhotoJson:(NSDictionary *)photosJson;

@end
