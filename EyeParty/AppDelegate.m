//
//  AppDelegate.m
//  EyeParty
//
//  Created by Nate on 9/13/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import <ApplicationServices/ApplicationServices.h>
#import <EZMicrophone.h>
#import "Track.h"

@implementation AppDelegate{
    LeapController *controller;
    NSArray *fingerNames;
    NSArray *boneNames;
}

float noise = 0;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    Track *aTrack = [[Track alloc] init];
    [self setTrack:aTrack];
    
    controller = [[LeapController alloc] init];
    [controller addListener:self];
    


    
    self.microphone = [EZMicrophone microphoneWithDelegate:self];
    [self.microphone startFetchingAudio];
    
    //CGGammaValue table[] = {1, 0};
    CGGammaValue red = 0.5;
    CGGammaValue green = 0.5;
    CGGammaValue blue = 0.5;
    bool redNeg = false;
    bool greenNeg = false;
    bool blueNeg = false;
    
    
    while(true){
        LeapFrame *frame = [controller frame:0];
        LeapFrame *previousFrame = [controller frame:1];
        LeapVector *currentVec, *previousVec;
        float redX, greenY, blueZ;
        
        for (LeapHand *hand in frame.hands){
            currentVec = [hand palmPosition];
        }
        for (LeapHand *hand in previousFrame.hands){
            previousVec = [hand palmPosition];
        }
        
        redX = [currentVec x] - [previousVec x];
        greenY = [currentVec y] - [previousVec y];
        blueZ = [currentVec z] - [previousVec z];
        
        redX /= 100;
        greenY /= 200;
        blueZ /= 50;
        
        for(int i = 0; i < 4; i++){
            if((red + (CGGammaValue)redX + (CGGammaValue)noise )>= 1){
                red = 1;
            } else if((red + (CGGammaValue)redX + (CGGammaValue)noise )<= 0){
                red = 0;
            } else{
                red += (CGGammaValue)redX + (CGGammaValue)noise;
            }
            
            if((green + (CGGammaValue)greenY + (CGGammaValue)noise*2 )>= 1){
                green = 1;
            } else if((green + (CGGammaValue)greenY + (CGGammaValue)noise*2 )<= 0){
                green = 0;
            } else{
                green += (CGGammaValue)greenY + (CGGammaValue)noise*2;
            }
            
            if((blue + (CGGammaValue)blueZ + (CGGammaValue)noise*3 )>= 1){
                blue = 1;
            } else if((blue + (CGGammaValue)blueZ + (CGGammaValue)noise*3 )<= 0){
                blue = 0;
            } else{
                blue += (CGGammaValue)blueZ + (CGGammaValue)noise*3;
            }
            
        CGSetDisplayTransferByFormula (CGMainDisplayID(), 0, 1, red, 0, 1, green, 0, 1, blue);
            usleep(35);
        }
        
        usleep(80000);
    }
}

-(void)   microphone:(EZMicrophone *)microphone
    hasAudioReceived:(float **)buffer
      withBufferSize:(UInt32)bufferSize
withNumberOfChannels:(UInt32)numberOfChannels {
            usleep(10000);
            NSLog(@"%f", (*buffer[0]));
            noise = *buffer[0]/8;
}

- (IBAction)setIntensity:(id)sender {
    float newValue = [sender floatValue];
    //[self.track setIntense:newValue];
    //[self updateUserInterface];
}

- (IBAction)setRefresh:(id)sender {
    NSString *senderName = nil;
    if (sender == self.refreshText) {
        senderName = @"textField";
    }
    else {
        senderName = @"slider";
    }
    NSLog(@"%@ sent takeFloatValueForVolumeFrom: with value %1.2f", senderName, [sender floatValue]);
}

- (IBAction)setPops:(id)sender {
    NSString *senderName = nil;
    if (sender == self.popText) {
        senderName = @"textField";
    }
    else {
        senderName = @"slider";
    }
    NSLog(@"%@ sent takeFloatValueForVolumeFrom: with value %1.2f", senderName, [sender floatValue]);
}
@end
