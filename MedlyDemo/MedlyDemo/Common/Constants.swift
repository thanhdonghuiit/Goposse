//
//  Constants.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/7/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

struct Constants {
    struct Action {
        
        // General
        static let ActionPopRequested: Int = 0
        
        // Log in
        static let Home: Int = 1
        static let HomeDetail: Int = 2
        
        
    }
    // MARK: - Action Names
    struct ActionNames {
        struct Onboarding {
            static let Inital: String = "onboardingInitialAction"
            static let Login: String = "onboardingLogin"
            static let LoginConfirm: String = "onboardingLoginConfirm"
            static let LoginForgotPassword: String = "onboardingLoginForgotPassword"
            static let SignupInitial: String = "signupInitial"
            static let SignupZip: String = "signupZip"
            static let SignupInfo: String = "signupInfo"
            static let SignupAddress: String = "signupAddress"
            static let SignupInsurance: String = "signupInsurance"
            static let SignupConfirmation: String = "signupConfirmation"
        }
        
        struct Main {
            static let MainFeed: String = "mainFeed"
            static let Profile: String = "profile"
            static let TestUserAction: String = "testUserAction"
            static let InsuranceCard: String = "insuranceCard"
            static let Zoom: String = "zoomView"
            static let IntroAnimation: String = "introAnimation"
        }
        
        struct Debug {
            static let Choice: String = "debugChoice"
        }
        
        struct FeedModal {
            static let Base: String = "feedModalBase"
        }
    }
    
    // MARK: - Result Codes
    struct ResultCodes {
        static let Ok: Int = 10001
        static let Canceled: Int = 10002
        static let Failed: Int = 10003
       
        struct Onboarding {
            
            // General
            static let ActionPopRequested: Int = 0
            
            // Log in
            static let LoginRequested: Int = 1
            static let LoginStep1Successful: Int = 2
            static let LoginForgotPassword: Int = 3
            static let LoginStep2Successful: Int = 14
            static let BiometricAuthLoginRequested: Int = 15
            
            // Sign up
            static let SignupRequested: Int = 4
            static let SignupInvalidArea: Int = 5
            static let SignupValidArea: Int = 6
            static let SignupInfoComplete: Int = 7
            static let SignupAddressComplete: Int = 8
            static let SignupAddressSkipped: Int = 9
            static let SignupInsuranceComplete: Int = 10
            static let SignupInsuranceSkipped: Int = 11
            static let SignupConfirmed: Int = 12
        }
        
        struct Main {
            static let LogOutRequested: Int = 13
            static let ProfileRequested: Int = 14
            static let ProfileClose: Int = 15
            static let DebugRequested: Int = 16
            static let InsuranceCardRequested: Int = 32
            static let RXTransferRequested: Int = 33
            static let AlertPharmacyRequested: Int = 17
            static let ApproveDeliveryRequested: Int = 18
            static let CancelDeliveryRequested: Int = 19
            static let DeliveryDetailRequested: Int = 67
            static let RequestCallFromPharmacyRequested: Int = 21
            static let PaperPrescriptionRequested: Int = 30
            static let ScheduleConsultation: Int = 47
            static let IntroAnimationCompleted: Int = 57
            static let NotifyPharmacyRequested: Int = 20
            
        }
        
        struct FeedModal {
            static let Dismiss: Int = 19
            static let PrescriptionExpectedSuccess: Int = 20
            static let CancelDeliverySuccess: Int = 21
            static let DidTapLeftNavigationButton: Int = 44
            static let RequestCallFromPharmacySuccess: Int = 22
            static let NotifyPharmacySuccess: Int = 23
            
            static let AddOrChangeDeliveryNote: Int = 35
            static let ChangeDeliveryAddress: Int = 36
            static let ChangePaymentMethod: Int = 37
            
            static let FeedDeliveryNotificationApproval: Int = 40
            static let FeedDeliveryNotificationCancel: Int = 41
            static let DeliveryApprovalSuccess: Int = 38
            static let DeliveryApprovalNoteComplete: Int = 39
            static let CallPharmacy: Int = 42
            static let RequestCallFromPharmacy: Int = 43
            static let ScheduleConsultationSuccess: Int = 48
            static let OpenImageZoom: Int = 55
            static let PaperPrescriptionSuccess: Int = 56
        }
        
        struct Profile {
            static let PersonalInfoRequested: Int = 34
            static let DeliveryAddressRequested: Int = 36
            static let InsuranceRequested: Int = 20
            static let CreditCardRequested: Int = 21
            static let PackagingRequested: Int = 22
            static let RefillRequested: Int = 23
            static let TransferPrescriptionsRequested: Int = 24
            static let AllergyInfoRequested: Int = 43
            static let PhysicianInfoRequested: Int = 51
            
            
            static let BackToProfileMenu: Int = 25
            static let AddressSelectRequested: Int = 26
            static let BackToAddressListRequested: Int = 27
            static let AddNewAddressRequested: Int = 28
            
            static let CreditCardSelectRequested: Int = 29
            static let BackToCreditCardListRequested: Int = 30
            static let AddNewCreditCardRequested: Int = 31
            
            static let PhysicianEditRequested: Int = 50
            static let AddNewPhysicianRequested: Int = 49
            static let BackToPhysicianListRequested: Int = 52
            
            static let ReplayIntroRequested: Int = 900
            static let LogOutRequested: Int = 32
            
            static let FamilyInfoRequested: Int = 59
            static let FamilyEditRequested: Int = 60
            static let AddNewFamilyMemberRequested: Int = 61
            
            static let PrescriptionsInfoRequested: Int = 62
            static let PrescriptionHistoryRequested: Int = 63
            static let AddNewPrescriptionRequested: Int = 64
            static let MedicationsInfoRequested: Int = 65
            
            static let AddNewInsuranceRequested: Int = 66
            static let InsuranceSelectRequested: Int = 67
          
            static let AddNewInsuranceRequestedFromFamilyEdition: Int = 68
        }
        
        struct InsuranceCard {
            static let ReturnToMain: Int = 33
            static let GoToProfile: Int = 39
            static let OpenImageZoom: Int = 44
            static let CloseImageZoom: Int = 45
            static let GoToConsultation: Int = 34
        }
        
        struct Debug {
            static let Dismiss: Int = 0
            static let LogOutRequested: Int = 1
        }
    }
    
    // MARK: - Bundle keys
    struct BundleKey {
        
        // Login Info
        static let UserId: String = "_lindenwood.bundle.userId"
        static let UserAuthToken: String = "_lindenwood.bundle.authToken"
        static let LoginEmail: String = "_lindenwood.bundle.loginEmail"
        static let LoginPassword: String = "_lindenwood.bundle.loginPassword"
        static let LoginAccessToken: String = "_lindenwood.bundle.loginAccessToken"
        
        static let SignupInvalidZip: String = "_lindenwood.bundle.signupAreaCheckZip"
        static let SignupInvalidCity: String = "_lindenwood.bundle.signupAreaCheckCity"
        static let SignupInvalidSubLocality: String = "_lindenwood.bundle.signupAreaCheckSubLocality"
        static let SignupEmail: String = "_lindenwood.bundle.signupEmail"
        static let SignupPassword: String = "_lindenwood.bundle.signupPassword"
        
        static let FeedSystemNotificationInfo: String = "_lindenwood.bundle.feedSystemNotificationInfo"
        static let FeedDeliveryNotificationInfo: String = "_lindenwood.bundle.feedDeliveryNotificationInfo"
        
        static let SuccessMesssage: String = "_lindenwood.bundle.successMessage"
        static let NotificationPrompted: String = "_lindenwood.bundle.notificationPrompted"
        static let FirstRunKey: String = "_lindenwood.bundle.firstRun"
        
        struct Debug {
            static let DeliveryInProcessIds: String = "_lindenwood.bundle.debugDeliveryInProcessIds"
        }
        
        static let ZoomImage: String = "_lindenwood.bundle.zoomImageKey"
        static let UseDefaultNavigationAnimation: String = "_lindenwood.bundle.useDefaultNavigationAnimation"
        
        static let DeliveryNote: String = "_lindenwood.bundle.deliveryNote"
        static let InsuranceInfo: String = "_lindenwood.bundle.insuranceInfo"
        static let InsuranceInfosList: String = "_lindenwood.bundle.insuranceInfosList"
        static let FamilyMember: String = "_lindenwood.bundle.familyMember"
    }
    
    
    
    struct ButtonActions {
        static let GotoInfoCard: String = "goto:info_card"
        static let GotoProfile: String = "goto:profile"
        static let GotoRXTransfer: String = "goto:rx_transfer"
        static let ActionAlertPharmacy: String = "action:alert_pharmacy"
        static let ActionNotifyPharmacy: String = "action:notify_pharmacy"
        static let ActionCallPharmacy: String = "action:call_pharmacy"
        static let ActionApproveDelivery: String = "action:approve_delivery"
        static let ActionDeclineDelivery: String = "action:decline_delivery"
        static let ActionDismissCard: String = "action:dismiss_card"
        static let ActionReloadFeed: String = "action:reload_feed"
        static let ActionScheduleConsultation: String = "action:request_consultation"
        static let ActionPaperPrescription: String = "action:alert_pharmacy_paper"
    }
    
    struct FeedNotificationTypes {
        static let LoadFail: String = "feed_request_failed"
        static let DeliveryInProcess: String = "delivery_in_process"
        static let AlertTypeNone: String = "alert_type_none"
        static let RequestConsultation: String = "request_consultation"
    }
    
    struct CellIdentifiers {
        static let FeedNotificationCollectionViewCell: String = "FeedNotificationCollectionViewCell"
        static let FeedNotificationCollectionViewHeader: String = "FeedNotificationCollectionViewHeader"
        static let FeedDeliveryHistoryCollectionViewHeader: String = "FeedDeliveryHistoryCollectionViewHeader"
        static let FeedDeliveryHistoryCollectionViewFooter: String = "FeedDeliveryHistoryCollectionViewFooter"
        static let FeedDeliveryHistoryCollectionViewCell: String  = "FeedDeliveryHistoryCollectionViewCell"
        static let FeedDeliveryNotificationCollectionViewCell: String = "FeedDeliveryNotificationCollectionViewCell"
        static let InformationCardCellReuseID: String = "InformationCardCell"
        static let StrictInputTableViewCell: String = "StrictInputTableViewCell"
        static let DebugChoiceTableViewCell: String = "DebugChoiceTableViewCell"
    }
    
    // MARK: - Cached Jsons
    struct CachedJsonFilenames {
        static let AppConfig: String = "app_config"
        static let LocalitiesConfig: String = "localities_config"
    }
    
    struct Animations {
        static let TextEntryDescriptionFadeTime: Double = 0.2
        
        static let ZipSuccessFadeInTime: Double = 0.2
        static let ZipSuccessWaitTime: Double = 0.75
    }
    
    // MARK: - Notifications
    struct Notification {
        static let UserAuthenticationFailed: String = "_lindenwood.notif.userAuthFailed"
        static let MainFeedRefreshRequest: String = "_lindenwood.notif.mainFeedRefreshRequest"
        static let MainFeedUpdateWithFeedDictionary: String = "_lindenwood.notif.mainFeedUpdate"
        static let NewUserSessionCreated: String = "_lindenwood.notif.newUserSessionCreated"
        static let CurrentUserSessionWillBeCleared: String = "_lindenwood.notif.currentUserSessionWillBeCleared"
        static let RemoteNotificationReceived: String = "_lindenwood.notif.remoteNotificationReceived"
        static let ApplicationDidTimeout: String = "_lindenwood.notif.applicationDidTimeout"
    }
    
    // MARK: - Notification Keys
    struct NotificationKey {
        struct MainFeedUpdate {
            static let FeedDictionary: String = "_lindenwood.notif.mainFeedUpdate.feedDictionary"
        }
    }
    
    // MAKR: - UserDefault Keys
    struct UserDefaultKeys {
        static let HasSeenHIPAAComplianceNotification: String = "has_seen_hipaa_compliance_notification"
    }
    
    struct ServerErrorCodes {
        static let ResourceNotFound: Int = 8000
    }
    
    struct PackagingPreference {
        static let NormalVials: String = "normal_vials"
        static let NonChildResistant: String = "non_child_resistant_vials"
        static let BlisterPacks: String = "blister_packs"
        static let PouchPacks: String = "pouch_packs"
    }
    
    struct RefillPreference {
        static let Notify: String = "notify"
        static let DoNotNotify: String = "do_not_notify"
    }
    
    // MARK: - Intro scene tags
    struct Intro {
        static let Scene1: Int = 1
        static let Scene2: Int = 2
        static let Scene3: Int = 3
        static let Scene4: Int = 4
        static let Scene5: Int = 5
        static let Scene6: Int = 6
        static let Scene7: Int = 7
        static let Scene8: Int = 8
        static let PlaceholderVC: Int = 750
    }
    
    // MARK: - Profile Text Entry Tags
    struct Profile {
        struct Address {
            static let Street1FieldTag: Int = 0
            static let Street2FieldTag: Int = 1
            static let CityFieldTag: Int = 2
            static let StateFieldTag: Int = 3
            static let ZipFieldTag: Int = 4
        }
        
        struct PersonalInfo {
            static let FirstNameFieldTag: Int = 0
            static let LastNameFieldTag: Int = 1
            static let BirthdayFieldTag: Int = 2
            static let PhoneNumberFieldTag: Int = 3
            static let EmailFieldTag: Int = 4
            static let PasswordFieldTag: Int = 5
            static let ConfirmPasswordFieldTag: Int = 6
        }
        
        struct Insurance {
            static let ProviderName: Int = 0
            static let ProviderGroup: Int = 1
            static let ProviderMemberID: Int = 2
            static let ProviderPhoneNumber: Int = 3
            static let InsuranceUser: Int = 4
        }
        
        struct CreditCard {
            static let CardNumber: Int = 0
            static let CardExpirationMonth: Int = 1
            static let CardExpirationYear: Int = 2
            static let CardCVV: Int = 3
            static let CardNameOnCard: Int = 4
        }
        
        struct Transfers {
            static let PharmacyName: Int = 0
            static let PharmacyPhone: Int = 1
            static let PharmacyStreet: Int = 2
            static let PharmacyCity: Int = 3
            static let PharmacyState: Int = 4
            static let PrescriptionNames: Int = 5
        }
        
        struct Keys {
            static let SelectedAddressCell: String = "selectedAddressCell"
            static let AddressCellIdentifier: String = "addressCellIdentifier"
            static let AddressHeaderCellIdentifier: String = "addressHeaderCellIdentifier"
            static let AddressFooterCellIdentifier: String = "addressFooterCellIdentifier"
            
            static let CreditCardCellIdentifier: String = "creditCardCellIdentifier"
            static let SelectedCreditCardCell: String = "selectedCreditCard"
            
            static let PhysicianCellIdentifier: String = "physicianCellIdentifier"
            static let PhysicianHeaderCellIdentifier: String = "physicianHeaderCellIdentifier"
            static let PhysicianFooterCellIdentifier: String = "physicianFooterCellIdentifier"
            static let SelectedPhysicianCell: String = "selectedPhysician"
            
            static let FamilyHeaderCellIdentifier: String = "familyHeaderCellIdentifier"
            static let FamilyFooterCellIdentifier: String = "familyFooterCellIdentifier"
            static let FamilyMemberCellIdentifier: String = "familyMemberCellIdentifier"
            static let SelectedFamilyMemberCell: String = "selectedFamilyMember"
            
            static let PrescriptionCellIdentifier: String = "prescriptionCellIdentifier"
            static let PrescriptionHistoryCellIdentifier: String = "prescriptionHistoryCellIdentifier"
            static let SelectedPrescriptionCell: String = "selectedPrescription"
            
            static let InsuranceInfoCellIdentifier: String = "insuranceInfoCellIdentifier"
            static let InsuranceHeaderCellIdentifier: String = "insuranceHeaderCellIdentifier"
            static let InsuranceFooterCellIdentifier: String = "insuranceFooterCellIdentifier"
        }
        
        struct PackagingType {
            static let Unknown: Int = -1
            static let NormalVials: Int = 0
            static let NonChildResistant: Int = 1
            static let BlisterPacks: Int = 2
            static let PouchPacks: Int = 3
        }
        
        struct RefillSelection {
            static let Yes: Int = 3
            static let No: Int = 4
            static let Unknown: Int = -1
        }
        
        struct AllergiesSelection {
            static let Unknown: Int = -1
            static let AllergyCheckbox: Int = 0
        }
        
        struct Physician {
            static let FirstNameTag: Int = 0
            static let LastNameTag: Int = 1
            static let EmailTag: Int = 2
            static let PhoneTag: Int = 3
            static let Street1Tag: Int = 4
            static let Street2Tag: Int = 5
            static let CityTag: Int = 6
            static let StateTag: Int = 7
            static let ZipCodeTag: Int = 8
        }
        
        struct FamilyMember {
            static let FirstNameFieldTag: Int = 0
            static let LastNameFieldTag: Int = 1
            static let BirthdayFieldTag: Int = 2
            static let GenderFieldTag: Int = 3
            static let RelationshipFieldTag: Int = 4
        }
    }
    
    struct DeliveryApproval {
        static let DeliveryAddressViewTag: Int = 0
        static let CreditCardViewTag: Int = 1
        static let DeliveryNoteViewTag: Int = 2 // MAY REMOVE
    }
    
    struct PrescriptionAlertTypes {
        // Text probably isn't right, need to find out from David
        static let Expecting: String = "expecting"
        static let Paper: String = "paper"
        static let Consultation: String = "request_consultation"
        static let CancelDelivery: String = "cancel"
    }
    
    static let ShowDebugText: Bool = false
    
    struct MainFeedSection {
        static let DeliveryNotifications: Int = 0
        static let SystemNotifications: Int = 1
        static let DeliveryHistory: Int = 2
    }
    
    struct Analytics {
        struct ScreenviewName {
            static let OnboardingWalkthrough = "Onboarding walkthrough"
            static let TransferPrescription = "Transfer prescription"
            static let ApproveDelivery = "Approve delivery"
            static let CancelDelivery = "Cancel delivery"
            static let InformationCard = "Information card"
            static let InsuranceProfile = "Insurance profile"
            static let CreditCardProfile = "Credit card profile"
            static let PrescriptionExpected = "Prescription expected"
            static let PaperPrescription = "Paper prescription"
            static let EditFamilyMemberProfile = "Edit family member profile"
            static let EditPhysicianProfile = "Edit physician profile"
        }
        
        // NOTE: Failure events currently not in use
        struct CustomEvent {
            struct TransferPrescription {
                static let Name = "transfer_prescription"
                static let SuccessId = "transfer_prescription_success"
                static let SuccessDetail = "transfer form submission succeeded"
                static let FailureId = "transfer_prescription_failure"
                static let FailureDetail = "transfer form submission failed"
            }
            struct DeliveryApproval {
                static let Name = "delivery_approval"
                static let SuccessId = "delivery_approval_success"
                static let SuccessDetail = "delivery approval succeeded"
                static let FailureId = "delivery_approval_failure"
                static let FailureDetail = "delivery approval failed"
            }
            struct DeliveryCancellation {
                static let Name = "delivery_cancellation"
                static let SuccessId = "delivery_cancellation_success"
                static let SuccessDetail = "delivery cancellation succeeded"
                static let FailureId = "delivery_cancellation_failure"
                static let FailureDetail = "delivery cancellation failed"
            }
            struct InsuranceProfileUpdate {
                static let Name = "insurance_profile_update"
                static let SuccessId = "insurance_profile_update_success"
                static let SuccessDetail = "insurance profile update succeeded"
                static let FailureId = "insurace_profile_update_failure"
                static let FailureDetail = "insurance profile udpate failed"
            }
            struct PrescriptionExpected {
                static let Name = "prescription_expected"
                static let SuccessId = "prescription_expected_success"
                static let SuccessDetail = "expected prescription submission succeeded"
                static let FailureId = "prescription_expected_failure"
                static let FailureDetail = "expected prescription submission failed"
            }
            struct PaperPrescription {
                static let Name = "paper_prescription"
                static let SuccessId = "paper_prescription_success"
                static let SuccessDetail = "paper prescription submission succeeded"
                static let FailureId = "paper_prescription_failure"
                static let FailureDetail = "paper prescription submission failed"
            }
            struct FamilyMemberProfileAdd {
                static let Name = "family_member_profile_add"
                static let SuccessId = "family_member_profile_add_success"
                static let SuccessDetail = "family member add succeeded"
                static let FailureId = "family_member_profile_add_failure"
                static let FailureDetail = "family member add failed"
            }
            struct FamilyMemberProfileUpdate {
                static let Name = "family_member_profile_update"
                static let SuccessId = "family_member_profile_update_success"
                static let SuccessDetail = "family member update succeeded"
                static let FailureId = "family_member_profile_update_failure"
                static let FailureDetail = "family member update failed"
            }
            struct FamilyMemberProfileDelete {
                static let Name = "family_member_profile_delete"
                static let SuccessId = "family_member_profile_delete_success"
                static let SuccessDetail = "family member delete succeeded"
                static let FailureId = "family_member_profile_delete_failure"
                static let FailureDetail = "family member delete failed"
            }
            struct PhysicianProfileAdd {
                static let Name = "physician_profile_add"
                static let SuccessId = "physician_profile_add_success"
                static let SuccessDetail = "physician add succeeded"
                static let FailureId = "physician_profile_add_failure"
                static let FailureDetail = "physician add failed"
            }
            struct PhysicianProfileUpdate {
                static let Name = "physician_profile_update"
                static let SuccessId = "physician_profile_update_success"
                static let SuccessDetail = "physician update succeeded"
                static let FailureId = "physician_profile_update_failure"
                static let FailureDetail = "physician update failed"
            }
            struct PhysicianProfileDelete {
                static let Name = "physician_profile_delete"
                static let SuccessId = "physician_profile_delete_success"
                static let SuccessDetail = "physician delete succeeded"
                static let FailureId = "physician_profile_delete_failure"
                static let FailureDetail = "physician delete failed"
            }
        }
        
        struct CustomEventKeys {
            static let EventID = "event_id"
            static let EventDetail = "event_detail"
            static let PrescriptionCount = "prescription_count"
            static let TotalCost = "total_cost"
            static let UserInfo = "user_info"
            static let ErrorMessage = "error_message"
            static let FamilyMemberInfo = "family_member"
            static let PhysicianInfo = "physician_info"
            static let Pharmacy = "pharmacy_name"
        }
        
        struct EventShare {
            static let InformationCard = "Information card shared"
        }
    }
}

