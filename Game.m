//
//  Game.m
//  Flappy Bird
//
//  Created by Stefan Fodor on 17/04/14.
//  Copyright (c) 2014 Stefan Fodor. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

//Logic for starting the game
-(IBAction)StartGame:(id)sender{
    
    //hide the starting button
    StartGame.hidden = YES;
    
    TunnetTop.hidden = NO;
    TunnelBottom.hidden = NO;
    
    
    //REPEAT BIRD MOVING EVERY 0.05 SECONDS
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
    
}

//Logic for moving bird
-(void)BirdMoving {
    
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    //make the flight path decrease
    BirdFlight = BirdFlight - 5;
    
    //limit the decendent rate
    if(BirdFlight < -15) {
        BirdFlight = -15;
    }
    
    if( BirdFlight > 0 ) {
        Bird.image = [UIImage imageNamed:@"bird_up.png"];
    } else {
        Bird.image = [UIImage imageNamed:@"bird_down.png"];
    }
    
    
}

//On touch, bump the bird up
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    BirdFlight = 30;
    
}

//Place tunnels in a random position
-(void)PlaceTunnels {
    
    //we want a random val between [-228,122] for the top
    RandomTopTunnelPosition = arc4random() % 350 - 228;
    
    //655, the gap, FCA(From Calvin's Ass)
    RandonBottomTunnelPosition = RandomTopTunnelPosition + 655;
    
    //move shit
    TunnetTop.center = CGPointMake(340, RandomTopTunnelPosition);
    TunnelBottom.center = CGPointMake(340, RandonBottomTunnelPosition);
    
}

//logic for moving the tunnels of the screen
-(void)TunnelMoving {
    
    TunnetTop.center = CGPointMake(TunnetTop.center.x - 1, TunnetTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x - 1, TunnelBottom.center.y);

    if( TunnetTop.center.x < -28 ) {
        [self PlaceTunnels];
    }
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
 
    //hide the tunnel until they enter the screen
    TunnetTop.hidden = YES;
    TunnelBottom.hidden = YES;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
