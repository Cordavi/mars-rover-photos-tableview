#import <Foundation/Foundation.h>

@interface NasaAPIClient : NSObject

-(void)fetchPhotosJSONWithCompletion:(void(^)(NSDictionary *))completion;

@end
