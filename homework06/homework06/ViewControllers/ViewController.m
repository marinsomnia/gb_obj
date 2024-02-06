#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTabBar];
}

- (void)configTabBar {
    
    UserDefaultsStorage * userDefaultsStorage = [UserDefaultsStorage new];
    FileStorage * fileStorage = [FileStorage new];
    
    SaveRobotViewController * saveRobotVC = [SaveRobotViewController new];
    LoadRobotViewController * loadRobotFromFileVC = [[LoadRobotViewController alloc] initWithStorage:fileStorage];
    LoadRobotViewController * loadRobotFromUserDefaultsVC = [[LoadRobotViewController alloc] initWithStorage: userDefaultsStorage];
    
    saveRobotVC.title = @"Create and Save Robot";
    loadRobotFromFileVC.title = @"Read Robot from Files";
    loadRobotFromUserDefaultsVC.title = @"Read Robot from User Defaults";
    
    UINavigationController * saveRobotNC = [[UINavigationController alloc] initWithRootViewController:saveRobotVC];
    UINavigationController * loadRobotFromFileNC = [[UINavigationController alloc] initWithRootViewController:loadRobotFromFileVC];
    UINavigationController * loadRobotFromUserDefaultsNC = [[UINavigationController alloc]      initWithRootViewController:loadRobotFromUserDefaultsVC];
    
    [self setViewControllers:[NSArray arrayWithObjects: saveRobotNC, loadRobotFromFileNC, loadRobotFromUserDefaultsNC, nil]];
    saveRobotNC.title = @"NEW";
    loadRobotFromFileNC.title = @"FILES";
    loadRobotFromUserDefaultsNC.title = @"USER DEFAULTS";

}

@end
