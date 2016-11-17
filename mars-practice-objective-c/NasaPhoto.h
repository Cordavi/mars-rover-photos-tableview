#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NasaPhoto : NSObject

@property (strong, nonatomic, readonly) NSString *_Nullable camera;
@property (strong, nonatomic, readonly) NSString *_Nullable rover;
@property (strong, nonatomic, readonly) NSURL *_Nonnull imageURL;
@property (strong, nonatomic, readonly) NSDate *_Nullable created;

-(instancetype)initWithPhotoJson:(NSDictionary *)photosJson;

@end
