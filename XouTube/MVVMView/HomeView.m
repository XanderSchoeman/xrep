//
//  HomeView.m
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/30.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

#import "HomeView.h"
#import "GenreModel.h"
#import "GlobalDataGenre.h"

@interface HomeView ()

@end

@implementation HomeView

- (IBAction)btnAction:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Action&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Action";
    _lblWelcome.textColor = UIColor.orangeColor;
    //[GlobalDataGenre sharedGlobalData].message;;
}

- (IBAction)btnGame:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Game&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Game";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnSliceOfLife:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Slice%20Of%20Life&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Slice Of Life";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnSuperPower:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Super%20Power&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Super Power";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnAdventure:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Adventure&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Adventure";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnMilitary:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Military&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Military";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnRomance:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Romance&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Romance";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnVampire:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Vampire&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Vampire";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnSports:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Sports&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Sports";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnSupernatural:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Supernatural&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Supernatural";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnSchool:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=School&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"School";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnDrama:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Drama&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Drama";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnComedy:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Comedy&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Comedy";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnHorror:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Horror&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Horror";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnSciFi:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Sci%20Fi&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"SciFi";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnFantasy:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Fantasy&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Fantasy";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnMartialArts:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Martial%20Arts&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Martial Arts";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnKids:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Kids&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Kids";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnMagic:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Magic&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Magic";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (IBAction)btnMystery:(id)sender {
    [[GlobalDataGenre sharedGlobalData] initWith: @"genre=Mystery&"];
    [[GlobalDataGenre sharedGlobalData] mySetMessageFunc];
    _lblWelcome.text = @"Mystery";
    _lblWelcome.textColor = UIColor.orangeColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}



- (IBAction)btnAnime:(id)sender {
[self performSelector:@selector(showAnime) withObject:nil];
}

- (IBAction)btnManga:(id)sender {
[self performSelector:@selector(showManga) withObject:nil];
}

- (IBAction)btnFaves:(id)sender {
[self performSelector:@selector(showFaves) withObject:nil];
}

- (IBAction)btnProfile:(id)sender {
[self performSelector:@selector(showProfile) withObject:nil];
}

-(void)showAnime {
    [self performSegueWithIdentifier:@"segAnimeTable" sender:self];
}
-(void)showManga {
    [self performSegueWithIdentifier:@"segMangaTable" sender:self];
}
-(void)showFaves {
    [self performSegueWithIdentifier:@"segFavourites" sender:self];
}
-(void)showProfile {
    [self performSegueWithIdentifier:@"segProfile" sender:self];
}
@end
