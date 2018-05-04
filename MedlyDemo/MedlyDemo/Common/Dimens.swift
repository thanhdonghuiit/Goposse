//
//  Dimens.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/7/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation
import UIKit

struct Dimens {
  
  struct Button {
    static let StandardHeight: CGFloat = 66.0
    static let DoubleStandardHeight: CGFloat = 120
    static let StandardButtonDividerHeight: CGFloat = 1.0
    static let OnboardingTextButtonHeight: CGFloat = 20.0
    struct Font {
      // Font sizes
      static let Standard: CGFloat = 18.0
    }
  }
  
  struct TextEntryField {
    static let StandardHeight: CGFloat = 64.0
    static let DescriptionLabelHeight: CGFloat = 16.0
    static let TextFieldHeight: CGFloat = 30.0
    static let UnderlineHeight: CGFloat = 1.0
    static let ErrorLabelHeight: CGFloat = 17.0
    struct Font {
      // Font sizes
      static let Label: CGFloat = 10.0
      static let ErrorLabel: CGFloat = 11.0
      static let TextField: CGFloat = 19.0
      static let Placeholder: CGFloat = 19.0
    }
  }
  
  struct LabeledCheckboxView {
    static let StandardHeight: CGFloat = 28.0
    static let LabelLeftMargin: CGFloat = 16.0
    static let GroupTopMargin: CGFloat = 10.0
    struct Font {
      // Font sizes
      static let Label: CGFloat = 16.0
    }
  }
  
  struct CheckmarkView {
    static let StandardHeight: CGFloat = 36.0
    static let LabelLeftRightMargin: CGFloat = 16.0
    static let GroupTopMargin: CGFloat = 10.0
    struct Font {
      // Font sizes
      static let Label: CGFloat = 16.0
    }
  }
  
  struct InfoEntryGroup {
    static let InfoLabelTopMargin: CGFloat = 10.0
    static let GroupLabelLeftMargin: CGFloat = 36.0
    static let GroupLabelBottomMargin: CGFloat = 10.0
    static let GroupLabelWidthOffset: CGFloat = 15.0
    static let GroupLabelHeightOffset: CGFloat = 5.0
    static let StepLabelSide: CGFloat = 22.0
    static let StepLabelBorderWidth: CGFloat = 1.0
    static let LineWidth: CGFloat = 1.0
    static let BottomMargin: CGFloat = 25.0
    struct Font {
      // Font sizes
      static let StepLabelText: CGFloat = 12.0
      static let InfoLabelText: CGFloat = 14.0
      static let GroupLabelText: CGFloat = 14.0
    }
  }
  
  struct AddPhotoView {
    static let BottomMargin: CGFloat = 20.0
    static let ChangeButtonHeight: CGFloat = 60.0
  }
  
  struct Splash {
    static let ButtonShadowOffsetX: CGFloat = 0.0
    static let ButtonShadowOffsetY: CGFloat = -0.5
    static let ButtonShadowRadius: CGFloat = 2.0
    static let ButtonShadowOpacity: CGFloat = 1.0
    static let MedlyLogoImageViewWidth: CGFloat = 212.0
    static let MedlyLogoImageViewHeight: CGFloat = 198.0
    static let DescriptionLabelTopMargin: CGFloat = 30.0
    static let DescriptionLabelWidth: CGFloat = 175.0
    static let DescriptionLabelKernAmount: Double = -0.75
    static let MedlyLogoImageCenterYOffset: CGFloat = -60.0
  }
  
  struct Onboarding {
    static let StandardSideMargin: CGFloat = 20.0
    static let StandardTopMargin: CGFloat = 80.0
    static let StandardScrollBottomPadding: CGFloat = 24.0
    static let TitleLeftMargin: CGFloat = 44.0
    static let BackButtonTopMargin: CGFloat = 32.0
    static let BackRightMargin: CGFloat = 30.0
    static let BackButtonWidth: CGFloat = 24.0
    static let BackButtonHeight: CGFloat = 14.0
    
    // Card
    static let CardSideMargin: CGFloat = 8.0
    static let CardTopMargin: CGFloat = 80.0
    static let CardBottomPadding: CGFloat = 20.0
    static let CardCornerRadius: CGFloat = 20.0
    static let CardShadowOffsetX: CGFloat = 0.0
    static let CardShadowOffsetY: CGFloat = 1.0
    static let CardShadowRadius: CGFloat = 2.0
    static let CardShadowOpacity: CGFloat = 1.0
    static let CardTitleSideMargin: CGFloat = 36.0
    static let CardSubtitleSideMargin: CGFloat = 68.0
    static let CardSubtitleImageTopOffsetMargin: CGFloat = 3.0
    static let CardSubtitleImageWidth: CGFloat = 22.0
    static let CardSubtitleImageHeight: CGFloat = 20.0
    static let CardSubtitleTopMargin: CGFloat = 20.0
    static let CardEntrySideMargin: CGFloat = 36.0
    static let CardTitleTopMargin: CGFloat = 32.0
    static let CardTitleMaxHeight: CGFloat = 116.0
    static let CardSubtitleBottomMargin: CGFloat = 60.0
    
    // Login
    static let CardEntryLoginContentTopMargin: CGFloat = 148.0
    static let CardEntryLoginForgotPasswordLabelTopMargin: CGFloat = 20.0
    static let CardEntryLoginForgotPasswordButtonTopMargin: CGFloat = 2.0
    static let LoginTextButtonXOffset: CGFloat = -3.0
    static let LoginTextButtonHeightAdjustment: CGFloat = 5.0
    
    // Signup
    static let CardEntrySignupContentTopMargin: CGFloat = 148.0
    static let ZipFailExplanationTopMargin: CGFloat = 10.0
    static let ZipHoorayLeftMargin: CGFloat = 102.0
    static let ZipHoorayTopMargin: CGFloat = 10.0
    static let ZipSuccessMessageTopMargin: CGFloat = 7.0
    static let SignupConfirmationImageWidth: CGFloat = 75.0
    static let SignupConfirmationImageHeight: CGFloat = 101.0
    static let SignupConfirmationTopMargin: CGFloat = 40.0
    static let SignupConfirmationTitleTopMargin: CGFloat = 30.0
    static let SignupConfirmationSubtitleTopMargin: CGFloat = 20.0
    
    
    // The size of those buttons that look like text
    static let EntryFieldBottomMargin: CGFloat = 5.0
    static let AddPhotoViewBottomMargin: CGFloat = 30.0
    static let StandardHeaderBottomMargin: CGFloat = 20.0
    static let InsuranceHeaderBottomMargin: CGFloat = 40.0
    
    
    struct Font {
      static let SplashText: CGFloat = 26.0
      static let Title: CGFloat = 20.0
      static let CardTitle: CGFloat = 20.0
      static let CardSubtitle: CGFloat = 14.0
      static let TextButton: CGFloat = 14.0
      static let SignupConfirmationSubtitle: CGFloat = 14.0
      
      // Zip
      static let ZipHoorayText: CGFloat = 24.0
      static let ZipSuccessMessage: CGFloat = 12.0
      static let ZipFailEmailExplanation: CGFloat = 12.0
    }
  }
  
  struct Alert {
    static let MainViewHeightMultiplier: CGFloat = 0.5
    static let MainViewWidthMultiplier: CGFloat = 0.7
    static let ActionViewHeightMultiplier: CGFloat = 0.15
    static let MainViewPadding: CGFloat = 8.0
    static let MainViewTopPadding: CGFloat = 18.0
    static let StackViewSpacing: CGFloat = 4.0
    static let CornerRadius: CGFloat = 10.0
    static let IconHeightMultiplier: CGFloat = 0.4
    
    struct Font {
      static let Title: CGFloat = 24
      static let Message: CGFloat = 16
      static let Action: CGFloat = 24
    }
  }

  struct MainFeed {
    static let NavigationBarIconHeight: CGFloat = 22.0
    static let NavigationBarTopInset: CGFloat = 2.0
    
    static let NotificationHeaderTopBottomMargins: CGFloat = 50.0
    static let NotificationHeaderSideMargins: CGFloat = 30.0
    static let NotificationHeaderTitleBottomMargin: CGFloat = 7.0
    static let NotificationFeedCardInsets: CGFloat = 8.0
    
    static let DeliveryNotificationFooterHeight: CGFloat = 60.0
    static let SystemNotificationFooterHeight: CGFloat = 90.0
    
    static let DeliveryHistoryHeaderHeight: CGFloat = 90.0
    static let DeliveryHistoryFooterHeight: CGFloat = 80.0
    static let DeliveryHistoryBottomMargin: CGFloat = 20.0
    
    struct NotificiationView {
      static let MinimumHeight: CGFloat = 170.0
      static let TopBottomMargin: CGFloat = 22.0
      static let SideMargin: CGFloat = 22.0
      static let TitleToMessageMargin: CGFloat = 15.0
      static let MessageToLineMargin: CGFloat = 22.0
      static let ButtonsMargin: CGFloat = 20.0
      static let ImageContentMargin: CGFloat = 14.0
      
      static let ImageViewWidth: CGFloat = 49.0
      static let ImageViewDesirableCircleRadius: CGFloat = 49.0
      static let ImageViewSide: CGFloat = 48.0
      static let DefaultImageViewHeight: CGFloat = 60.0
      static let ButtonLineBottomMargin: CGFloat = 51.0
      static let ImageViewRightMargin: CGFloat = 15.0
      static let ButtonLineViewHeight: CGFloat = 1.0
      static let MainContentLeftMargin: CGFloat = SideMargin
      static let MainContentLeftMarginWithImage: CGFloat = SideMargin + ImageViewWidth + ImageViewRightMargin
      static let TitleToDetailMargin: CGFloat = 20.0
      static let MedicationLabelBottomMargin: CGFloat = 15.0
      static let MedicationLabelQuantityLabelMargin: CGFloat = 2.0
    }
    
    struct DeliveryNotificationView {
      static let DateLabelRightMargin: CGFloat = 8.0
      
      static let LabelKernAmount: CGFloat = 0.38
      static let LabelToTitleMargin: CGFloat = 2.0
      
      static let MessagetoNoteMargin: CGFloat = 14.0
      static let TitleToNoteMargin: CGFloat = 14.0
      static let NoteToLineMargin: CGFloat = 14.0
      static let NoteViewHeight: CGFloat = 20.0
    }
    
    struct FeedNote {
      static let TitleTopMargin: CGFloat = 12.0
      static let TitleBottomMargin: CGFloat = 12.0
      static let TitleSideMargin: CGFloat = 12.0
      static let TitleHeight: CGFloat = 32.0
      static let ButtonHeight: CGFloat = 10.0//32.0
    }
    
    struct DeliveryHistory {
      static let LineHeight: CGFloat = 1.0
      static let BottomMargin: CGFloat = 30.0
      static let DateLabelLeftMargin: CGFloat = 30.0
      static let MainContentTopMargin: CGFloat = 30.0
      static let MainContentBottomMargin: CGFloat = 20.0
      static let MainContentLeftMargin: CGFloat = 100.0
      static let MainContentRightMargin: CGFloat = 30.0
      static let TitleToMainLabelMargin: CGFloat = 2.0
      static let InterhistoryMargin: CGFloat = 20.0
    }
    
    struct DeliveryApproval {
      static let HeaderLabelTextSize: CGFloat = 18.0
      static let BodyLabelTextSize: CGFloat = 16.0
      static let TappableTextSize: CGFloat = 15.0
      
      static let DetailViewHeight: CGFloat = 140.0
      
      static let LabelRightMargin: CGFloat = 40.0
      static let HorizontalIconMargin: CGFloat = 34.0
      static let ButtonHeight: CGFloat = 30.0
      static let IconHeight: CGFloat = 18.0
      static let IconWidth: CGFloat = 30.0
      
      static let VerticalMarginNavLineToFirstView: CGFloat = 40.0
      static let VerticalMarginBodyToChangeLabel: CGFloat = 18.0
      static let VerticalMarginChangeLabelToEnd: CGFloat = 40.0
      static let VerticalMarginHeaderToBodyLabel: CGFloat = 8.0
      
      static let NoteViewTopMargin: CGFloat = 20.0
    }
    
    struct Font {
      static let NotificationHeaderTitle: CGFloat = 24.0
      static let NotificationHeaderSubtitle: CGFloat = 16.0
      static let DeliveryHistoryHeaderTitle: CGFloat = 20.0
      
      struct NotificiationView {
        static let Title: CGFloat = 20.0
        static let MedicationLabel: CGFloat = 16.0
        static let QuantityLabel: CGFloat = 12.0
        static let Message: CGFloat = 13.0
        static let Label: CGFloat = 12.0
        static let ButtonTitle: CGFloat = 16.0
      }
      
      struct DeliveryNotificiationView {
        static let DateLabel: CGFloat = 10.0
      }
      
      struct FeedNote {
        static let Title: CGFloat = 8.0
        static let Note: CGFloat = 12.0
        static let ButtonTitle: CGFloat = 16.0
      }
      
      struct DeliveryHistory {
        static let DateLabel: CGFloat = 10.0
        static let TitleLabel: CGFloat = 14.0
        static let AddressLabel: CGFloat = 16.0
      }
    }
  }
  
  struct StatePicker {
    static let RowHeight: CGFloat = 44.0
  }
  
  struct DateLabel {
    static let Width: CGFloat = 52.0
    static let Height: CGFloat = 21.0
    static let CornerRadius: CGFloat = 10.0
    static let KernAmount: CGFloat = 0.5
    
    struct Font {
      static let Text: CGFloat = 12.0
    }
  }
  
  // MARK: - Insurance Card
  struct InsuranceCard {
    static let MediumInfoDetailsLabelTextSize: CGFloat = 18.0
  }

  // MARK: - Information Card
  struct InformationCard {
    static let CardViewTopMargin: CGFloat = 23.0
    static let CardViewLeftRightMargin: CGFloat = 8.0
    static let CardViewPadding: CGFloat = 20.0
    static let EstimatedTableViewRowHeight: CGFloat = 44
    static let EntryGroupLabelInset: CGFloat = 5
    static let DefaultHeightMargin: CGFloat = 20
    static let TitleToDetailMargin: CGFloat = 5
    static let TableViewHeaderRowHeight: CGFloat = 64
    static let CardImageHeight: CGFloat = 80
    static let CardImageWidth: CGFloat = 130
    static let SeparatorLineHeight: CGFloat = 1.5
    static let IconHeight: CGFloat = 40
    static let IconToTextMargin: CGFloat = 10
    static let ImageBorderWidth: CGFloat = 1.0
    static let ImageCornerRadius: CGFloat = 5.0
    static let ScrollViewLeftRightMargin: CGFloat = 20.0
    static let TableViewContentTopInset: CGFloat = 36.0
    static let SectionHeaderTopBottomPadding: CGFloat = 5.0
    static let SectionHeaderLeftRightPadding: CGFloat = 8.0
    static let ImageFullscreenButtonLength: CGFloat = 44.0
    static let ImageFullscreenButtonOffset: CGFloat = 10.0
    struct Font {
      static let TitleTextSize: CGFloat = 14.0
      static let DetailTextSize: CGFloat = 18.0
      static let SubDetailTextSize: CGFloat = 15.0
    }
  }

  struct InsuranceImage {
    // The scale is like, the dpi kinda?  basically the ImageResizingWidth will be ImageResizingWidth * ImageScale.  Stick to 1.0 IMO
    static let ImageScale: CGFloat = 1.0
    static let ImageResizingHeightToWidthRatio: CGFloat = 0.618
  }
  
  struct NavigationHeaderView {
    static let ViewHeight: CGFloat = 80.0
    static let TitleFontSize: CGFloat = 24.0
    static let BottomBorderViewHeight: CGFloat = 1.0
    static let TitleWidthMultiplier: CGFloat = 0.7
    static let DefaultHeightMultiplier: CGFloat = 0.8
    static let ButtonWidthMultiplier: CGFloat = 0.07
    static let DefaultMargin: CGFloat = 14.0
    struct Font {
      static let TitleSize: CGFloat = 20.0
    }
  }
  
  struct PaperPrescriptionImage {
    static let ImageScale: CGFloat = 1.0
    static let ImageResizingHeightToWidthRatio: CGFloat = Dimens.FeedModal.PaperPrescription.AddPhotoViewImageHeightToWidthRatio
  }
  
  struct FeedModal {
    static let DismissButtonTopMargin: CGFloat = 28.0
    static let DismissButtonLeftMargin: CGFloat = 34.0
    static let DismissButtonRightMargin: CGFloat = 34.0
    static let DismissButtonWidthHeight: CGFloat = 22.0
    static let TitleLeftMargin: CGFloat = 10.0
    static let NavLineTopMargin: CGFloat = 80.0
    static let NavLineHeight: CGFloat = 1.0
    
    struct Font {
      static let Title: CGFloat = 20.0
    }
    
    struct PrescriptionExpected {
      static let NoteViewHeight: CGFloat = 390.0
      static let ContentTopMargin: CGFloat = 32.0
      static let MaleDoctorHeight: CGFloat = 100.0
      static let MaleDoctorWidth: CGFloat = 77.0
      
      // Note view
      static let InstructionsKernAmount: CGFloat = 0.3
      static let ImageToInstructionsMargin: CGFloat = 25.0
      static let InstructionsToTextViewBorderMargin: CGFloat = 15.0
      static let TextViewBorderWidth: CGFloat = 1.0
      static let TextViewLeftRightInset: CGFloat = 14.0
      static let TextViewBorderSideMargin: CGFloat = 30.0
      static let TextViewHeight: CGFloat = 218.0
      
      // Confirmation view
      static let CenterYOffset: CGFloat = 30.0
      static let SubtitleSideMargin: CGFloat = 50.0
      static let ImageToConfirmationMessageTitleMargin: CGFloat = 24.0
      static let ConfirmationMessageTitleToConfirmationMessageMargin: CGFloat = 18.0
      static let BlueExclamationHeadEntry: CGFloat = 15.0
      static let BlueExclamationSide: CGFloat = 52.0
      
      struct Font {
        static let Instructions: CGFloat = 16.0
        static let NoteText: CGFloat = 18.0
        static let PlaceholderText: CGFloat = 18.0
        
        static let ConfirmationTitle: CGFloat = 28.0
        static let ConfirmationMessage: CGFloat = 18.0
      }
    }
    
    struct PaperPrescription {
      static let InstructionsToAddPhotoViewBorderMargin: CGFloat = 15.0
      static let TextViewLeftRightInset: CGFloat = 14.0
      static let AddPhotoViewSideMargin: CGFloat = 60.0
      
      static let AddPhotoViewWidth: CGFloat = 250.0
      static let AddPhotoViewHeight: CGFloat = 300.0 + Dimens.AddPhotoView.ChangeButtonHeight
      static let AddPhotoViewImageHeightToWidthRatio: CGFloat = 300.0/250.0
    }
    
    
  }
  
  struct Profile {
    static let ProfileMenuOptionsViewHeight: CGFloat = 100.0
    static let ProfileMenuOptionsTitleTextSize: CGFloat = 18.0
    static let ProfileMenuOptionsSubtitleTextSize: CGFloat = 14.0
    
    static let ProfileMenuTitleViewTextSize: CGFloat = 20.0
    static let ProfileMenuTitleViewTextKernAmount: Double = 0.62
    
    static let ProfileMenuFooterHorizontalPadding: CGFloat = 23.0
    static let ProfileMenuOptionsViewHorizontalPadding: CGFloat = 23.0
    static let ProfileMenuFooterVerticalPadding: CGFloat = 22.0
    static let ProfileMenuAccessorySize: CGSize = CGSize(width: 22.0, height: 22.0)
    
    static let ProfileMenuFooterTextSize: CGFloat = 15.0
    static let ProfileOptionsMargin: CGFloat = 36.0

    static let ProfileListViewHeight: CGFloat = 90.0
    
    struct Address {
      static let DeleteButtonTextSize: CGFloat = 16.0
      static let DeleteButtonTopMargin: CGFloat = 36.0
      static let CheckmarkHeight: CGFloat = 30.0
      static let CheckmarkBoxBottomMargin: CGFloat = 12.0
      
      static let ListLabelTextSize: CGFloat = 18.0
    }
    
    struct Transfer {
      static let InstructionsTopBottomMargin: CGFloat = 28.0
    }
    
    struct Prescription {
      static let PlaceholderWidthMultiplier: CGFloat = 0.7
      static let PlaceholderTopBottomMargin: CGFloat = 54.0
      static let PlaceholderLabelsMargin: CGFloat = 18.0
    }
    
    struct Insurance {
      static let HorizontalMargin: CGFloat = 36.0
      static let VerticalMarginBottomOfViewToLabel: CGFloat = 48.0
      static let VerticalMarginBottomOfLabelToView: CGFloat = 18.0
      static let VerticalMarginBetweenLabelAndInfo: CGFloat = 16.0
      
      static let AddPhotoViewHeight: CGFloat = 180.0
      static let AddPhotoViewOverlayImageHeight: CGFloat = 60.0
      static let AddPhotoViewOverlayImageWidth: CGFloat = 96.0
      static let AddPhotoHeightToWidthRatio: CGFloat = 0.618
      
    }
    
    struct PackagingPreference {
      static let TitleTextSize: CGFloat = 20
      static let DescriptionTextSize: CGFloat = 17
      static let StackViewTopMargin: CGFloat = 60
      static let StackViewMargin: CGFloat = 34
      static let LargeIconHeightMultiplier: CGFloat = 0.24
      static let DescriptionLabelHeightMultilier: CGFloat = 0.3
      static let TitleLabelHeightMultiplier: CGFloat = 0.1
      static let StackViewSpacing: CGFloat = 0
    }
    
    struct CreditCard {
      static let HorizontalSpaceCardNameToLast4: CGFloat = 24.0
      static let VerticalMarginHeaderLabelToHeaderBottom: CGFloat = 16.0
    }
  }
}
