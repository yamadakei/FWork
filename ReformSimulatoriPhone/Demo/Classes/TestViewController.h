//
//  TestViewController.h
//  fStats
//
//  Created by Shawn Veader on 9/18/10.
//  Copyright 2010 V8 Labs, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "V8HorizontalPickerView.h"
#import <AVFoundation/AVFoundation.h>

@class V8HorizontalPickerView;

@interface TestViewController : UIViewController <V8HorizontalPickerViewDelegate, V8HorizontalPickerViewDataSource, AVCaptureVideoDataOutputSampleBufferDelegate>
{
    AVCaptureSession *session;
    UIView *previewView;
}
@property (strong, nonatomic) UIImageView *rsImageView;

@property (nonatomic, retain) V8HorizontalPickerView *pickerView;
@property (nonatomic, retain) UIButton *nextButton;
@property (nonatomic, retain) UIButton *reloadButton;
@property (retain) AVCaptureStillImageOutput *stillImageOutput;


-(void)createCaptureSession; //カメラ周り

@end
