#import "NasaTableViewController.h"
#import "ContentManager.h"
#import "NasaPhoto.h"
#import "NasaPhotoTableViewCell.h"

@interface NasaTableViewController () <ContentManagerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ContentManager *contentManager;
@end

@implementation NasaTableViewController
@dynamic tableView;

- (void)viewDidLoad {
  [super viewDidLoad];
  self.contentManager = [[ContentManager alloc] init];
  self.contentManager.delegate = self;
  [self.tableView registerNib:[UINib nibWithNibName:@"NasaPhotoTableViewCell" bundle:nil] forCellReuseIdentifier:@"NasaTableViewCell"];
  [self.contentManager fetchPhotosJson];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.contentManager.photosJsonArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NasaPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NasaTableViewCell" forIndexPath:indexPath];
  
  NasaPhoto *nasaData = self.contentManager.photosJsonArray[indexPath.row];
  if (nasaData) {
    cell.camera.text = nasaData.camera;
    cell.rover.text = nasaData.rover;
    cell.image.image = [self.contentManager imageForIndexPath:indexPath];
  }
  return cell;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.contentManager cancelNSURLSessionDataTaskForIndexPath:indexPath];
}

- (void)photoJsonDidLoad:(ContentManager *)sender {
  [self.tableView reloadData];
}

-(void)imageDidLoadWithIndexPath:(NSIndexPath *)indexPath {
  if ([self.tableView.indexPathsForVisibleRows containsObject:indexPath]) {
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
  }
}

@end
