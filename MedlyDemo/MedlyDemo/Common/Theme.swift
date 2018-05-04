//
//  Theme.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/7/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
  struct Color {
    // App colors
    static let Primary: UIColor = Colors.White
    static let PrimaryDark: UIColor = Colors.White
    static let Accent: UIColor = Colors.White
    static let Highlight: UIColor = Colors.FacebookBlue
    
    struct Splash {
      static let ButtonShadowColor: UIColor = UIColor(hex: 0x000000)
    }
    
    struct Onboarding {
      static let Background: UIColor = Colors.PracticallyWhite
      static let CardBackground: UIColor = Colors.White
      static let CardShadowColor: UIColor = Colors.GrayAAAAAA
      static let CardTitleText = Colors.SlateGray
      static let CardSubitleText = Colors.GrayAAAAAA
      static let CardSubitleImage = Colors.GrayCCCCCC
      static let TextButtonNormal = Colors.Teal
      static let TextButtonHighlighted = Colors.DarkSlateGray
    }
    
    struct MainFeed {
      static let Background: UIColor = Onboarding.Background
      static let CardBackground: UIColor = Onboarding.CardBackground
      static let CardShadowHighlighted: UIColor = Colors.Gray888888
      static let CardShadowColor: UIColor = Onboarding.CardShadowColor
      
      static let NotificationFeedHeaderTitle: UIColor = Colors.DarkSlateGray
      static let NotificationFeedHeaderSubtitle: UIColor = Colors.CoolGray
      
      struct NotficationView {
        static let Title: UIColor = Colors.DarkSlateGray
        static let MedicationLabel: UIColor = Colors.Teal
        static let QuantityLabel: UIColor = Colors.GrayAAAAAA
        static let FailTitle: UIColor = Colors.PaleRed
        static let Message: UIColor = Colors.GrayAAAAAA
        static let Label: UIColor = Colors.CoolRed
        static let ButtonLine: UIColor = Colors.GrayDDDDDD
        static let Button0Normal: UIColor = Colors.Teal
        static let Button0Highlighted: UIColor = Colors.DarkSlateGray
        static let Button1Normal: UIColor = Colors.GrayAAAAAA
        static let Button1Highlighted: UIColor = Colors.DarkSlateGray
      }
      
      struct DeliveryNotficationView {
        static let DateLabelBackground: UIColor = UIColor.clear
        static let DateLabelText: UIColor = Colors.Gray9B9B9B
      }
      
      struct FeedNote {
        static let BackgroundColor: UIColor = Onboarding.CardBackground
        static let TitleText: UIColor = Colors.GrayAAAAAA
        static let NoteText: UIColor = Colors.GrayAAAAAA
        static let ButtonNormal: UIColor = Colors.Teal
        static let ButtonHighlighted: UIColor = Colors.DarkSlateGray
      }
      
      struct DeliveryHistory {
        static let LineColor: UIColor = Colors.GrayAAAAAA.withAlphaComponent(0.5)
        static let DateLabelBackground: UIColor = Colors.DullBlue
        static let DateLabelText: UIColor = Colors.White
        static let TitleLabel: UIColor = Colors.CoolGray
        static let AddressLabel: UIColor = Colors.CoolishGray
      }
      
      struct DeliveryApproval {
        static let HeaderLabel: UIColor = Colors.MostlyDeliveryBlue
        static let BodyLabel: UIColor = Colors.GrayAAAAAA
        static let ChangeLabel: UIColor = Colors.Teal
      }
      
    }
    
    struct FeedModal {
      static let Background: UIColor = Colors.White
      static let NavLine: UIColor = Colors.GrayDDDDDD
      static let TitleText: UIColor = Colors.DarkSlateGray
      
      struct PrescriptionExpected {
        static let Instructions: UIColor = Colors.DarkSlateGray
        static let TextViewBorderColor: UIColor = Colors.GrayCCCCCC
        static let NoteText: UIColor = Colors.DarkSlateGray
        static let NoteTextPlaceholder: UIColor = Colors.GrayDDDDDD
        static let NoteCursorColor: UIColor = Colors.Teal
        static let ConfirmationTitle: UIColor = Colors.DarkSlateGray102D4B
        static let ConfirmationMessage: UIColor = Colors.DarkSlateGray102D4B
      }
    }
    
    struct Button {
      static let Normal: UIColor = Colors.Teal
      static let Divider: UIColor = UIColor.clear
      static let Highlighted: UIColor = Colors.GrayDDDDDD
      static let Disabled: UIColor = Colors.GrayDDDDDD
      static let CancelPhotoSession: UIColor = Colors.PaleRed
      static let Text: UIColor = Colors.White
    }
    
    struct TextEntryField {
      static let EnteredText: UIColor = Colors.DarkSlateGray
      static let PlaceholderText: UIColor = Colors.GrayDDDDDD //Colors.GrayAAAAAA
      static let DescriptionLabel: UIColor = Colors.GrayAAAAAA
      static let DivderNormal: UIColor = Colors.GrayCCCCCC
      static let DivderHighlighted: UIColor = Colors.GrayAAAAAA
      static let Error: UIColor = Colors.PaleRed
    }
    
    struct AddPhotoView {
      static let ChangeButton: UIColor = Colors.Teal
      static let ChangeButtonHighlighted: UIColor = Colors.DarkSlateGray102D4B
    }
    
    struct LabeledCheckboxView {
      static let Background: UIColor = Colors.White
      static let SelectedBackground: UIColor = Colors.Teal
      static let Check: UIColor = Colors.White
      static let LabelSelected: UIColor = Colors.DarkSlateGray
      static let LabelUnselected: UIColor = Colors.GrayAAAAAA
      static let Border: UIColor = Colors.Teal
    }
    
    struct InfoEntryGrouper {
      static let InfoLabelText: UIColor = Colors.GrayAAAAAA
      static let GroupLabelBackground: UIColor = Colors.DullBlue
      static let GroupLabelText: UIColor = Colors.White
      static let StepLabelText: UIColor = Colors.DullBlue
      static let StepLabelBorder: UIColor = Colors.DullBlue
      static let StepLabelTextInvalid: UIColor = Colors.GrayDDDDDD
      static let StepLabelBorderInvalid: UIColor = Colors.GrayDDDDDD
      static let LineColor: UIColor = Colors.DullBlue
      static let LineColorInvalid: UIColor = Colors.GrayDDDDDD
    }
    
    struct Font {
      static let Dark: UIColor = Colors.DarkSlateGray
      static let LighterGray: UIColor = Colors.LighterGray
    }
    
    struct TappableSettings {
      static let BackgroundColorNormal: UIColor = Theme.Color.Onboarding.CardBackground
      static let BackgroundColorHighlighted: UIColor = Colors.Teal.adjustAlpha(value: 0.25)
    }
  }
  
  
  
  struct Font {
    struct HelveticaNeue {
      static let Regular: String = "HelveticaNeue"
    }
    
    struct SanFranciscoText {
      static let Light: String = "SFUIText-Light"
      static let Regular: String = "SFUIText-Regular"
      static let Bold: String = "SFUIText-Bold"
      static let Semibold: String = "SFUIText-Semibold"
      static let Medium: String = "SFUIText-Medium"
    }
    
    struct AvenirNext {
      static let Light: String = "AvenirNext-UltraLight"
      static let Regular: String = "AvenirNext-Regular"
      static let Bold: String = "AvenirNext-Bold"
    }
    
    struct App {
      static let Regular: String = Font.SanFranciscoText.Regular
      static let Light: String = Font.SanFranciscoText.Light
      static let Bold: String = Font.SanFranciscoText.Bold
      static let Medium: String = Font.SanFranciscoText.Medium
      static let Fancy: String = Font.HelveticaNeue.Regular
    }
    
    struct Feed {
      // System Notifications
      static let Title: UIFont = UIFont(name: Theme.Font.App.Light, size: Dimens.MainFeed.Font.NotificiationView.Title)!
      static let Message: UIFont = UIFont(name: Theme.Font.App.Regular, size: Dimens.MainFeed.Font.NotificiationView.Message)!
      static let Button1: UIFont = UIFont(name: Theme.Font.App.Bold, size: Dimens.MainFeed.Font.NotificiationView.ButtonTitle)!
      static let Button2: UIFont = UIFont(name: Theme.Font.App.Bold, size: Dimens.MainFeed.Font.NotificiationView.ButtonTitle)!
      static let MedicationLabel: UIFont = UIFont(name: Theme.Font.App.Medium, size: Dimens.MainFeed.Font.NotificiationView.MedicationLabel)!
      static let QuantityLabel: UIFont = UIFont(name: Theme.Font.App.Regular, size: Dimens.MainFeed.Font.NotificiationView.QuantityLabel)!
      
      // Delivery Notifications
      static let DeliveryLabel: UIFont = UIFont(name: Theme.Font.App.Medium, size: Dimens.MainFeed.Font.NotificiationView.Label)!
      static let NoteLabel: UIFont = UIFont(name: Theme.Font.App.Regular, size: Dimens.MainFeed.Font.FeedNote.Note)!
      
      // Delivery History
      static let DeliveryHistoryTitleLabel: UIFont = UIFont(name: Theme.Font.App.Medium, size: Dimens.MainFeed.Font.DeliveryHistory.TitleLabel)!
      static let DeliveryHistoryMainLabel: UIFont = UIFont(name: Theme.Font.App.Light, size: Dimens.MainFeed.Font.DeliveryHistory.AddressLabel)!
    }
    
    struct Alert {
      static let Title: UIFont = UIFont(name: Theme.Font.App.Regular, size: Dimens.Alert.Font.Title)!
      static let Message: UIFont = UIFont(name: Theme.Font.App.Light, size: Dimens.Alert.Font.Message)!
      static let Action: UIFont = UIFont(name: Theme.Font.App.Medium, size: Dimens.Alert.Font.Action)!
    }
  }
}

struct Colors {
  // Special use colors
  static let FacebookBlue: UIColor = UIColor(hex: 0x3B5998)
  static let InstagramBlue: UIColor = UIColor(hex: 0x3F729B)
  static let Black: UIColor = UIColor(hex: 0x000000)
  static let White: UIColor = UIColor(hex: 0xFFFFFF)
  static let PracticallyWhite: UIColor = UIColor(hex: 0xF7F7F7)
  static let SlateGray: UIColor = UIColor(hex: 0x707D8D)
  static let DarkSlateGray: UIColor = UIColor(hex: 0x012040)
  static let DarkSlateGray102D4B: UIColor = UIColor(hex: 0x102D4B)
  static let Dark: UIColor = UIColor(hex: 0x3F3447)
  static let DarkGray: UIColor = UIColor(hex: 0x979797)
  static let GrayDDDDDD: UIColor = UIColor(hex: 0xDDDDDD)
  static let GrayCCCCCC: UIColor = UIColor(hex: 0xCCCCCC)
  static let GrayAAAAAA: UIColor = UIColor(hex: 0xAAAAAA)
  static let GrayApple: UIColor = UIColor(hex: 0xD3D6DD)
  static let Gray9B9B9B: UIColor = UIColor(hex: 0x9B9B9B)
  static let Gray888888: UIColor = UIColor(hex: 0x888888)
  static let LighterGray: UIColor = UIColor(hex: 0xA5A5A5)
  static let Teal: UIColor = UIColor(hex: 0x56CCB1)
  static let LightTeal: UIColor = UIColor(hex: 0x64D3BF)
  static let PaleRed: UIColor = UIColor(hex: 0xFA6F80)
  static let DullBlue: UIColor = UIColor(hex: 0x6BA3E5)
  static let CoolGray: UIColor = UIColor(hex: 0x5C6B7F)
  static let CoolishGray: UIColor = UIColor(hex: 0x6F7F91)
  static let CoolRed: UIColor = UIColor(hex: 0xF0465A)
  static let AttentionRed: UIColor = UIColor(hex: 0xF24155)
  static let PrettyMuchBlackBlue: UIColor = UIColor(hex: 0x002C51)
  static let LightMidBlue: UIColor = UIColor(hex: 0x69A3E7)
  static let MostlyDeliveryBlue: UIColor = UIColor(hex: 0x0B2947)
  static let PendingStatusOrange : UIColor = UIColor(hex: 0xFF9116)
}

struct MainFeedImages {
  static let FailureImage: String = "failure"
  static let GreenShirtDude: String = "green_shirt_dude.png"
  static let MaleDoctor: String = "male_doctor.png"
  static let FemaleDoctor: String = "female_doctor.png"
  static let RxPillBottle: String = "rx_pill_vial.png"
  static let DeliveryVan: String = "delivery_van.png"
  static let InfoCard: String = "info_card.png"
  static let WordMark: String = "word_mark.png"
//  static let NavbarLogo: String = "icon_navbar_logo.png"
  static let NavBarLogo: String = "icon_circle_logo.png"
  static let NavBarTitle: String = "icon_name.png"
  static let NavBarProfile: String = "icon_profile.png"
  static let BlueCircleDeliveryVan: String = "image_delivery_van"
  static let PharmacyMessageIcon: String = "icon_home_message"
  static let PharmacyCallIcon: String = "icon_home_call"
}

struct DeliveryApprovalImages {
  static let SuccessVan: String = "success_van.png"
  static let NoteIcon: UIImage? = UIImage(named: "icon_delivery_note")
}

struct ProfileOptionIcons {
  static let PersonalInfo: UIImage? = UIImage(named: "avatar_icon")
  static let Family: UIImage? = UIImage(named: "family_members")
  static let HomeIcon: UIImage? = UIImage(named: "home_icon")
  static let DeliveryAddress: UIImage? = UIImage(named: "delivery_van")
  static let Insurance: UIImage? = UIImage(named: "insurance_card")
  static let CreditCard: UIImage? = UIImage(named: "credit_card")
  static let Packaging: UIImage? = UIImage(named: "cardboard_box")
  static let Refills: UIImage? = UIImage(named: "reminders")
  static let Prescriptions: UIImage? = UIImage(named: "pill_bottle")
  static let Medications: UIImage? = UIImage(named: "my_rx")
  static let TransferPrescription: UIImage? = UIImage(named: "rx_transfer")
  static let Chevron: UIImage? = UIImage(named: "chevron_right")
  static let Warning: UIImage? = UIImage(named: "alert_accessory")
  static let StatusPie: UIImage? = UIImage(named: "status_pie")
  static let Allergies: UIImage? = UIImage(named: "allergies")
  static let FemaleDoctor: UIImage? = UIImage(named: MainFeedImages.FemaleDoctor)
}

struct Prescriptions {
  static let Placeholder: UIImage? = UIImage(named: "prescriptions_placeholder")
}

struct IntroSceneImages {
  static let Scene1: UIImage? = UIImage(named: "onboarding_walkthrough_1")
  static let Scene2: UIImage? = UIImage(named: "onboarding_walkthrough_2")
  static let Scene3: UIImage? = UIImage(named: "onboarding_walkthrough_3")
  static let Scene4: UIImage? = UIImage(named: "onboarding_walkthrough_4")
  static let Scene5: UIImage? = UIImage(named: "onboarding_walkthrough_5")
  static let Scene6: UIImage? = UIImage(named: "onboarding_walkthrough_6")
  static let Scene7: UIImage? = UIImage(named: "onboarding_walkthrough_7")
  static let Scene8: UIImage? = UIImage(named: "onboarding_walkthrough_8")
}

struct AlertImages {
  static let DoctorCheckmark: UIImage? = UIImage(named: "icon_doctor_checkmark")
  static let MaleDoctor: UIImage? = UIImage(named: "male_doctor")
}

struct PackagePreferenceImages {
  static let InfoIcon: UIImage? = UIImage(named: "icon_info")
  static let Checkmark: UIImage? = UIImage(named: "icon_checkmark")
  static let VialIcon: UIImage? = UIImage(named: "icon_vial")
  static let BlisterIcon: UIImage? = UIImage(named: "icon_blister")
  static let PouchIcon: UIImage? = UIImage(named: "icon_pouch")
  static let VialLargeIcon: UIImage? = UIImage(named: "icon_large_vial")
  static let BlisterLargeIcon: UIImage? = UIImage(named: "icon_large_blister")
  static let PouchLargeIcon: UIImage? = UIImage(named: "icon_large_pouch")
  
}

//struct IntroSceneImages {
//  static let Scene1: UIImage? = UIImage(named: "box_screen_1")
//  static let Scene2: UIImage? = UIImage(named: "people_waiting_screen_2")
//  static let Scene3: UIImage? = UIImage(named: "cyclist_screen_3")
//  static let Scene4: UIImage? = UIImage(named: "looking_at_phone_screen_4")
//  static let Scene5: UIImage? = UIImage(named: "tell_your_dr_screen_5")
//  static let Scene6: UIImage? = UIImage(named: "prescription_alert_screen_6")
//  static let Scene7: UIImage? = UIImage(named: "delivery_guys_screen_7")
//  static let Scene8: UIImage? = UIImage(named: "celebration_screen_8")
//}


struct InsuranceCardImages {
  static let InsuranceCard: UIImage? = UIImage(named: "insurance_card_large")
}
