#import "SaveRobotViewController.h"

@implementation SaveRobotViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _userDefaultsStorage = [UserDefaultsStorage new];
        _fileStorage = [FileStorage new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
    [self addViews];
    [self setupConstraints];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
}

- (void) createViews {
    self.nameTextField = [self createTextFieldWithPlaceholder: @"Robot's Name"];
    self.xTextField = [self createTextFieldWithPlaceholder: @"X coordinate"];
    self.yTextField = [self createTextFieldWithPlaceholder: @"Y coordinate"];
    self.saveToFilesButton = [self createButtonWithTitle: @"Save to Files"];
    self.saveToUserDefaultsButton = [self createButtonWithTitle: @"Save to User Defaults"];
    [self.saveToFilesButton addTarget:self action:@selector(saveToFiles) forControlEvents:UIControlEventTouchUpInside];
    [self.saveToUserDefaultsButton addTarget:self action:@selector(saveToUserDefaults) forControlEvents:UIControlEventTouchUpInside];
}

- (void) addViews {
    [self.view addSubview:self.nameTextField];
    [self.view addSubview:self.xTextField];
    [self.view addSubview:self.yTextField];
    [self.view addSubview:self.saveToFilesButton];
    [self.view addSubview:self.saveToUserDefaultsButton];
    
}

- (UITextField *) createTextFieldWithPlaceholder: (NSString *) placeholder {
    UITextField * inputTextField = [[UITextField alloc] init];
    inputTextField.translatesAutoresizingMaskIntoConstraints = NO;
    inputTextField.borderStyle = UITextBorderStyleRoundedRect;
    inputTextField.backgroundColor = [UIColor lightGrayColor];
    inputTextField.placeholder = placeholder;
    return inputTextField;
}

- (UILabel *) createLabelWithText: (NSString *) title {
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = title;
    return label;
}

- (UIButton *) createButtonWithTitle: (NSString *) title {
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.backgroundColor = [UIColor systemBlueColor];
    button.layer.cornerRadius = 20.0;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return button;
}

- (void) setupConstraints {
    [NSLayoutConstraint activateConstraints:@[
           
           [self.nameTextField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:40],
           [self.nameTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
           [self.nameTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
           [self.nameTextField.bottomAnchor constraintEqualToAnchor:self.nameTextField.topAnchor constant:50],
           
           [self.xTextField.topAnchor constraintEqualToAnchor:self.nameTextField.bottomAnchor constant:20],
           [self.xTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
           [self.xTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
           [self.xTextField.bottomAnchor constraintEqualToAnchor:self.xTextField.topAnchor constant:50],
           
           [self.yTextField.topAnchor constraintEqualToAnchor:self.xTextField.bottomAnchor constant:20],
           [self.yTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
           [self.yTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
           [self.yTextField.bottomAnchor constraintEqualToAnchor:self.yTextField.topAnchor constant:50],
           
           [self.saveToFilesButton.topAnchor constraintEqualToAnchor:self.yTextField.bottomAnchor constant:80],
           [self.saveToFilesButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
           [self.saveToFilesButton.widthAnchor constraintEqualToConstant:200],
           [self.saveToFilesButton.bottomAnchor constraintEqualToAnchor:self.saveToFilesButton.topAnchor constant:40],
           
           [self.saveToUserDefaultsButton.topAnchor constraintEqualToAnchor:self.saveToFilesButton.bottomAnchor constant:20],
           [self.saveToUserDefaultsButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
           [self.saveToUserDefaultsButton.widthAnchor constraintEqualToConstant:200],
           [self.saveToUserDefaultsButton.bottomAnchor constraintEqualToAnchor:self.saveToUserDefaultsButton.topAnchor constant:40]
           
       ]];
}

- (Robot *)createRobot {
    
    NSString * name = self.nameTextField.text;
    NSString * xString = self.xTextField.text;
    NSString * yString = self.yTextField.text;
    float x = [xString floatValue];
    float y = [yString floatValue];
    
    return [[Robot alloc] initWithName:name andX:x andY:y];
    
}

- (void)saveToFiles {
    
    Robot * robot = [self createRobot];
    NSLog(@"ready to save to Files");
    [self.fileStorage saveRobot:robot];
    
}

- (void)saveToUserDefaults {
    
    Robot * robot = [self createRobot];
    NSLog(@"ready to save to User Defaults");
    [self.userDefaultsStorage saveRobot:robot];
    
}

@end
