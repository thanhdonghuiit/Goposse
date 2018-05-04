//
//  Strings.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/7/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

struct Strings {
  
  struct NetworkErrorMessages {
    static let standardTitle: String = "Error"
    static let standardDebugMessage: String = "There was an error while trying to execute, and a reason was unable to be determined!  It's possible there is an error in your code.  This is a debug message.".localize()
    static let standardMessage: String = "Sorry, there was an error processing your request!".localize()
  }
  
  struct ResultMessages {
    static let Success: String = "Success".localize()
    static let NSErrorDomain: String = "Domain".localize()
    static let NSErrorCode: String = "Code".localize()
    static let NSErrorDescription: String = "Description".localize()
    
    struct GeocodeHelper {
      static let ZipToCityFailure: String = "We were unable to match this zip code to a city.".localize()
    }
    
    struct CameraSession {
      static let CameraSessionErrorTitle: String = "Camera Error".localize()
      static let AddInputErrorThrown: String = "There was an error thrown while trying to connect to a camera.".localize()
      static let NoBackFacingCameraFound: String = "Unable to locate a back facing camera on this device.".localize()
      static let BackFacingCameraUnableToOutput: String = "A back facing camera was found, but it is unable to output images".localize()
    }
    
    struct InsuranceImages {
      static let UnableToConvertToBlob: String = "Unable to convert insurance images to a blob.  Please try again.".localize()
    }
    
    struct PrescriptionImages {
      static let UnableToProcessImage: String = "Sorry, there was an error processing this image.  Please try again".localize()
    }
    
    struct ResendAccessCode {
      static let Title: String = ResultMessages.Success
      static let Message: String = "A new access code should be on the way.".localize()
    }
    
    struct Feed {
      static let FailedToPullToRefreshTitle: String = "Pull to refresh failed".localize()
      static let FailedToPullToRefreshMessage: String = "Sorry about that. Please check your connection and try again".localize()
      static let FailedToLoadDeliveryHistoriesTitle: String = "Unable to load additional delivery histories!".localize()
      static let NoPharmacyInfoAttachedToUserMessage: String = "It looks like we can't find a pharmacy attached to your profile!  You may need to update your delivery addresses.  If you continue having trouble, please contact us from the profile.  Sorry about that!".localize()
      static let NoPharmacyInfoAttachedToUserTitle: String = "No Pharmacy Information".localize()
      static let CallPharmacyConfirmationTitle: String = "Call Pharmacy".localize()
      static let CallPharmacyConfirmationMessage: String = "Are you sure you want to call?".localize()
      static let CallPharmacyConfirmationAction: String = "Call".localize()
      static let FailedToLaunchTelephoneTitle: String = "Unable to call".localize()
      static let FailedToLaunchTelephoneMessage: String = "There was an error while trying to call this number:".localize()
      
      static let TextPharmacyConfirmationTitle: String = "Text Pharmacy".localize()
      static let TextPharmacyConfirmationMessage: String = "Are you sure you want to send a message?".localize()
      static let TextPharmacyConfirmationAction: String = "Yes".localize()
      static let FailedToTextTelephoneTitle: String = "Unable to text".localize()
      static let FailedToTextTelephoneMessage: String = "There was an error while trying to text this number:".localize()
      
     
    }
    
    struct CreditCardMessages {
      static let SuccessfulEdit: String = "You card has been successfully updated".localize()
      static let SuccessfulAdd: String = "Your card has been added successfully".localize()
    }

    struct FamilyMemberMessages {
      static let SuccessfulSave: String = "Your family member has been saved!".localize()
      static let SuccessfulEdit: String = "Your family member has been updated!".localize()
      static let SuccessfulDelete: String = "Your family member has been removed.".localize()
    }
    
    struct PersonalInfoMessages {
      static let SuccessfulEdit: String = "Your info has been updated!".localize()
    }
    
    struct PrescriptionTransferMessage {
      static let SuccessfulTransfer: String = "Your transfer has been submitted. Your pharmacist may call you for further instruction if needed".localize()
    }
    
    struct InsuranceMessage {
      static let SuccessfulUpdate: String = "Your insurance info has been updated!".localize()
    }
    
    struct ApproveDeliveryModal {
      static let NoDeliveryAddressTitle: String = "No delivery address".localize()
      static let NoDeliveryAddressMessage: String = "Oops! Looks like you haven't selected a delivery address!  Please select one, or add a new one.".localize()
    }
    
    struct AllergiesMessage {
      static let SuccessfulAllergyInfoUpdate: String = "Your allergy info was successfully updated.".localize()
    }
    
    struct PhysicianMessage {
      static let SuccessfulSave: String = "Your physician's information has been saved!".localize()
      static let SuccessfulEdit: String = "Your physician's information has been updated!".localize()
      static let SuccessfulDelete: String = "Your physician's information has been deleted.".localize()
    }
    
    struct AddressMessage {
      static let SuccessfulSave: String = "Your address information has been saved!".localize()
      static let SuccessfulEdit: String = "Your address information has been updated!".localize()
      static let SuccessfulDelete: String = "Your address information has been deleted.".localize()
    }
    
//    icon: AlertImages.MaleDoctor!,
//    title: "Medly is HIPAA compliant!",
//    message: "All of your personal and health information is private, protected, and secure.",
//    actionTitle: Strings.ResultMessages.AlertMessage.RXTransferActionTitle,
//    actionCompleted: {
//    UserDefaults.standard.set(true, forKey: "has_seen_hipaa_compliance_notification")
//    })
    struct AlertMessage {
      static let SessionExpiredTitle: String = "Session Expired".localize()
      static let SessionExpiredBody: String = "You have been logged out for security purposes due to inactivity.".localize()
      static let RXTransferTitle: String = "Success!".localize()
      static let RXTransferMessage: String = "Your transfer has been submitted. Your pharmacist may call you for further instructions if needed.".localize()
      static let RXTransferActionTitle: String = "Ok".localize()
      static let HIPAAComplianceTitle: String = "Medly is HIPAA compliant!".localize()
      static let HIPAAComplianceMessage: String = "All of your personal and health information is private, protected, and secure.".localize()
      static let HIPAAComplianceActionTitle: String = Strings.Generic.Ok
      
    }
  }
  
  struct StatePicker {
    static let SelectState: String = "Select State".localize()
  }

  struct Buttons {
    // Splash
    static let SplashLogIn: String = "Log In".localize()
    static let SplashSignUp: String = "Get Started".localize()
    
    // Log in
    static let OnboardingLogInForgotPassword: String = "Tap here to reset it.".localize()
    static let OnboardingLogInStep1: String = "Continue".localize()
    static let OnboardingLogInStep2: String = "Log in".localize()
    static let OnboardingLogInCodeResend: String = "Tap here to send a new one.".localize()
    static let OnboardingLogInCodeInaccessible: String = "I cannot access my code".localize()
    static let OnboardingLogInForgotPasswordSend: String = "Send instructions".localize()
    
    // Sign up
    static let OnboardingSignUpInitial: String = "Next".localize()
    static let OnboardingSignUpZip: String = "Check".localize()
    static let OnboardingSignUpInfo: String = "Create Secure Account".localize()
    static let OnboardingSignupOutOfArea: String = "Notify me when Medly is available".localize()
    static let OnboardingSignupTakePhoto: String = "Take Photo".localize()
    static let OnboardingSignupConfirmation: String = "OK!".localize()
    
    //Home
    static let TextMedly: String = "Text Medly".localize()
    static let CallMedly: String = "Call Medly".localize()
    
    // Generic
    static let Next: String = "Next".localize()
    static let Skip: String = "Skip for now".localize()
    static let Save: String = "Save".localize()
    static let Cancel: String = "Cancel".localize()
    static let Delete: String = "Delete".localize()
    static let MakeDefault: String = "Make Default".localize()
    static let ConfirmDelete: String = "Confirm Delete".localize()
    static let LogoutConfirm: String = "Log out?".localize()
  }
  
  struct TextEntryFields {
    static let LoginEmailPlaceholder: String = "Email".localize()
    static let LoginPasswordPlaceholder: String = "Password".localize()
    static let LoginConfirmationCodeDescription: String = "Code".localize()
    static let LoginConfirmationCodePlaceholder: String = "Code (check your email)".localize()
    
    // Sign up
    static let SignupZipPlaceholder: String = "Zip Code".localize()
    static let SignupFirstNamePlaceholder: String = "First name".localize()
    static let SignupLastNamePlaceholder: String = "Last name".localize()
    static let SignupEmailPlaceholder: String = "Email".localize()
    static let SignupPhoneNumberDescription: String = "Phone".localize()
    static let SignupPhoneNumberPlaceholder: String = "Phone number".localize()
    static let SignupPasswordPlaceholder: String = "Password".localize()
    static let BirthdayMonthPlaceholder: String = "MM".localize()
    static let BirthdayDayPlaceholder: String = "DD".localize()
    static let BirthdayYearPlaceholder: String = "YYYY".localize()
    
    // Address
    static let AddressStreet1Placeholder: String = "Street 1".localize()
    static let AddressStreet2Placeholder: String = "Apt #, etc. (optional)".localize()
    static let AddressStreet2Description: String = "Street 2".localize()
    static let AddressCityPlaceholder: String = "City".localize()
    static let AddressStatePlaceholder: String = "State".localize()
    static let AddressZipPlaceholder: String = "Zip".localize()
    
    // Insurance
    static let InsuranceCardFront: String = "Front of insurance card".localize()
    static let InsuranceCardBack: String = "Back of insurance card".localize()
    static let InsuranceProviderPlaceholder: String = "Insurance Provider".localize()
    static let InsuranceGroupNumberPlaceholder: String = "Group Number".localize()
    static let InsuranceMemberIdPlaceholder: String = "Member ID".localize()
    static let InsuranceProviderPhoneNumberPlaceholder: String = "Provider Phone Number".localize()
    static let InsuranceUserPlaceholder: String = "Insurance User".localize()
    
    // Credit Card
    static let CreditCardNumberPlaceholder: String = "Card number".localize()
    static let CreditCardNameOnCardPlaceholder: String = "Name on Card".localize()
    static let CreditCardCVVPlaceholder: String = "CVV".localize()
    static let CreditCardExpiration: String = "Expiration".localize()
    static let CreditCardExpirationMonthPlaceholder: String = "MM".localize()
    static let CreditCardExpirationYearPlaceholder: String = "YY".localize()
    
    // Prescriptions
    static let TransferPharmacyNamePlaceholder: String = "Pharmacy Name".localize()
    static let TransferPharmacyPhoneNumberPlaceholder: String = "Pharmacy Phone Number".localize()
    static let TransferPharmacyStreetPlaceholder: String = "Pharmacy Street (optional)".localize()
    static let TransferPharmacyCityPlaceholder: String = "Pharmacy City (optional)".localize()
    static let TransferPharmacyStatePlaceholder: String = "Pharmacy State (optional)".localize()
    static let TransferPrescriptionNamesPlaceholder: String = "Prescription Names (optional) ".localize()
    
    static let Why: String = "why?".localize()
    static let Optional: String = "optional".localize()
    
    // Personal Info
    static let NewPassword: String = "New Password".localize()
    static let ConfirmPassword: String = "Confirm Password".localize()
    
    // Allergies
    static let AllergiesCheckmarkBoxText: String = "I do not have any allergies".localize()
    static let AllergiesPeekingText: String = "Allergies".localize()
    static let AllergiesPlaceholder: String = "List your allergies...".localize()
    
    // Doctor Info
    static let DoctorFirstNameDescription: String = "First name".localize()
    static let DoctorFirstNamePlaceholder: String = "First name (optional)".localize()
    static let DoctorLastNamePlaceholder: String = "Last name".localize()
    static let DoctorEmailDescription: String = "Email".localize()
    static let DoctorEmailPlaceholder: String = "Email (optional)".localize()
    static let DoctorPhoneNumberDescription: String = "Phone".localize()
    static let DoctorPhoneNumberPlaceholder: String = "Phone number".localize()
    static let DoctorStreet1Description: String = "Street 1".localize()
    static let DoctorStreet1Placeholder: String = "Street 1 (optional)".localize()
    static let DoctorStreet2Description: String = "Street 2".localize()
    static let DoctorStreet2Placeholder: String = "Apt #, etc. (optional)".localize()
    static let DoctorCityDescription: String = "City".localize()
    static let DoctorCityPlaceholder: String = "City (optional)".localize()
    static let DoctorStateDescription: String = "State".localize()
    static let DoctorStatePlaceholder: String = "State (optional)".localize()
    static let DoctorZipDescription: String = "Zip".localize()
    static let DoctorZipPlaceholder: String = "Zip (optional)".localize()
    
    //Family 
    static let FamilyMemberFirstNamePlaceholder: String = "First name".localize()
    static let FamilyMemberLastNamePlaceholder: String = "Last name".localize()
    static let FamilyMemberBirthdayMonthPlaceholder: String = "MM".localize()
    static let FamilyMemberBirthdayDayPlaceholder: String = "DD".localize()
    static let FamilyMemberBirthdayYearPlaceholder: String = "YYYY".localize()
    static let FamilyMemberGenderPlaceholder: String = "Gender".localize()
    static let FamilyMemberRelationshipPlaceholder: String = "Relationship".localize()
  }
  
  struct ValidationMessages {
    static let Title: String = "Incomplete information".localize()
    static let GenericMessage: String = "Please fill out all required fields.".localize()
    static let EnterValidEmail: String = "Please enter a valid email address.".localize()
    static let EnterValidPhoneNumber: String = "Please enter a valid +1 phone number.".localize()
    static let EnterValidZipCode: String = "Please enter a valid 5 digit zip code.".localize()
    static let EnterValidPassword: String = "Please enter a password.".localize()
    static let EnterValidBirthday: String = "Please enter a valid MM/DD/YYYY date.".localize()
    static let EnterRequiredField: String = "This value is required.".localize()
    static let EnterRequiredImage: String = "An image is required.".localize()
    static let AcceptRequiredCheckbox: String = "Please accept these terms.".localize()
    static let NumbersOnly: String = "Only numbers can be entered".localize()
    static let NotAValidDeliveryZipCode: String = "This zip code is not eligible for delivery".localize()
  }
  
  struct Generic {
    static let Warning:String = "Warning!".localize()
    static let Ok: String = "Ok".localize()
    static let Cancel: String = "Cancel".localize()
    static let Delete: String = "Delete".localize()
    static let Change: String = "Retake photo".localize()
  }
  
  struct Notifications {
    static let InAppNotificationTitle: String = "Notification".localize()
  }
  
  struct Permissions {
    static let GoToSettings: String = "Go to settings".localize()
    static let NeedCameraPermissionsTitle: String = "Camera permisssions denied".localize()
    static let NeedCameraPermissionsMessage: String = "To take photos you will need to grant permission to this app in your settings".localize()
  }
  
  struct OnboardingTitles {
    static let Login: String = "Welcome to Medly!".localize()
    static let LoginConfirm: String = "Verify security code.".localize()
    static let LoginForgotPassword: String = "Forgot password.".localize()
    static let SignupZipCheck: String = "Hi! Is Medly in your area?".localize()
    static let SignupZipCheckFail: String = "Aww, shucks.".localize()
    static let SignupInfo: String = "Let’s get started.".localize()
    static let SignupAddress: String = "We’ll need an address.".localize()
    static let SignupInsurance: String = "Add your insurance.".localize()
    static let SignupConfirmation: String = "Perfect!".localize()
  }
  
  struct CardTitles {
    static let Login: String = "Enter your email and password to login.".localize()
    static let LoginConfirm: String = "We sent a security code to your email. Please enter it below to continue.".localize()
    static let LoginForgotPassword: String = "Enter your email below and we will send you recovery information.".localize()
    static let SignupZipCheck: String = "Enter your delivery zip code to see if Medly can deliver prescriptions in your area.".localize()
    static let SignupZipCheckFail: String = "We aren’t in 90210 yet. Enter an email and we’ll notify you as soon as we are!".localize()
    static let SignupInfo: String = "To begin deliveries, we’ll need to know a bit about you.".localize()
    static let SignupAddress: String = "Please enter your primary prescription delivery address.".localize()
    static let SignupInsurance: String = "We can automatically bill your insurance. Just add photos of your insurance card.".localize()
  }
  
  struct MainFeed {
    static let DefaultNotificationSubtitle: String = "Feel free to kick back,\nyour meds are on their way ".localize()
    static let DeliveryHistory: String = "Delivery History".localize()
    static let FeedNoteTitle: String = "Note From Medly".localize()
    static let FeedNoteButtonTitle: String = "SEE DETAILS".localize()
    static let MedicationQuantity: String = "QTY".localize()
    static let RxNumber: String = "Rx #".localize()
    // Delivery History
    static let DeliveryHistoryTitle: String = "Prescription Delivered".localize()
    static let DeliveryHistoryLoadMore: String = "Load More".localize()
    static let DeliveryOutForDelivery = "Your prescription has already been scheduled for delivery. We cannot make changes at this time. Please call the pharmacy at %@ to speak to a Pharmacist."
    static let LoadFailTitle: String = "The server could not be reached.".localize()
    static let LoadFailMessage: String = "Unexpected server error.".localize()
    static let LoadFailButton1: String = "RELOAD".localize()
  }
  
  struct InformationCard {
    static let NavigationTitle: String = "Info".localize()
    static let CardInstruction: String = "Present this information to your doctor.".localize()
    static let PharmacySectionHeader: String = "Pharmacy".localize()
    static let PharmaciesSectionHeader: String = "Pharmacies".localize()
    static let InsuranceSectionHeader: String = "Insurance".localize()
    static let PayOutOfPocketSectionHeader: String = "Opt to Pay Out of Pocket".localize()
    static let OtherSectionHeader: String = "Other".localize()
    static let PharmacyNameTitle: String = "Name".localize()
    static let PharmacyAddressTitle: String = "Address".localize()
    static let PharmacyNPITitle: String = "NPI#".localize()
    static let PharmacyPhoneTitle: String = "Phone#".localize()
    static let PharmacyFaxTitle: String = "Fax#".localize()
    static let InsuranceCardFrontTitle: String = "Card - Front".localize()
    static let InsuranceCardBackTitle: String = "Card - Back".localize()
    static let InsuranceProviderTitle: String = "Provider".localize()
    static let InsuranceGroupNumberTitle: String = "Group Number".localize()
    static let InsuranceMemberIDTitle: String = "Member ID".localize()
    static let InsurancePhoneTitle: String = "Phone#".localize()
    static let PayOutOfPocketDetail: String = "Yes, I will pay out of pocket for:".localize()
    static let InsuranceInfoMissingDetail: String = "No insurance information provided".localize()
    static let ConsultationRequestDetail: String = "Contact Pharmacist".localize()
    static let ContactSupportDetail: String = "Contact Support".localize()
    static let HIPAACompliantDetail: String = "HIPAA Notice".localize()
    static let PrivacyPolicyDetail: String = "Privacy Policy".localize()
    static let InsuranceInclude: String = "Members".localize()
  }
  
  struct Greetings {
    static let Morning: String = "Good Morning".localize()
    static let Afternoon: String = "Good Afternoon".localize()
    static let Evening: String = "Good Evening".localize()
  }
  
  struct FeedModals {
    struct DeliveryNotification {
      static let DefaultNoteTitle: String = "Note From Medly:".localize()
      static let DeliveryNoteTitle: String = "Delivery Note:".localize()
      static let DeliveryNoteTitleFromPatient: String = "Delivery Note From Patient:".localize()
      static let DeliveryNoteTitleFromPharmacist: String = "Delivery Note From Pharmacist:".localize()
      static let StatusDetail: String = "Your prescription will be delivered to\n your address shortly".localize()
      static let DeliveryHoursTitle: String = "Delivery Hours of Operation\n".localize()
      static let DeliveryHoursDetail: String = "Monday - Friday, 9:00 AM - 9:00 PM\nSaturday - Sunday, 12:00 PM - 6:00 PM".localize()
      
    }
    
    
    struct PrescriptionExpected {
      static let NoteTitle: String = "Prescription Expected?".localize()
      static let NoteAction: String = "Notify Pharmacist".localize()
      static let NoteInstructions: String = "Tell us what you’re expecting".localize()
      static let NotePlaceholder: String = "List the medications on the prescription".localize()
      
      static let ConfirmationTile: String = "".localize()
      static let ConfitmationAction: String = "OK!".localize()
      static let ConfirmationMessageTitle: String = "Thanks!".localize()
      static let ConfirmationMessageSubtitle: String = "We'll call your doctor\nand look into it".localize()
    }
    
    struct CancelDelivery {
      static let NoteTitle: String = "Cancel Delivery?".localize()
      static let NoteAction: String = "Cancel Delivery".localize()
      static let NoteInstructions: String = "Send a note to the Pharmacy".localize()
      static let NotePlaceholder: String = "(e.g., When will my prescription be delivered?)".localize()
      
      static let ConfirmationTile: String = "".localize()
      static let ConfitmationAction: String = "OK!".localize()
      static let ConfirmationMessageTitle: String = "Cancelled.".localize()
      static let ConfirmationMessageSubtitle: String = "We’ve cancelled this delivery. Please call your Medly pharmacy if you have any questions or requests.".localize()
    }
    
    struct RequestCallFromPharmacy {
      static let NoteTitle: String = "Request Call from Pharmacy?".localize()
      static let NoteAction: String = "Request Call".localize()
      static let NoteInstructions: String = "How can we help you?".localize()
      static let NotePlaceholder: String = "(optional)".localize()
      
      static let ConfirmationTile: String = "".localize()
      static let ConfitmationAction: String = "OK!".localize()
      static let ConfirmationMessageTitle: String = "Request sent.".localize()
      static let ConfirmationMessageSubtitle: String = "We've sent a request to your pharmacist to give you a call.".localize()
    }
    
    struct ScheduleConsultation {
      static let NoteTitle: String = "Schedule a Consultation.".localize()
      static let NoteAction: String = "Schedule.".localize()
      static let NoteInstructions: String = "".localize()
      static let NotePlaceholder: String = "I'd like to schedule a consultation with a pharmacist.".localize()
      
      static let ConfirmationTitle: String = "".localize()
      static let ConfirmationAction: String = "OK!".localize()
      static let ConfirmationMessageTitle: String = "Consultation Request Sent.".localize()
      static let ConfirmationMessageSubtitle: String = "We've sent a request to your pharmacist.".localize()
    }
    
    struct PaperPrescription {
      static let NoteTitle: String = "Paper Prescription?".localize()
      static let NoteAction: String = "Send Prescription".localize()
      static let NoteInstructions: String = "Take a photo of your prescription.".localize()
      
      static let ConfirmationTile: String = "".localize()
      static let ConfitmationAction: String = "OK!".localize()
      static let ConfirmationMessageTitle: String = "Thanks!".localize()
      static let ConfirmationMessageSubtitle: String = "We'll alert your pharmacy about this perscription.".localize()
    }
    
    struct DeliveryNote {
      static let ActionCardTitle: String = "Delivery Note".localize()
      static let ActionPlaceholder: String = "Enter text here...".localize()
      static let ViewPlaceholder: String = "(optional)".localize()
      static let ViewHeader: String = DeliveryNote.ActionCardTitle
      static let Disclaimer: String = "Please note that if your prescription has already been scheduled for delivery, we cannot make changes to your delivery".localize()
      static let Disclaimer2: String = "Please note that we cannot always accommodate specific delivery time requests in the app. Once you’ve approved your prescription, our delivery department will call you to schedule a time for your free delivery!".localize()
      static let AlertTypeDeliveryNote: String = "delivery_note"
    }
  }
  
  struct InfoGroups {
    struct Titles {
      static let Name: String =  "Name".localize()
      static let Birthday: String =  "Birthdate".localize()
      static let Gender: String =  "Gender".localize()
      static let PrimaryPhone: String = "Primary Phone".localize()
      static let Login: String = "Login".localize()
      static let Address: String = "Address".localize()
      static let InsuranceCardFront: String = "Insurance Card - Front".localize()
      static let InsuranceCardBack: String = "Insurance Card - Back".localize()
      static let ManualInsurance: String = "Insurance Info".localize()
      static let PayOutOfPocket: String = "Opt to Pay Out of Pocket".localize()
      static let TransferDetails: String = "Transfer Details".localize()
      static let MedicationDetails: String = "Medication Details".localize()
      static let FamilyMemberName: String = "Family Member Name".localize()
      static let FamilyMemberGender: String = "Gender".localize()
      static let FamilyMemberBirthday: String = "Birthday".localize()
      static let FamilyMemberInsurance: String = "Insurance".localize()
      static let FamilyMemberRelationship: String = "Relationship".localize()
    }
    
    struct StepNumbers {
      static let Name: Int =  1
      static let Birthday: Int =  2
      static let Gender: Int =  3
      static let PrimaryPhone: Int = 4
      static let Login: Int = 5
      static let Address: Int = 1
      static let InsuranceCardFront: Int = 1
      static let InsuranceCardBack: Int = 2
      static let ManualInsurance: Int = 3
      static let PayOutOfPocket: Int = 4
    }
    
    struct InfoDescriptions {
      static let PrimaryPhone: String = "Your pharmacist may need to call you to confirm your prescriptions.".localize()
      static let Login: String = "An email and password is required for login. We only email about delivery statuses.".localize()
      static let ManualInsurance: String = "If you provide photos, this section is optional. Otherwise, we will need this information to bill your insurance.".localize()
      static let PayOutOfPocket: String = "If you don’t have insurance or want to pay out of pocket, please indicate this below. Please note that this selection will apply to all family members on your account, unless you have added them to another insurance policy above.".localize()
      static let SameInsurance: String = "My Insurance".localize()
      static let DifferentInsurance: String = "Other Insurance".localize()
      static let InsuranceMembers: String = "Insurance Members".localize()
    }
  }
  
  struct CardSubtitles {
    static let SignupInfo: String = "Your data is safe. Medly is HIPAA-compliant and all data is encrypted and secure.".localize()
    static let SignupAddress: String = "You can add more delivery addresses later.".localize()
    static let SignupInsurance: String = "Don’t have your card? No problem.\nEnter the info manually or add it later.".localize()
  }
  
  struct Agreements {
    static let Signup: String = "I agree to the".localize()
    static let TOS: String = "terms of service".localize()
    static let Insurance: String = "I will pay out of pocket.".localize()
  }
  
  struct Descriptions {
    // Onboarding
    static let OnboardingInitialDescription: String = "Prescriptions\nmade easy.".localize()
    
    // Log in
    static let LoginForgotPasswordLabel: String = "Forgot your password?".localize()
    static let LoginResendCodeLabel: String = "Didn’t get a code?".localize()
    
    // Sign up
    struct OnboardingSignupZipFailExplanation {
      static let DefaultZipText: String = "your area".localize()
      static let PartOne: String = "We aren’t in".localize()
      static let PartTwo: String = "yet.  Enter an email and we’ll notify you as soon as we are!".localize()
    }
    
    struct PackagingOptions {
      static let Note: String = "If you don't have a preference, we will send your prescriptions in normal medication vials.".localize()
      static let PackageLink: String = "See packaging descriptions".localize()
      static let Vial: String = "For those comfortable with the classic pill bottle, we offer compact, user-friendly vials.".localize()
      static let Blister: String = "With perforated seams and sealed cavities, these detachable packs work well for both individual tablets and combined prescriptions.".localize()
      static let Pouch: String = "Pouch packs are a smart choice for those on the go. These little pouches can be thrown in your bag so you never have to carry more than you need. We label them with the contents and the date (and time) of each dosage.".localize()

      // NOTE: Previous copy
//      static let Vial: String = "For those comfortable with the classic tried-and-true pill bottle, we offer compact, user-friendly vials.".localize()
//      static let Blister: String = "With perforated seams and sealed cavities, these detachable packs work well for both individual tablets and combined prescriptions. They’re great for travel and a simple, convenient way to track your adherence.".localize()
//      static let Pouch: String = "Pouch packs are a smart choice for those on the go. A relief from cumbersome packaging, these little pouches can be thrown into your bag so that you don’t have to carry more than you need. We label them with the contents and the date (and time) of each dosage. It’s foolproof and makes it almost impossible to miss your dose.".localize()
    }
    
    struct TransferPrescription {
      static let Note: String = "To transfer a prescription you have at another pharmacy to Medly pharmacy, please provide the following information and we'll do the rest.".localize()
    }
    static let OnboardingSignupZipFailEmailExplanation = "Medly will be available in more areas soon.  We will email you about service availability, and we promise to never spam you.".localize()
    
    static let SignupZipSuccessTitle: String = "Hooray!".localize()
    static let SignupZipSuccessDefaultMessage: String = "Medly is available in your area."
    
    static let OnboardingSignupInfoDescription: String = "Yay! We can deliver to your area.  Let’s get started. First, we need some info.".localize()
    static let OnboardingSignupInfoHippaComplianceDescription: String = "(We are HIPAA-compliant and your data is safe! None of this information will be sent to us until the end.)"
    struct OnboardingSignupAddressDescription {
      static let PartOne: String = "Nice to meet you".localize()
      static let PartTwo: String = "\n\nWhat is your main address?\n(You can add more delivery addresses later)".localize()
    }
    static let OnboardingSignupInsuranceAction: String = "Perfect!\n\nLet's get your insurance info.\n\nYou can skip this step if you don’t have your information on you, but you should enter this information as soon as you can to avoid delays".localize()
    static let OnboardingSignupConfirmationTitle: String = "You’re all set up and ready to start receiving prescription deliveries from Medly!".localize()
    static let OnboardingSignupConfirmationSubtitle: String = "For your security, we’ll now have you login and retrieve a security code from your email.".localize()
  }
  
  struct Placeholders {
    struct Prescriptions {
      static let Title: String = "Add Your Prescriptions"
      static let Detail: String = "Tell your doctor to send prescriptions to Medly."
    }
  }
  
  struct SupportEmail {
    static let Subject: String = "Medly Support Request".localize() // TODO: Request copy approval
    static let MessageBody: String = "Please provide a short description of how we can help you.".localize() // TODO: Request copy approval
    static let Receipient: String = "support@medlypharmacy.com"
  }
  
  struct Alerts {
    static let ConfirmDeleteMessage: String = "Are you sure you want to delete this card info from your account?".localize()
    static let ConfirmDeleteFamilyMessage: String = "Are you sure you want to delete this family member from your account?".localize()
    static let ConfirmDeletePhysicianMessage: String = "Are you sure you want to delete this physician from your account?".localize()
    static let ConfirmDeleteAddressMessage: String = "Are you sure you want to delete this address from your account?".localize()
    static let ConfirmDeleteInsuranceInfo: String = "Are you sure you want to delete this insurance from your account?".localize()
    static let AllPersonsAssociated: String = "All members on this account have been added to an insurance policy. The pay out of pocket option is applied to all members on the account who are not associated with an insurance policy. To pay out of pocket for yourself or a family member, please remove them from your insurance policies.".localize()
  }
  
  struct Stripe {
    static let InvalidFields: String = "Invalid credit card info. Please check and try again".localize()
  }

  struct ProfileSettingsTitles {
    // Prescriptions
    static let Prescriptions = "Prescriptions".localize()
    static let Medications = "Medications".localize()
    static let PrescriptionHistory = "Deliveries".localize()
    static let MedicationHistory = "Deliveries With This Medication".localize()

    
    // Personal Info Setting
    static let PersonalInfo: String = "Personal Info".localize()
    
    // Delivery Address Settings
    static let DeliveryAddress: String = "Delivery Address".localize()
    static let DeliveryAddresses: String = "Delivery Addresses".localize()
    static let DefaultDeliveryAddress: String = "Default Delivery Address".localize()
//    static let DeliveryAddresses: String = "Delivery Addresses".localize() WHO'S USING MyDeliveryAddresses?
    static let AddressDetails: String = "Address Details".localize()
    
    static let AddNewLabelText: String = "Add New".localize()
    static let DeleteAddress: String = "Delete Address".localize()
    static let DefaultAddressInList: String = "DEFAULT".localize()
    
    // Packaging
    static let PackagingPreferences: String = "Packaging Preferences".localize()
    static let Preferences: String = "Preference".localize()
    static let NormalVials: String = "Medication Vials".localize()
    static let NonChildResistant: String = "Medication Vials\n(Non-Child Resistant)".localize()
    static let BlisterPacks: String = "Blister Packs".localize()
    static let PouchPacks: String = "Pouch Packs".localize()
    
    // Auto Refills
    static let AutomaticRefills: String = "Automatic Refills Notification".localize()
    static let YesNotify: String = "Yes, notify me".localize()
    static let NoNotify: String = "No, do not notify me".localize()
    
    // Credit Cards
    static let CreditCards: String = "Credit Cards".localize()
    static let CreditCard: String = "Credit Card".localize()
//    static let CreditCards: String = "My Cards".localize() WHO'S USING MyCreditCards
    static let CreditCardDetails: String = "Card Details".localize()
    static let DeleteCreditCard: String = "Delete Card".localize()
    static let DefaultCreditCard: String = "Default Card".localize()

    // Insurance
    static let Insurance: String = "Insurance".localize()
    static let InsuranceInfos: String = "Insurance Info".localize()
    
    // Transfer Prescriptions
    static let TransferPrescription = "Transfer Prescription".localize()

    // Allergies
    static let Allergies: String = Strings.TextEntryFields.AllergiesCheckmarkBoxText
    
    // Physician
    static let Physicians: String = "Physicians".localize()
    static let PhysicianInfo: String = "Physician Info".localize()
    static let PhysicianAddressInfo: String = "Physician Address".localize()
    static let DeletePhysician: String = "Delete Physician".localize()
    
    // Family 
    static let Family: String = "Family".localize()
    static let FamilyInfo: String = "Family Info".localize()
    static let DeleteMember: String = "Delete Member".localize()
    static let DeleteInsurance: String = "Delete Insurance".localize()
  }
  
  struct IntroScenes {
    struct Scene1 {
      static let Title: String = "Welcome to Medly!".localize()
      static let Subtitle: String = "Prescriptions made easy.".localize()
      static let Action: String = "Swipe to get started".localize()
    }
    
    struct Scene2 {
      static let Title: String = "We want getting medications to be easy.".localize()
      static let Subtitle: String = "So, we made Medly.".localize()
      static let Action: String = "".localize()
    }
    
    struct Scene3 {
      static let Title: String = "Medly will deliver your medication to your door.".localize()
      static let Subtitle: String = "For Free!".localize()
      static let Action: String = "".localize()
    }
    
    struct Scene4 {
      static let Title: String = "It's super easy.".localize()
      static let Subtitle: String = "Sign-up only takes a minute.".localize()
      static let Action: String = "".localize()
    }
    
    struct Scene5 {
      static let Title: String = "Just tell your doctor to send prescriptions to Medly.".localize()
      static let Subtitle: String = "".localize()
      static let Action: String = "".localize()
    }
    
    struct Scene6 {
      static let Title: String = "We'll alert you when you have a prescription.".localize()
      static let Subtitle: String = "You can use a credit card for the co-pay.".localize()
      static let Action: String = "".localize()
    }
    
    struct Scene7 {
      static let Title: String = "Then, Medly will deliver to your door lickety-split!".localize()
      static let Subtitle: String = "".localize()
      static let Action: String = "".localize()
    }
    
    struct Scene8 {
      static let Title: String = "".localize()
      static let Subtitle: String = "Hooray for the Medly way!".localize()
      static let Action: String = "".localize()
    }
  }
}
