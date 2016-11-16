#import "ContentManager.h"
#import "NasaAPIClient.h"
#import "NasaPhoto.h"

@interface ContentManager()

@property (strong, nonatomic) NSMutableArray *photosJsonArray;
@property (strong, nonatomic) NSMutableDictionary *photosDictionary;
@property (strong, nonatomic) NSMutableDictionary *photosRequests;
@property (strong, nonatomic) NasaAPIClient *apiClient;

@end


@implementation ContentManager

-(void)fetchPhotosJson {
  __weak ContentManager *weakSelf = self;
  
  [self.apiClient fetchPhotosJsonWithCompletion:^(NSDictionary * _Nullable completion) {
    if (!completion) {
      return;
    }
    
    NSError *jsonError;
    NSArray *photosJsonArray = [NSJSONSerialization JSONObjectWithData:completion[@"photos"] options:0 error:&jsonError];
    if (!photosJsonArray) {
      return;
    }
    
    for (NSDictionary *photosJsonDictionary in photosJsonArray) {
      NasaPhoto *newPhoto = [[NasaPhoto alloc] initWithPhotoJson:photosJsonDictionary];
      if (newPhoto) {
        [weakSelf.photosJsonArray addObject:newPhoto];
      }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
      //call delegate
    });
    
  }];
  
}


@end

//fetch photo json

//fetch image data
