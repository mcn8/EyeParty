//
//  AppDelegate.h
//  EyeParty
//
//  Created by Nate on 9/13/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <EZAudio/EZMicrophone.h>
#import "LeapObjectiveC.h"

@class Track;

@interface AppDelegate : NSObject <NSApplicationDelegate, EZMicrophoneDelegate>
@property (weak) IBOutlet NSTextField *intensityText;
@property (weak) IBOutlet NSTextField *refreshText;
@property (weak) IBOutlet NSTextField *popText;
@property (weak) IBOutlet NSSlider *intensitySlider;
@property (weak) IBOutlet NSSlider *refreshSlider;
@property (weak) IBOutlet NSSlider *popSlider;

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic,strong) EZMicrophone *microphone;
- (IBAction)setIntensity:(id)sender;
- (IBAction)setRefresh:(id)sender;
- (IBAction)setPops:(id)sender;

extern float noise;

@property (strong) Track *track;

@end
