//
//  NetworkConstants.swift
//  lindenwood
//
//  Created by Kevin Gray on 1/7/16.
//  Copyright © 2016 Lindenwood. All rights reserved.
//

import Foundation

typealias JsonDictionary = [String : AnyObject]

//struct Urls {
//  static let BaseMainUrlDevelopment: String = "http://devapi2.golirx.com"
//  static let BaseAuthUrlDevelopment: String = "http://devauth-api2.golirx.com/"
//  static let BaseMainUrlStaging: String = "http://devapi2.golirx.com/"
//  static let BaseAuthUrlStaging: String = "http://devauth-api2.golirx.com/"
//  static let BaseMainUrlProduction: String = "http://api.golirx.com/"
//  static let BaseAuthUrlProduction: String = "http://auth-api.golirx.com/"
//  static let PackagingOptionsSamples: String = "http://www.medlypharmacy.com/packaging-samples"
//}
/// - NOTE: NEW URLs ... //devauth-api.medlypharmacy.com
struct Urls {
  static let BaseMainUrlDevelopment: String = "http://devapi.medlypharmacy.com"
  static let BaseAuthUrlDevelopment: String = "http://devauth-api.medlypharmacy.com/"
  static let BaseMainUrlStaging: String = "http://devapi.medlypharmacy.com/"
  static let BaseAuthUrlStaging: String = "http://devauth-api.medlypharmacy.com/"
  static let BaseMainUrlProduction: String = "https://api.medlypharmacy.com/"
  static let BaseAuthUrlProduction: String = "https://auth-api.medlypharmacy.com/"
  static let PackagingOptionsSamples: String = "http://www.medlypharmacy.com/packaging-samples"
}

struct LegalAgreementURLs {
  static let PrivacyPolicy: String = "http://medlypharmacy.com/privacy-policy/"
  static let TermsOfService: String = "http://medlypharmacy.com/terms-conditions/"
  static let HIPAANotice: String = "http://medlypharmacy.com/hipaa-notice-of-privacy-practice/"
}

struct InformationURLs {
  static let FAQs: String = "http://medlypharmacy.com/faq/"
}

struct Path {
  struct Config {
    static let Base: String = "/config"
    static let Localities: String = "/config/localities"
    static let API: String = "/config/api"
    static let SyncAddresses: String = "/config/sync_addresses"
    static let PaymentService: String = "/config/billing"
  }
  
  struct User {
    static let Register: String = "/users"
    static let Login: String = "/users/login"
    static let VerifyCode: String = "/users/verify_code"
    static let ResetPassword: String = "/users/reset_password"
    static let LocalityNotifications: String = "/locality_notifications"
    static let DeliveryAddress: String = "/delivery_address"
    static let Me: String = "/users/me"
    static let Devices: String = "/users/devices"
    static let FamilyMembers: String = "users/me/family_members"
  }
  
  struct Insurance {
    static let ImageUploadUrls: String = "/insurance_info/image_upload_urls"
    static let ImageUrls: String = "/insurance_info/images"
    static let InsuranceInfo: String = "/insurance_info"
    static let InsuranceInfoFamilyMember: String = "/insurance_info_family_member"
    static let InsuranceInfoAssociate: String = "/insurance_info/associate_person_to_insurances"
  }
  
  struct Address {
    static let DeliveryAddresses: String = "/delivery_addresses"
    static let DeliveryAddress: String = "/delivery_addresses/%@"
  }
  
  struct Prescription {
    static let PackagingPreference: String = "/packaging_preference"
    static let RefillPreference: String = "/refill_preference"
    static let PrescriptionTransfers: String = "/transfers"
    static let PrescriptionAlerts: String = "/prescription_alerts"
    static let ContactAlerts: String = "/contact_alerts"
    static let PrescriptionHistory: String = "/deliveries/medications/%@"
  }
  
  struct Payment {
    static let BraintreeClientToken: String = "/braintree/client_token"
    static let StripeCustomerId: String = "/braintree/client_token" // TODO - rename route

    static let CreditCards: String = "/credit_cards"
    static let CreditCardMakeDefault: String = "/credit_cards/make_default"
  }
  
  struct Profile {
    static let Base: String = "/profile"
  }
  
  struct Feed {
    static let Base: String = "/feed"
    static let DeliveryHistory: String = "/deliveries/history"
  }
  
  struct Deliveries {
    static let Base: String = "/deliveries"
    static let Approve: String = "/deliveries/%@/approve"
    static let Cancel: String = "/deliveries/%@/cancel"
    static let Delivered: String = "/deliveries/%@/delivered"
    static let Fetch: String = "/deliveries/%@"
  }
  
  struct Allergy {
    static let Base: String = "/allergy"
  }
  
  struct Physicians {
    static let Base: String = "/physicians"
    static let Physician: String = "/physicians/%@"
  }
}

struct ModelJsonKeys {
  struct User {
    static let user: String = "user"
    static let email: String = "email"
    static let firstName: String = "first_name"
    static let lastName: String = "last_name"
    static let phoneNumber: String = "phone_number"
    static let password: String = "password"
    static let passwordConfirmation: String = "password_confirmation"
    static let accessCode: String = "access_code"
    static let accessToken: String = "access_token"
    static let authToken: String = "authentication_token"
    static let insuranceInfos: String = "insurance_infos"
    static let biometricAuthEnabled: String = "touch_id_enabled" // TODO: Update to biometric auth constant, biometric_auth_enabled
    static let id: String = "id"
    static let zipCode: String = "zipcode"
    static let paymentMethods: String = "payment_methods"
    static let deliveryAddresses: String = "delivery_addresses"
    static let creditCards: String = "credit_cards"
    static let profileInfo: String = "profile"
    static let pharmacies: String = "pharmacies"
    static let allergy: String = "allergy"
    static let dobMonth: String = "dob_month"
    static let dobDay: String = "dob_day"
    static let dobYear: String = "dob_year"
    static let physicians: String = "physicians"
    static let familyMembers: String = "family_members"
    static let sameInsurance: String = "same_insurance"
    static let prescriptions: String = "prescriptions"
    static let gender: String = "gender"
    static let relationship: String = "relationship"
  }
  
  struct Address {
    static let deliveryAddress: String = "delivery_address"
    static let deliveryAddresses: String = "delivery_addresses"
    static let id: String = "id"
    static let street1: String = "street1"
    static let street2: String = "street2"
    static let city: String = "city"
    static let state: String = "state"
    static let zipCode: String = "zipcode"
    static let localDelivery: String = "local_delivery"
    static let isDefault: String = "is_default"
    static let latitude: String = "latitude"
    static let longitude: String = "longitude"
  }
  
  struct SuccessMessage {
    static let successMessage: String = "success_message"
    static let title: String = "title"
    static let message: String = "message"
  }
  
  struct InsuranceInfo {
    static let insuranceId: String = "insurance_id"
    static let insuranceInfo: String = "insurance_info"
    static let insuranceInfos: String = "insurance_infos"
    static let providerName: String = "provider_name"
    static let groupNumber: String = "group_number"
    static let memberId: String = "member_id"
    static let providerPhoneNumber: String = "provider_phone_number"
    static let payOutOfPocket: String = "pay_out_of_pocket"
    static let images: String = "images"
    static let persons: String = "persons"
    static let personsArray: String = "persons[]"
  }
  
  struct InsurancePerson {
    static let personId: String = "person_id"
    static let isMainAccount: String = "is_main_account"
    static let insuranceIds: String = "insurance_ids"
  }
    
  struct InsuranceInfoFamilyMember {
      static let insuranceInfo: String = "insurance_info"
      static let familyMemberId: String = "pub_id"
      static let providerName: String = "provider_name"
      static let groupNumber: String = "group_number"
      static let memberId: String = "member_id"
      static let providerPhoneNumber: String = "provider_phone_number"
      static let payOutOfPocket: String = "pay_out_of_pocket"
      static let images: String = "images"
  }
  
  struct InsuranceImageInfo {
    static let frontImageUrl: String = "front_image_url"
    static let backImageUrl: String = "back_image_url"
  }
  
  struct InsuranceUploadImageUrls {
    static let frontImageUploadUrl: String = "front_image_upload_url"
    static let backImageUploadUrl: String = "back_image_upload_url"
  }
  
  struct CreditCard {
    static let token: String = "token"
    static let cardType: String = "card_type"
    static let cardholderName: String = "cardholder_name"
    static let expirationMonth: String =  "expiration_month"
    static let expirationYear: String = "expiration_year"
    static let last4: String = "last_4"
    static let isDefault: String = "default"
  }
  
  struct Prescription {
    
    struct PackagingPreference {
      static let packagingPreference: String = "packaging_preference"
      static let preferenceType: String = "preference_type"
      static let preferenceTypeJSONPath: String = "packaging_preference.preference_type"
    }
    
    struct RefillPreference {
      static let refillPreference: String = "refill_preference"
      static let preferenceType: String = "preference_type"
      static let preferenceTypeJSONPath: String = "refill_preference.preference_type"
    }
    
    struct PrescriptionTransfer {
      static let transfer: String = "transfer"
      static let transfers: String = "transfers"
      static let id: String = "id"
      static let userId: String = "user_id"
      static let pharmacyName: String = "pharmacy_name"
      static let pharmacyPhoneNumber: String = "pharmacy_phone_number"
      static let pharmacyStreet: String = "pharmacy_street"
      static let pharmacyCity: String = "pharmacy_city"
      static let pharmacyState: String = "pharmacy_state"
      static let createdAt: String = "created_at"
      static let note: String = "note"
    }
    
    struct PrescriptionHistory {
      static let deliveries: String = "deliveries"
    }
    
    struct PrescriptionAlert {
      static let prescriptionAlert: String = "prescription_alert"
      static let prescriptionAlerts: String = "prescription_alerts"
      static let pharmacyId: String = "pharmacy_id"
      static let id: String = "id"
      static let userId: String = "user_id"
      static let note: String = "note"
      static let alertType: String = "alert_type"
      static let image: String = "image"
      static let imageUrl: String = "image_url"
    }
    
    struct Prescription {
      static let id: String = "id"
      static let medStatus: String = "med_status"
      static let quantity: String = "quantity"
      static let createdAt: String = "created_at"
      static let directions: String = "directions"
      static let notes: String = "notes"
      static let medication: String = "medication"
      static let rxNumber: String = "rx_number"
    }
    
    struct Medication {
      static let id: String = "id"
      static let createdAt: String = "created_at"
      static let name: String = "name"
      static let strength: String = "dosage"
      static let form: String = "form"
      static let formCode: String = "form_code"
      static let formName: String = "dosage_form_name"
      static let status: String = "status"
      static let generic: String = "generic"
    }
  }
  
  struct Contact {
    struct ContactAlert {
      static let contactAlert: String = "contact_alert"
      static let pharmacyId: String = "pharmacy_id"
      static let id: String = "id"
      static let userId: String = "user_id"
      static let note: String = "note"
    }
  }
  
  struct Payment {
    static let clientToken: String = "client_token" // TODO <<<
    static let customerId: String = "customer_id"
    static let creditCards: String = "credit_cards"
    static let creditCard: String = "credit_card"
    
    static let creditCardBillingAddress: String = "billing_address"
    static let creditCardOptions: String = "options"
    static let creditCardNonce: String = "payment_method_nonce"
    static let crediCardHolderName: String = "cardholder_name"
    
    static let creditCardStreetAddress: String = "street_address"
    static let creditCardLocality = "locality"
    static let creditCardRegion = "region"
    static let creditCardPostalCode = "postal_code"
    static let verifyCardOption = "verify_card"
    static let makeDefaultOption = "make_default"
  }
  
  struct Feed {
    static let systemNotifications: String = "system_notifications"
    static let deliveryNotifications: String = "delivery_notifications"
    static let deliveryHistories: String = "delivery_histories"
    static let deliveryHistoryMax: String = "delivery_history_max"
    static let pendingDeliveriesCount: String = "pending_deliveries_count"
    static let message: String = "message"
  }
  
  struct FeedNotification {
    static let notificationType: String = "notification_type"
    static let title: String = "title"
    static let message: String = "message"
    static let imageKey: String = "image_key"
    static let label: String = "label"
    static let button1Title: String = "button1"
    static let button2Title: String = "button2"
    static let updatedAt: String = "updated_at"
    static let decoratedUpdatedAt: String = "decorated_updated_at"
    static let deliveryInfo: String = "delivery"
    static let button1Action: String = "button1_action"
    static let button2Action: String = "button2_action"
    static let button1Meta: String = "button1_meta"
    static let button2Meta: String = "button2_meta"
    
    struct MetaInfo {
      static let viewHeader: String = "view_header"
      static let viewSubtext: String = "view_subtext"
      static let inputLabel: String = "input_label"
      static let inputPlaceholder: String = "input_placeholder"
      static let confirmButtonText: String = "confirm_button_text"
      static let confirmHeader: String = "confirm_header"
      static let confirmText: String = "confirm_text"
      static let alertType: String = "alert_type"
    }
    
    struct DeliveryInfo {
      static let id: String = "id"
      static let deliveryStatus: String = "delivery_status"
      static let deliveryType: String = "delivery_type"
      static let note: String = "note"
      static let noteFromPharmacist: String = "note_from_pharmacist"
      static let copayAmount: String = "copay_amount"
      static let formattedCopayAmount: String = "formatted_copay_amount"
      static let deliveryFee: String = "delivery_fee"
      static let formattedDeliveryFee: String = "formatted_delivery_fee"
      static let localDeliveryFee: String = "local_delivery_fee"
      static let formattedLocalDeliveryFee: String = "formatted_local_delivery_fee"
      static let formattedLocalTotal: String = "formatted_local_total"
      static let shipDeliveryFee: String = "ship_delivery_fee"
      static let formattedShipDeliveryFee: String = "formatted_ship_delivery_fee"
      static let formattedShipTotal: String = "formatted_ship_total"
      static let total: String = "total"
      static let formattedTotal: String = "formatted_total"
      static let deliveryPharmacyID: String = "pharmacy_id"
      static let transactionId: String = "transaction_id"
      static let shippingTrackingNumber: String = "shipping_tracking_no"
      static let expectedDeliveryDate: String = "expected_delivery_date"
      static let prescriptions: String = "prescriptions"
      static let deliveryAddress: String = "delivery_address"
      static let deliveryDate: String = "delivery_date"
      static let createdAt: String = "created_at"
      static let deliveryFamilyMember: String = "family_member"
      static let outForDelivery: String = "out_for_delivery"
    }
    
    struct DeliveryFamilyMember {
      static let id: String = "id"
      static let firstName: String = "first_name"
      static let lastName: String = "last_name"
      static let birthDate: String = "birthdate"
    }
  }
  
 
  struct ProfileInfo {
    static let score: String = "score"
    static let message: String = "message"
    static let requirements: String = "requirements"
    static let deliveryAddressRequirmentMessage: String = "delivery_address.message"
    static let insuranceInfoRequirementMessage: String = "insurance_info.message"
    static let creditCardsMessage: String = "credit_cards.message"
    static let packagingPreferenceMessage: String = "packaging_preference.message"
    static let refillPreferenceMessage: String = "refill_preference.message"
    static let allergyMessage: String = "allergy.message"
    static let physiciansMessage: String = "physicians.message"
    static let prescriptionsMessage: String = "prescriptions.message"
    static let medictionsMessage: String = "medications.message"
    static let familyMessage: String = "my_family.message"
    
  }
  
  struct Profile {
    static let profile: String = "profile"
    static let deliveryAddresses: String = "delivery_addresses"
    static let insuranceInfos: String = "insurance_infos"
    static let creditCards: String = "credit_cards"
    static let packagingPreference: String = "packaging_preference"
    static let refillPreference: String = "refill_preference"
    static let pharmacies: String = "pharmacies"
    static let allergy: String = "allergy"
    static let physicians: String = "physicians"
    static let prescriptions: String = "medications"
    static let familyMembers: String = "family_members"
  }
  
  struct DeliveryHistory {
    static let id: String = "id"
    static let deliveryStatus: String = "delivery_status"
    static let deliveryType: String = "delivery_type"
    static let deliveryDate: String = "delivery_date"
    static let formattedDeliveryDate: String = "formatted_delivery_date"
    static let addressString: String = "delivery_address"
    static let totalString: String = "total"
    static let historyMessage: String = "history_message"
    static let prescriptions: String = "prescriptions"

  }
  
  struct Pharmacy {
    static let pharmacy: String = "pharmacy"
    static let phoneNumber: String = "full_phone_number"
    static let name: String = "name"
    static let pubId: String = "pubid"
    static let npi: String = "npi"
    static let address: String = "address"
    static let fax: String = "fax_number"
    static let isDefault: String = "default"
  }
  
  struct Config {
    static let api: String = "api"
    static let states: String = "states"
    static let deliveryStates: String = "delivery_states"
    static let physicianAuthorization: String = "physician_authorization"
    
    struct ImageParams {
      static let imageParams: String = "image_params"
      struct InsuranceCard {
        static let insuranceCard: String = "insurance_card"
        static let jpegCompressionRate: String = "insurance_image_jpeg_compression_rate"
        static let resizeWidth: String = "insurance_image_resize_width"
      }
    }
    
    struct ServiceContacts {
      static let serviceContacts: String = "service_contacts"
      static let contactEmail: String = "contact_email"
      static let privacy: String = "privacy"
      static let supportEmail: String = "support_email"
      static let tos: String = "tos"
    }
  }
  
  struct Deliveries {
    static let delivery: String = "delivery"
    static let deliveries: String = "deliveries"
    static let pharmacyId: String = "pharmacy_id"
    static let deliveryType: String = "delivery_type"
    static let guardFromDuplicates: String = "guard_from_duplicates"
    static let note: String = "note"
    static let copayAmount: String = "copay_amount"
    static let deliveryFee: String = "delivery_fee"
    static let sourceId: String = "source_id"
    static let deliveryAddressId: String = "delivery_address_id"
    static let createTestPrescription: String = "create_test_prescriptions"
    static let createTestForFamilyMember: String = "create_test_for_family_member"
  }
  
  struct Allergy {
    static let allergy: String = "allergy"
    static let allergyNote: String = "allergy_note"
    static let noAllergyIndicated: String = "no_allergy_indicated"
  }
  
  struct Pagination {
    static let max: String = "max"
    static let skip: String = "skip"
  }
  
  struct PushNotifications {
    static let registrationId: String = "registration_id"
  }
  
  struct Generic {
    static let publicId: String = "pub_id"
    static let userId: String = "user_id"
    static let familyMemberId: String = "fid"
    static let success: String = "success"
  }
  
  struct Physician {
    static let physician: String = "physician"
    static let physicians: String = "physicians"
    static let id: String = "id"
    static let firstName: String = "first_name"
    static let lastName: String = "last_name"
    static let phoneNumber: String = "phone_number"
    static let email: String = "email"
    static let street1: String = "street1"
    static let street2: String = "street2"
    static let city: String = "city"
    static let state: String = "state"
    static let zipCode: String = "zipcode"
    static let authorization: String = "authorization"
  }
}
