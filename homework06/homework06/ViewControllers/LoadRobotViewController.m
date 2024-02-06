#import "LoadRobotViewController.h"

@interface LoadRobotViewController ()

@end

@implementation LoadRobotViewController

- (instancetype)initWithStorage: (id<StorageProtocol>) storage {
    self = [super init];
    if (self) {
        _storage = storage;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self createViews];
    [self addViews];
    [self setupConstraints];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateRobot];
}

- (void)updateRobot {
    self.robot = [_storage loadRobot];
    self.nameTextView.text = self.robot.name;
    self.xTextView.text = [NSString stringWithFormat:@"%.2f", self.robot.coordinates.x];
    self.yTextView.text = [NSString stringWithFormat:@"%.2f", self.robot.coordinates.y];
}

- (void) createViews {
    self.nameLabel = [self createLabelWithText: @"Robot's Name"];
    self.xLabel = [self createLabelWithText: @"X coordinate"];
    self.yLabel = [self createLabelWithText: @"Y coordinate"];
    self.nameTextView = [self createTextView];
    self.xTextView = [self createTextView];
    self.yTextView = [self createTextView];
}

- (void) addViews {
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.xLabel];
    [self.view addSubview:self.yLabel];
    [self.view addSubview:self.nameTextView];
    [self.view addSubview:self.xTextView];
    [self.view addSubview:self.yTextView];
}

- (UITextView *)createTextView {
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectZero];
    textView.translatesAutoresizingMaskIntoConstraints = NO;
    textView.backgroundColor = [UIColor blackColor];
    textView.font = [UIFont monospacedSystemFontOfSize:20 weight: UIFontWeightRegular];
    textView.textColor = [UIColor whiteColor];
    textView.editable = NO;
    return textView;
}

- (UILabel *)createLabelWithText: (NSString *) text {
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = text;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    return label;
}

- (void) setupConstraints {
    [NSLayoutConstraint activateConstraints:@[
           
           [self.nameLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:40],
           [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
           [self.nameLabel.trailingAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:-10],
           [self.nameLabel.bottomAnchor constraintEqualToAnchor:self.nameLabel.topAnchor constant:50],
           
           [self.nameTextView.topAnchor constraintEqualToAnchor:self.nameLabel.topAnchor constant:0],
           [self.nameTextView.leadingAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:10],
           [self.nameTextView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
           [self.nameTextView.bottomAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:0],
           
           [self.xLabel.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:20],
           [self.xLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
           [self.xLabel.trailingAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:-10],
           [self.xLabel.bottomAnchor constraintEqualToAnchor:self.xLabel.topAnchor constant:50],
           
           [self.xTextView.topAnchor constraintEqualToAnchor:self.xLabel.topAnchor constant:0],
           [self.xTextView.leadingAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:10],
           [self.xTextView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
           [self.xTextView.bottomAnchor constraintEqualToAnchor:self.xLabel.bottomAnchor constant:0],
           
           [self.yLabel.topAnchor constraintEqualToAnchor:self.xLabel.bottomAnchor constant:20],
           [self.yLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
           [self.yLabel.trailingAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:-10],
           [self.yLabel.bottomAnchor constraintEqualToAnchor:self.yLabel.topAnchor constant:50],
           
           [self.yTextView.topAnchor constraintEqualToAnchor:self.yLabel.topAnchor constant:0],
           [self.yTextView.leadingAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:10],
           [self.yTextView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
           [self.yTextView.bottomAnchor constraintEqualToAnchor:self.yLabel.bottomAnchor constant:0],
       ]];
}

@end
