//
//  ViewController.m
//  Taking Photos with the Camera
//
//  Created by Vandad NP on 25/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()<UIImagePickerControllerDelegate,
                             UINavigationControllerDelegate>

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
        NSURL *urlOfVideo = info[UIImagePickerControllerMediaURL];
        NSLog(@"Video URL = %@", urlOfVideo);
    }
    
    else if ([mediaType isEqualToString:(__bridge NSString *)kUTTypeImage]){
        
        /* Let's get the metadata. This is only for
         images. Not videos */
        
        NSDictionary *metadata = info[UIImagePickerControllerMediaMetadata];
        UIImage *theImage = info[UIImagePickerControllerOriginalImage];
        
        NSLog(@"Image Metadata = %@", metadata);
        NSLog(@"Image = %@", theImage);
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    NSLog(@"Picker was cancelled");
    [picker dismissViewControllerAnimated:YES completion:nil];
    
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
    
    if ([self isCameraAvailable] &&
        [self doesCameraSupportTakingPhotos]){
        
        UIImagePickerController *controller =
        [[UIImagePickerController alloc] init];
        
        controller.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        NSString *requiredMediaType = (__bridge NSString *)kUTTypeImage;
        controller.mediaTypes = [[NSArray alloc]
                                 initWithObjects:requiredMediaType, nil];
        
        controller.allowsEditing = YES;
        controller.delegate = self;
        
        [self presentViewController:controller animated:YES completion:nil];
        
    } else {
        NSLog(@"Camera is not available.");
    }
    
}

@end
