//
//  Game.h
//  Flappy Bird
//
//  Created by Stefan Fodor on 17/04/14.
//  Copyright (c) 2014 Stefan Fodor. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight,
    RandomTopTunnelPosition,
    RandonBottomTunnelPosition,
    ScoreNumber;

NSInteger HighScoreNumber;

@interface Game : UIViewController
{

    IBOutlet UIButton   *StartGame,
                        *ExitGame;
    
    IBOutlet UIImageView    *Bird,
                            *TunnetTop,
                            *TunnelBottom,
                            *Top,
                            *Bottom;
    
    IBOutlet UILabel *ScoreLabel;
    
    NSTimer *BirdMovement,
            *TunnelMovement;
}

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)Score;
-(void)GameOver;

@end
