#import "NasaPhoto.h"

@interface NasaPhoto()

@property (strong, nonatomic) NSString *_Nullable camera;
@property (strong, nonatomic) NSString *_Nullable rover;
@property (strong, nonatomic) NSURL *_Nonnull imageURL;
@property (strong, nonatomic) NSDate *_Nullable created;

@end

@implementation NasaPhoto

-(instancetype)initWithPhotoJson:(NSDictionary *)photosJson {
  self = [super init];
  if (self) {
    NSString *cameraName = [NSString stringWithFormat:@"%@", photosJson[@"camera"][@"name"]];
    if (!cameraName) {
      _camera = nil;
    }
    _camera = cameraName;
    
    NSString *roverName = [NSString stringWithFormat:@"%@", photosJson[@"rover"][@"name"]];
    if (!roverName) {
      _rover = nil;
    }
    _rover = roverName;
    
    NSString *imageURLString = [NSString stringWithFormat:@"%@", photosJson[@"img_src"]];
    NSURL *imageURL = [NSURL URLWithString: imageURLString];
    if (!imageURL) {
      return self;
    }
    _imageURL = imageURL;
    
    NSString *dateString = [NSString stringWithFormat:@"%@", photosJson[@"earth_date"]];
    NSDateFormatter *earthDateFormatter = [[NSDateFormatter alloc] init];
    [earthDateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *created = [earthDateFormatter dateFromString:dateString];
    if (!created) {
      _created = nil;
    }
    _created = created;
  }
  return self;
}

-(NSURL *)imageURL {
  return self.imageURL;
}

-(NSDate *)createdDate {
  return self.created;
}

-(NSString *)roverName {
  return self.rover;
}

-(NSString *)cameraName {
  return self.camera;
}

@end
