//
//  Game.h
//  Flappy Bird
//
//  Created by Stefan Fodor on 17/04/14.
//  Copyright (c) 2014 Stefan Fodor. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;

@interface Game : UIViewController
{
    
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *StartGame;
    
    NSTimer *BirdMovement;
}

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;

@end
