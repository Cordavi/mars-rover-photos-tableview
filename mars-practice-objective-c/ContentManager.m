#import "ContentManager.h"
#import "NasaAPIClient.h"
#import "NasaPhoto.h"


@interface ContentManager()

@property (strong, nonatomic) NasaAPIClient *apiClient;

@end

@implementation ContentManager

@synthesize delegate;

- (instancetype)init
{
  self = [super init];
  if (self) {
    _apiClient = [[NasaAPIClient alloc] init];
    _photosJsonArray = [[NSMutableArray alloc] init];
  }
  return self;
}


-(id)delegate {
  return delegate;
}

-(void)setDelegate:(id<ContentManagerDelegate>)newDelegate {
  delegate = newDelegate;
}

-(void)fetchPhotosJson {
  __weak ContentManager *weakSelf = self;
  
  [self.apiClient fetchPhotosJsonWithCompletion:^(NSDictionary * _Nullable completion) {
    if (!completion) {
      return;
    }
    
//    NSError *jsonError;
    NSArray *photosJsonArray = completion[@"photos"];
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
      [delegate photoJsonDidLoad:weakSelf];
    });
    
  }];
}


@end


//fetch image data
