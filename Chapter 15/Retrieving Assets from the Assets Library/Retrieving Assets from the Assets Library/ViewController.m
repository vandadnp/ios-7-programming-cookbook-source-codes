//
//  ViewController.m
//  Retrieving Assets from the Assets Library
//
//  Created by Vandad NP on 25/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()
<UIImagePickerControllerDelegate,
UINavigationControllerDelegate>

@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;
@end

@implementation ViewController

//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    
//    static BOOL beenHereBefore = NO;
//    
//    if (beenHereBefore){
//        /* Only display the picker once as the viewDidAppear: method gets
//         called whenever the view of our view controller gets displayed */
//        return;
//    } else {
//        beenHereBefore = YES;
//    }
//    
//    [self.assetsLibrary
//     enumerateGroupsWithTypes:ALAssetsGroupAll
//     usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
//         [group enumerateAssetsUsingBlock:^(ALAsset *result,
//                                            NSUInteger index,
//                                            BOOL *stop) {
//             
//             /* Get the asset type */
//             NSString *assetType = [result
//                                    valueForProperty:ALAssetPropertyType];
//             
//             if ([assetType isEqualToString:ALAssetTypePhoto]){
//                 NSLog(@"This is a photo asset");
//             }
//             
//             else if ([assetType isEqualToString:ALAssetTypeVideo]){
//                 NSLog(@"This is a video asset");
//             }
//             
//             else if ([assetType isEqualToString:ALAssetTypeUnknown]){
//                 NSLog(@"This is an unknown asset");
//             }
//             
//             /* Get the URLs for the asset */
//             NSDictionary *assetURLs = [result
//                                        valueForProperty:ALAssetPropertyURLs];
//             
//             NSUInteger    assetCounter = 0;
//             for (NSString *assetURLKey in assetURLs){
//                 assetCounter++;
//                 NSLog(@"Asset URL %lu = %@",
//                       (unsigned long)assetCounter,
//                       [assetURLs valueForKey:assetURLKey]);
//             }
//             
//             /* Get the asset's representation object */
//             ALAssetRepresentation *assetRepresentation =
//             [result defaultRepresentation];
//             
//             NSLog(@"Representation Size = %lld",
//                   [assetRepresentation size]);
//             
//         }];
//     }
//     failureBlock:^(NSError *error) {
//         NSLog(@"Failed to enumerate the asset groups.");
//     }];
//    
//}

/* 2 */
//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    
//    static BOOL beenHereBefore = NO;
//    
//    if (beenHereBefore){
//        /* Only display the picker once as the viewDidAppear: method gets
//         called whenever the view of our view controller gets displayed */
//        return;
//    } else {
//        beenHereBefore = YES;
//    }
//    
//    self.assetsLibrary = [[ALAssetsLibrary alloc] init];
//    
//    dispatch_queue_t dispatchQueue =
//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    dispatch_async(dispatchQueue, ^(void) {
//        
//        [self.assetsLibrary
//         enumerateGroupsWithTypes:ALAssetsGroupAll
//         usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
//             
//             [group enumerateAssetsUsingBlock:^(ALAsset *result,
//                                                NSUInteger index,
//                                                BOOL *stop) {
//                 
//                 __block BOOL foundThePhoto = NO;
//                 
//                 if (foundThePhoto){
//                     *stop = YES;
//                 }
//                 
//                 /* Get the asset type */
//                 NSString *assetType =
//                 [result valueForProperty:ALAssetPropertyType];
//                 
//                 if ([assetType isEqualToString:ALAssetTypePhoto]){
//                     NSLog(@"This is a photo asset");
//                     
//                     foundThePhoto = YES;
//                     *stop = YES;
//                     
//                     /* Get the asset's representation object */
//                     ALAssetRepresentation *assetRepresentation =
//                     [result defaultRepresentation];
//                     
//                     /* We need the scale and orientation to be able to
//                      construct a properly oriented and scaled UIImage 
//                      out of the representation object */
//                     CGFloat imageScale = [assetRepresentation scale];
//                     
//                     UIImageOrientation imageOrientation =
//                     (UIImageOrientation)[assetRepresentation orientation];
//                     
//                     dispatch_async(dispatch_get_main_queue(), ^(void) {
//                         
//                         CGImageRef imageReference =
//                         [assetRepresentation fullResolutionImage];
//                         
//                         /* Construct the image now */
//                         UIImage     *image =
//                         [[UIImage alloc] initWithCGImage:imageReference
//                                                    scale:imageScale
//                                              orientation:imageOrientation];
//                         
//                         if (image != nil){
//                             UIImageView *imageView =
//                             [[UIImageView alloc]
//                              initWithFrame:self.view.bounds];
//                             
//                             imageView.contentMode = UIViewContentModeScaleAspectFit;
//                             imageView.image = image;
//                             [self.view addSubview:imageView];
//                             
//                         } else {
//                             NSLog(@"Failed to create the image.");
//                         }
//                     });
//                     
//                 }
//                 
//             }];
//         }
//         failureBlock:^(NSError *error) {
//             NSLog(@"Failed to enumerate the asset groups.");
//         }];
//        
//    });
//    
//}

/* 3 */

- (NSString *) documentFolderPath{
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSURL *url = [fileManager URLForDirectory:NSDocumentDirectory
                                     inDomain:NSUserDomainMask
                            appropriateForURL:nil
                                       create:NO
                                        error:nil];
    
    return url.path;
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    static BOOL beenHereBefore = NO;

    if (beenHereBefore){
        /* Only display the picker once as the viewDidAppear: method gets
         called whenever the view of our view controller gets displayed */
        return;
    } else {
        beenHereBefore = YES;
    }

    self.assetsLibrary = [[ALAssetsLibrary alloc] init];

    dispatch_queue_t dispatchQueue =
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_async(dispatchQueue, ^(void) {

        [self.assetsLibrary
         enumerateGroupsWithTypes:ALAssetsGroupAll
         usingBlock:^(ALAssetsGroup *group, BOOL *stop) {

             __block BOOL foundTheVideo = NO;

             [group enumerateAssetsUsingBlock:^(ALAsset *result,
                                                NSUInteger index,
                                                BOOL *stop) {

                 /* Get the asset type */
                 NSString *assetType = [result
                                        valueForProperty:ALAssetPropertyType];

                 if ([assetType isEqualToString:ALAssetTypeVideo]){
                     NSLog(@"This is a video asset");

                     foundTheVideo = YES;
                     *stop = YES;

                     /* Get the asset's representation object */
                     ALAssetRepresentation *assetRepresentation =
                     [result defaultRepresentation];

                     const NSUInteger BufferSize = 1024;
                     uint8_t buffer[BufferSize];
                     NSUInteger bytesRead = 0;
                     long long currentOffset = 0;
                     NSError *readingError = nil;

                     /* Construct the path where the video has to be saved */
                     NSString *videoPath =
                     [[self documentFolderPath]
                      stringByAppendingPathComponent:@"Temp.MOV"];

                     NSFileManager *fileManager = [[NSFileManager alloc] init];

                     /* Create the file if it doesn't exist already */
                     if ([fileManager fileExistsAtPath:videoPath] == NO){
                         [fileManager createFileAtPath:videoPath
                                              contents:nil
                                            attributes:nil];
                     }

                     /* We will use this file handle to write the contents
                      of the media assets to the disk */
                     NSFileHandle *fileHandle =
                     [NSFileHandle
                      fileHandleForWritingAtPath:videoPath];

                     do{

                         /* Read as many bytes as we can put in the buffer */
                         bytesRead =
                         [assetRepresentation getBytes:(uint8_t *)&buffer
                                            fromOffset:currentOffset
                                                length:BufferSize
                                                 error:&readingError];

                         /* If we couldn't read anything, we will
                          exit this loop */
                         if (bytesRead == 0){
                             break;
                         }

                         /* Keep the offset up to date */
                         currentOffset += bytesRead;

                         /* Put the buffer into an NSData */
                         NSData *readData = [[NSData alloc]
                                             initWithBytes:(const void *)buffer
                                             length:bytesRead];
                         
                         /* And write the data to file */
                         [fileHandle writeData:readData];
                         
                     } while (bytesRead > 0);
                     
                     NSLog(@"Finished reading and storing the \
                           video in the documents folder");
                     
                 }
                 
             }];
             
             if (foundTheVideo){
                 *stop = YES;
             }
             
         } 
         failureBlock:^(NSError *error) {
             NSLog(@"Failed to enumerate the asset groups.");
         }];
        
    });
    
}

@end
