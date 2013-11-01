//
//  ViewController.m
//  Taking Videos with the Camera
//
//  Created by Vandad NP on 25/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController () <UINavigationControllerDelegate,
                              UIImagePickerControllerDelegate>

@end

@implementation ViewController

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType
         sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    
    __block BOOL result = NO;
    
    if ([paramMediaType length] == 0){
        NSLog(@"Media type is empty.");
        return NO;
    }
    
    NSArray *availableMediaTypes =
    [UIImagePickerController
     availableMediaTypesForSourceType:paramSourceType];
    
    [availableMediaTypes enumerateObjectsUsingBlock:
     ^(id obj, NSUInteger idx, BOOL *stop) {
         
         NSString *mediaType = (NSString *)obj;
         if ([mediaType isEqualToString:paramMediaType]){
             result = YES;
             *stop= YES;
         }
         
     }];
    
    return result;
    
}

- (BOOL) isCameraAvailable{
    
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypeCamera];
    
}

- (BOOL) doesCameraSupportTakingPhotos{
    
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage
                          sourceType:UIImagePickerControllerSourceTypeCamera];
    
}

- (void)  imagePickerController:(UIImagePickerController *)picker
  didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    NSLog(@"Picker returned successfully.");
    
    NSLog(@"%@", info);
    
    NSString     *mediaType = info[UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(__bridge NSString *)kUTTypeMovie]){
        
        NSURL *urlOfVideo = info[UIImagePickerControllerMediaType];
        
        NSLog(@"Video URL = %@", urlOfVideo);
        
        NSError *dataReadingError = nil;
        
        NSData *videoData =
        [NSData dataWithContentsOfURL:urlOfVideo
                              options:NSDataReadingMapped
                                error:&dataReadingError];
        
        if (videoData != nil){
            /* We were able to read the data */
            NSLog(@"Successfully loaded the data.");
        } else {
            /* We failed to read the data. Use the dataReadingError
             variable to determine what the error is */
            NSLog(@"Failed to load the data with error = %@",
                  dataReadingError);
        }
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    NSLog(@"Picker was cancelled");
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

/* 1 */
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
//    if ([self isCameraAvailable] &&
//        [self doesCameraSupportTakingPhotos]){
//        
//        UIImagePickerController *controller =
//        [[UIImagePickerController alloc] init];
//        
//        controller.sourceType = UIImagePickerControllerSourceTypeCamera;
//        
//        controller.mediaTypes = @[(__bridge NSString *)kUTTypeMovie];
//        
//        controller.allowsEditing = YES;
//        controller.delegate = self;
//        
//        [self presentViewController:controller animated:YES completion:nil];
//        
//    } else {
//        NSLog(@"Camera is not available.");
//    }
//    
//}

/* 2 */
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
    
    if ([self isCameraAvailable] &&
        [self doesCameraSupportTakingPhotos]){
        
        UIImagePickerController *controller =
        [[UIImagePickerController alloc] init];
        
        controller.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        controller.mediaTypes = @[(__bridge NSString *)kUTTypeMovie];
        
        controller.allowsEditing = YES;
        controller.delegate = self;
        
        /* Record in high quality */
        controller.videoQuality = UIImagePickerControllerQualityTypeHigh;
        
        /* Only allow 30 seconds of recording */
        controller.videoMaximumDuration = 30.0f;
        
        [self presentViewController:controller animated:YES completion:nil];
        
    } else {
        NSLog(@"Camera is not available.");
    }
    
}

@end
