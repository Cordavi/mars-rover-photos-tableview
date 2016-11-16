#import "NasaAPIClient.h"
#import "Keys.h"

NSString *const baseURL = @"https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000";
NSString *const keyPath = @"&api_key=";

@implementation NasaAPIClient

-(void)fetchPhotosJsonWithCompletion:(void(^ _Nonnull)(NSDictionary * _Nullable))completion {
  
  NSString *urlString = [NSString stringWithFormat:@"%@%@%@", baseURL, keyPath, [Keys clientID]];
  NSURL *url = [NSURL URLWithString:urlString];
  
  NSURLSessionDataTask *request = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error || !data) {
      completion(nil);
    }
    
    NSError *jsonError;
    NSDictionary *photosJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    
    if (jsonError) {
      completion(nil);
    }
    
    completion(photosJSON);
  }];
  
  [request resume];
}

-(NSURLSessionDataTask * _Nonnull)fetchImageAtURL:(NSURL * _Nonnull)url withCompletion:(void(^ _Nonnull)(NSData * _Nullable))completion {
  NSURLSessionDataTask *request = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error || !data) {
      completion(nil);
    }
    
    completion(data);
  }];
  
  [request resume];
  return request;
}

@end
