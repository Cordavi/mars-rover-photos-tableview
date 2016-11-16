#import <Foundation/Foundation.h>

@interface NasaAPIClient : NSObject

-(void)fetchPhotosJsonWithCompletion:(void(^ _Nonnull)(NSDictionary * _Nullable))completion;
-(NSURLSessionDataTask * _Nonnull)fetchImageAtURL:(NSURL * _Nonnull)url withCompletion:(void(^ _Nonnull)(NSData * _Nullable))completion;

@end
