//
//  HomeView.h
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/30.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//extern NSString* MYGlobalVariable;
@interface HomeView : UIViewController
- (IBAction)btnAnime:(id)sender;
- (IBAction)btnManga:(id)sender;
- (IBAction)btnFaves:(id)sender;
- (IBAction)btnProfile:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblWelcome;
@property (weak, nonatomic) IBOutlet UIButton *lblAction;
@property (weak, nonatomic) IBOutlet UIButton *lblGame;
@property (weak, nonatomic) IBOutlet UIButton *lblSliceOfLife;
@property (weak, nonatomic) IBOutlet UIButton *lblAdventure;
@property (weak, nonatomic) IBOutlet UIButton *lblSuperPower;
@property (weak, nonatomic) IBOutlet UIButton *lblMilitary;
@property (weak, nonatomic) IBOutlet UIButton *lblRomance;
@property (weak, nonatomic) IBOutlet UIButton *lblVampire;
@property (weak, nonatomic) IBOutlet UIButton *lblSports;
@property (weak, nonatomic) IBOutlet UIButton *lblSupernatural;
@property (weak, nonatomic) IBOutlet UIButton *lblSchool;
@property (weak, nonatomic) IBOutlet UIButton *lblDrama;
@property (weak, nonatomic) IBOutlet UIButton *lblComedy;
@property (weak, nonatomic) IBOutlet UIButton *lblHorror;
@property (weak, nonatomic) IBOutlet UIButton *lblSciFi;
@property (weak, nonatomic) IBOutlet UIButton *lblFantasy;
@property (weak, nonatomic) IBOutlet UIButton *lblMartialArts;
@property (weak, nonatomic) IBOutlet UIButton *lblKids;
@property (weak, nonatomic) IBOutlet UIButton *lblMagic;
@property (weak, nonatomic) IBOutlet UIButton *lblMystery;


- (IBAction)btnAction:(id)sender;
- (IBAction)btnGame:(id)sender;
- (IBAction)btnSliceOfLife:(id)sender;
- (IBAction)btnSuperPower:(id)sender;
- (IBAction)btnAdventure:(id)sender;
- (IBAction)btnMilitary:(id)sender;
- (IBAction)btnRomance:(id)sender;
- (IBAction)btnVampire:(id)sender;
- (IBAction)btnSports:(id)sender;
- (IBAction)btnSupernatural:(id)sender;
- (IBAction)btnSchool:(id)sender;
- (IBAction)btnDrama:(id)sender;
- (IBAction)btnComedy:(id)sender;
- (IBAction)btnHorror:(id)sender;
- (IBAction)btnSciFi:(id)sender;
- (IBAction)btnFantasy:(id)sender;
- (IBAction)btnMartialArts:(id)sender;
- (IBAction)btnKids:(id)sender;
- (IBAction)btnMagic:(id)sender;
- (IBAction)btnMystery:(id)sender;


@end

NS_ASSUME_NONNULL_END
