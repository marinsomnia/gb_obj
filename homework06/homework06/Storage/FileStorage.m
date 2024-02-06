#import "FileStorage.h"

@implementation FileStorage

- (instancetype)init
{
    self = [super init];
    if (self) {
        _fileManager = [NSFileManager defaultManager];
        NSURL * documentsPath = [_fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
        _robotFolderPath = [documentsPath URLByAppendingPathComponent:@"RobotFolder"];
        _robotFilePath = [_robotFolderPath URLByAppendingPathComponent:@"robot.txt"];
        NSLog(@"%@", _robotFilePath.description);
    }
    return self;
}


//NSURL *folderPath = [path URLByAppendingPathComponent:@"NewFolder"];
//NSURL *pathToData = [folderPath URLByAppendingPathComponent:@"data.txt"];

//NSData * data = [@"String to file" dataUsingEncoding:kCFStringEncodingUTF8];
//if ([fileManager createDirectoryAtURL:folderPath withIntermediateDirectories:true attributes:nil error:nil]) {
//    [fileManager createFileAtPath:pathToData.path contents:data attributes:nil];
//}
//if ([fileManager fileExistsAtPath:pathToData.path]) {
//    NSData * dataRead = [fileManager contentsAtPath:pathToData.path];
//    NSString * encodedString = [[NSString alloc] initWithData:dataRead encoding:kCFStringEncodingUTF8];
//    NSLog(@"%@", encodedString);
//    [fileManager removeItemAtPath:pathToData.path error:nil];
//    [fileManager removeItemAtPath:folderPath.path error:nil];
//}


- (Robot *)loadRobot {
    if ([self.fileManager fileExistsAtPath:self.robotFilePath.path]) {
        NSData * robotData = [self.fileManager contentsAtPath:self.robotFilePath.path];
        Robot * robot = [NSKeyedUnarchiver unarchiveObjectWithData:robotData];
        //    [self.fileManager removeItemAtPath:self.robotFilePath.path error:nil];
        return robot;
    }
    NSLog(@"Can't find robot file");
    return [Robot new];
}

- (void)saveRobot:(Robot *)robot { 
    NSData * encodedRobot = [NSKeyedArchiver archivedDataWithRootObject:robot requiringSecureCoding:nil error:nil];
    
    if ([self.fileManager fileExistsAtPath:self.robotFolderPath.path]) {
        [self.fileManager createFileAtPath:self.robotFilePath.path contents:encodedRobot attributes:nil];
        NSLog(@"Robot file has been updated in its folder");
        return;
    } else {
        [self.fileManager createDirectoryAtURL:self.robotFolderPath withIntermediateDirectories:true attributes:nil error:nil];
        [self.fileManager createFileAtPath:self.robotFilePath.path contents:encodedRobot attributes:nil];
        NSLog(@"Robot and its folder have been saved to file");
        return;
    };
}

@end
