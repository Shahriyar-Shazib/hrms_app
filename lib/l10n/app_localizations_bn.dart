// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'HRMS';

  @override
  String get save => 'সেভ';

  @override
  String get cancel => 'বাতিল';

  @override
  String get delete => 'ডিলিট';

  @override
  String get edit => 'এডিট';

  @override
  String get retry => 'আবার চেষ্টা করুন';

  @override
  String get done => 'সম্পন্ন';

  @override
  String get close => 'বন্ধ করুন';

  @override
  String get add => 'যুক্ত করুন';

  @override
  String get assign => 'অ্যাসাইন';

  @override
  String get remove => 'রিমুভ';

  @override
  String get transfer => 'ট্রান্সফার';

  @override
  String get moveOut => 'মুভ আউট';

  @override
  String get saved => 'সেভ হয়েছে';

  @override
  String get mustBeOnlineToSave => 'সেভ করতে অনলাইনে থাকতে হবে।';

  @override
  String get createdLabel => 'তৈরি';

  @override
  String get updatedLabel => 'আপডেট';

  @override
  String get notesLabel => 'নোট';

  @override
  String get reasonLabel => 'কারণ';

  @override
  String get reasonRequired => 'কারণ আবশ্যক';

  @override
  String get labelFieldLabel => 'লেবেল';

  @override
  String get labelRequired => 'লেবেল আবশ্যক';

  @override
  String get amountFieldLabel => 'পরিমাণ';

  @override
  String get amountRequired => 'পরিমাণ আবশ্যক';

  @override
  String get amountMustBePositive => 'পরিমাণ পজিটিভ হতে হবে';

  @override
  String get enterValidNumber => 'সঠিক সংখ্যা লিখুন';

  @override
  String get positiveNumberRequired => 'পজিটিভ সংখ্যা হতে হবে';

  @override
  String get nonNegativeNumberRequired => '0 বা তার বেশি সংখ্যা হতে হবে';

  @override
  String get waive => 'মওকুফ';

  @override
  String get monthName1 => 'জানুয়ারি';

  @override
  String get monthName2 => 'ফেব্রুয়ারি';

  @override
  String get monthName3 => 'মার্চ';

  @override
  String get monthName4 => 'এপ্রিল';

  @override
  String get monthName5 => 'মে';

  @override
  String get monthName6 => 'জুন';

  @override
  String get monthName7 => 'জুলাই';

  @override
  String get monthName8 => 'আগস্ট';

  @override
  String get monthName9 => 'সেপ্টেম্বর';

  @override
  String get monthName10 => 'অক্টোবর';

  @override
  String get monthName11 => 'নভেম্বর';

  @override
  String get monthName12 => 'ডিসেম্বর';

  @override
  String get roleSuperAdmin => 'সুপার অ্যাডমিন';

  @override
  String get roleHouseOwner => 'বাসার মালিক';

  @override
  String get roleManager => 'ম্যানেজার';

  @override
  String get roleUnknown => 'অজানা';

  @override
  String get loginSubtitle => 'আপনার অ্যাকাউন্টে সাইন ইন করুন';

  @override
  String get loginEmailLabel => 'ইমেইল';

  @override
  String get loginEmailRequired => 'আপনার ইমেইল লিখুন';

  @override
  String get loginPasswordLabel => 'পাসওয়ার্ড';

  @override
  String get loginPasswordRequired => 'আপনার পাসওয়ার্ড লিখুন';

  @override
  String get rememberMe => 'মনে রাখুন';

  @override
  String get signIn => 'সাইন ইন';

  @override
  String homeWelcome(String name) {
    return 'স্বাগতম, $name';
  }

  @override
  String get homeHousesButton => 'বাসা';

  @override
  String get homeManagersButton => 'ম্যানেজার';

  @override
  String get signOutTooltip => 'সাইন আউট';

  @override
  String get languageSwitchTooltip => 'ভাষা';

  @override
  String get languageBangla => 'বাংলা';

  @override
  String get languageEnglish => 'English';

  @override
  String get adminSectionTitle => 'অ্যাডমিন';

  @override
  String get housesTitle => 'বাসা';

  @override
  String get newHouseTooltip => 'নতুন বাসা';

  @override
  String get noHousesYet => 'এখনও কোনো বাসা নেই';

  @override
  String get failedToLoadHouses => 'বাসার তালিকা লোড করা যায়নি';

  @override
  String get refreshFailed => 'রিফ্রেশ ব্যর্থ হয়েছে';

  @override
  String get editHouseTooltip => 'এডিট';

  @override
  String get deleteHouseTooltip => 'ডিলিট';

  @override
  String get deleteHouseDialogTitle => 'এই বাসাটি ডিলিট করবেন?';

  @override
  String get deleteHouseDialogBody => 'এটি আর ফিরিয়ে আনা যাবে না।';

  @override
  String get houseDeleted => 'বাসা ডিলিট হয়েছে';

  @override
  String get mustBeOnlineToDelete => 'ডিলিট করতে অনলাইনে থাকতে হবে।';

  @override
  String get houseNotFound => 'বাসা পাওয়া যায়নি';

  @override
  String get connectToLoadHouse => 'এই বাসাটি লোড করতে ইন্টারনেটে সংযুক্ত হন।';

  @override
  String get houseFieldName => 'নাম';

  @override
  String get houseFieldAddress => 'ঠিকানা';

  @override
  String get houseFieldCity => 'শহর';

  @override
  String get houseFieldTotalFloors => 'মোট ফ্লোর';

  @override
  String get roomsButton => 'রুম';

  @override
  String get rentersButton => 'ভাড়াটিয়া';

  @override
  String get metersButton => 'মিটার';

  @override
  String get billConfigButton => 'বিল কনফিগারেশন';

  @override
  String get managersButton => 'ম্যানেজার';

  @override
  String get expensesButton => 'খরচ';

  @override
  String get reportsButton => 'রিপোর্ট';

  @override
  String get invoicesButton => 'ইনভয়েস';

  @override
  String get newHouseAppBarTitle => 'নতুন বাসা';

  @override
  String get editHouseAppBarTitle => 'বাসা এডিট করুন';

  @override
  String get houseNameHint => 'যেমন Sunrise Apartments';

  @override
  String get houseNameRequired => 'নাম আবশ্যক';

  @override
  String get houseAddressHint => 'রাস্তার ঠিকানা';

  @override
  String get houseAddressRequired => 'ঠিকানা আবশ্যক';

  @override
  String get houseFloorsHint => 'যেমন 4';

  @override
  String get roomsTitle => 'রুম';

  @override
  String get noRoomsYet => 'এখনও কোনো রুম নেই';

  @override
  String get failedToLoadRooms => 'রুমের তালিকা লোড করা যায়নি';

  @override
  String roomTileTitle(String number) {
    return 'রুম $number';
  }

  @override
  String get editRoomTooltip => 'রুম এডিট';

  @override
  String get roomNotFound => 'রুম পাওয়া যায়নি';

  @override
  String get connectToLoadRoom => 'এই রুমটি লোড করতে ইন্টারনেটে সংযুক্ত হন।';

  @override
  String get roomFieldRoomNumber => 'রুম নম্বর';

  @override
  String get roomFieldStatus => 'স্ট্যাটাস';

  @override
  String get roomFieldBaseRent => 'মূল ভাড়া';

  @override
  String get roomFieldFloor => 'ফ্লোর';

  @override
  String get roomFieldMeter => 'মিটার';

  @override
  String get meterAttachedYes => 'আছে';

  @override
  String get meterAttachedNo => 'নেই';

  @override
  String get roomFieldMeterNumber => 'মিটার নম্বর';

  @override
  String get currentRenterSectionTitle => 'বর্তমান ভাড়াটিয়া';

  @override
  String get roomFieldName => 'নাম';

  @override
  String get roomFieldMobile => 'মোবাইল';

  @override
  String get roomFieldSince => 'থেকে';

  @override
  String get collectPaymentButton => 'পেমেন্ট সংগ্রহ';

  @override
  String get vacantNoRenter => 'খালি — কোনো ভাড়াটিয়া নেই';

  @override
  String get meterReadingsButton => 'মিটার রিডিং';

  @override
  String get roomStatusVacant => 'খালি';

  @override
  String get roomStatusOccupied => 'ভর্তি';

  @override
  String get newRoomAppBarTitle => 'নতুন রুম';

  @override
  String get editRoomAppBarTitle => 'রুম এডিট করুন';

  @override
  String get roomNumberHint => 'যেমন 101';

  @override
  String get roomNumberRequired => 'রুম নম্বর আবশ্যক';

  @override
  String get baseRentHint => 'যেমন 7500';

  @override
  String get baseRentRequired => 'মূল ভাড়া আবশ্যক';

  @override
  String get floorHint => 'যেমন 2 বা Ground';

  @override
  String get meterAttachedTitle => 'মিটার সংযুক্ত আছে';

  @override
  String get meterPresentSubtitle => 'বিদ্যুৎ মিটার আছে';

  @override
  String get noMeterSubtitle => 'মিটার নেই';

  @override
  String get meterNumberHint => 'যেমন MTR-001';

  @override
  String get rentersTitle => 'ভাড়াটিয়া';

  @override
  String get noRentersYet => 'এখনও কোনো ভাড়াটিয়া নেই';

  @override
  String get failedToLoadRenters => 'ভাড়াটিয়ার তালিকা লোড করা যায়নি';

  @override
  String get editRenterTooltip => 'ভাড়াটিয়া এডিট';

  @override
  String get renterNotFound => 'ভাড়াটিয়া পাওয়া যায়নি';

  @override
  String get connectToLoadRenter =>
      'এই ভাড়াটিয়ার তথ্য লোড করতে ইন্টারনেটে সংযুক্ত হন।';

  @override
  String get renterFieldAdvance => 'অগ্রিম';

  @override
  String get currentAssignmentSectionTitle => 'বর্তমান অ্যাসাইনমেন্ট';

  @override
  String get renterFieldRoom => 'রুম';

  @override
  String get renterFieldMoveIn => 'মুভ-ইন';

  @override
  String get contactIdentitySectionTitle => 'যোগাযোগ ও পরিচয়';

  @override
  String get renterFieldNid => 'এনআইডি';

  @override
  String get renterFieldPresentAddress => 'বর্তমান ঠিকানা';

  @override
  String get renterFieldPermanentAddress => 'স্থায়ী ঠিকানা';

  @override
  String get renterFieldOccupation => 'পেশা';

  @override
  String get renterFieldOrganization => 'প্রতিষ্ঠান';

  @override
  String get renterFieldEmergencyContact => 'জরুরি যোগাযোগ';

  @override
  String get renterFieldEmergencyMobile => 'জরুরি মোবাইল';

  @override
  String get assignToRoomButton => 'রুমে অ্যাসাইন করুন';

  @override
  String get duesButton => 'বকেয়া';

  @override
  String get newRenterAppBarTitle => 'নতুন ভাড়াটিয়া';

  @override
  String get editRenterAppBarTitle => 'ভাড়াটিয়া এডিট করুন';

  @override
  String get sectionBasic => 'প্রাথমিক তথ্য';

  @override
  String get fullNameLabel => 'পূর্ণ নাম';

  @override
  String get fullNameHint => 'যেমন Rahim Uddin';

  @override
  String get fullNameRequired => 'পূর্ণ নাম আবশ্যক';

  @override
  String get mobileLabel => 'মোবাইল';

  @override
  String get mobileHint => 'যেমন 01711-000000';

  @override
  String get mobileRequired => 'মোবাইল নম্বর আবশ্যক';

  @override
  String get sectionIdentity => 'পরিচয়';

  @override
  String get nidNumberLabel => 'এনআইডি নম্বর';

  @override
  String get nidNumberHint => 'জাতীয় পরিচয়পত্র নম্বর';

  @override
  String get sectionAddress => 'ঠিকানা';

  @override
  String get presentAddressLabel => 'বর্তমান ঠিকানা';

  @override
  String get permanentAddressLabel => 'স্থায়ী ঠিকানা';

  @override
  String get sectionWork => 'কর্মক্ষেত্র';

  @override
  String get occupationLabel => 'পেশা';

  @override
  String get occupationHint => 'যেমন Teacher';

  @override
  String get organizationLabel => 'প্রতিষ্ঠান';

  @override
  String get organizationHint => 'যেমন City College';

  @override
  String get sectionEmergencyContact => 'জরুরি যোগাযোগ';

  @override
  String get contactNameLabel => 'যোগাযোগের নাম';

  @override
  String get contactNameHint => 'যেমন Karim Uddin';

  @override
  String get contactMobileLabel => 'যোগাযোগের মোবাইল';

  @override
  String get contactMobileHint => 'যেমন 01711-000001';

  @override
  String get sectionFinancial => 'আর্থিক তথ্য';

  @override
  String get advanceAmountLabel => 'অগ্রিমের পরিমাণ';

  @override
  String get advanceAmountHint => 'যেমন 5000';

  @override
  String get assignDialogTitle => 'রুমে অ্যাসাইন করুন';

  @override
  String get noVacantRooms => 'কোনো খালি রুম নেই।';

  @override
  String get vacantRoomLabel => 'খালি রুম';

  @override
  String get selectARoom => 'একটি রুম বেছে নিন';

  @override
  String get moveInDateLabel => 'মুভ-ইন তারিখ';

  @override
  String get openingMeterReadingLabel => 'শুরুর মিটার রিডিং';

  @override
  String get openingMeterReadingHint => 'মুভ-ইনের সময় kWh (প্রস্তাবিত)';

  @override
  String get assignedSuccess => 'সফলভাবে অ্যাসাইন হয়েছে';

  @override
  String get transferDialogTitle => 'রুম ট্রান্সফার করুন';

  @override
  String get noOtherVacantRooms => 'অন্য কোনো খালি রুম নেই।';

  @override
  String get transferToRoomLabel => 'যে রুমে ট্রান্সফার করবেন';

  @override
  String get transferDateLabel => 'ট্রান্সফারের তারিখ';

  @override
  String get transferredSuccess => 'সফলভাবে ট্রান্সফার হয়েছে';

  @override
  String get moveOutDialogTitle => 'মুভ আউট';

  @override
  String get moveOutDateLabel => 'মুভ-আউট তারিখ';

  @override
  String get selectAReason => 'একটি কারণ বেছে নিন';

  @override
  String get movedOutSuccess => 'সফলভাবে মুভ আউট হয়েছে';

  @override
  String get moveOutReasonMovedOut => 'মুভ আউট';

  @override
  String get moveOutReasonEvicted => 'বহিষ্কৃত';

  @override
  String get billConfigTitle => 'বিল কনফিগারেশন';

  @override
  String get addBillHeadTooltip => 'বিল হেড যুক্ত করুন';

  @override
  String get failedToLoadBillConfig => 'বিল কনফিগারেশন লোড করা যায়নি';

  @override
  String get noBillHeadsConfigured => 'কোনো বিল হেড কনফিগার করা নেই।';

  @override
  String get billHeadServiceCharge => 'সার্ভিস চার্জ';

  @override
  String get billHeadWasteBill => 'বর্জ্য বিল';

  @override
  String get billHeadElectricityRate => 'বিদ্যুতের রেট (প্রতি ইউনিট)';

  @override
  String get billHeadElectricityRateShort => 'বিদ্যুতের রেট';

  @override
  String get billHeadCustom => 'কাস্টম';

  @override
  String billConfigSubtitle(String headLabel, String date) {
    return '$headLabel · কার্যকর $date';
  }

  @override
  String get addBillHeadAppBarTitle => 'বিল হেড যুক্ত করুন';

  @override
  String get updateBillHeadAppBarTitle => 'বিল হেড আপডেট করুন';

  @override
  String get billHeadFieldLabel => 'হেড';

  @override
  String get pleaseSelectAHead => 'একটি হেড বেছে নিন';

  @override
  String get perUnitSuffix => 'প্রতি ইউনিট';

  @override
  String get effectiveFromFieldLabel => 'কার্যকর তারিখ';

  @override
  String get billHeadUpdated => 'বিল হেড আপডেট হয়েছে';

  @override
  String get billHeadAdded => 'বিল হেড যুক্ত হয়েছে';

  @override
  String get metersTitle => 'মিটার';

  @override
  String get failedToLoadMeters => 'মিটারের তালিকা লোড করা যায়নি';

  @override
  String get noMeteredRooms => 'এই বাসায় কোনো মিটারযুক্ত রুম নেই।';

  @override
  String get meterReadingsTitle => 'মিটার রিডিং';

  @override
  String get failedToLoadReadings => 'রিডিং লোড করা যায়নি';

  @override
  String get noReadingsYet => 'এখনও কোনো রিডিং নেই।';

  @override
  String get adjustTooltip => 'অ্যাডজাস্ট';

  @override
  String get adjustmentChipLabel => 'অ্যাডজাস্টমেন্ট';

  @override
  String unitsConsumedLine(String units, String current, String previous) {
    return '$units ইউনিট · $current kWh (আগের $previous)';
  }

  @override
  String rateLine(String rate, String date) {
    return '@ ৳$rate/ইউনিট · $date';
  }

  @override
  String get addMeterReadingAppBarTitle => 'মিটার রিডিং যুক্ত করুন';

  @override
  String get currentReadingLabel => 'বর্তমান রিডিং (kWh)';

  @override
  String get currentReadingHint => 'যেমন 1640';

  @override
  String get currentReadingRequired => 'বর্তমান রিডিং আবশ্যক';

  @override
  String get previousReadingLabel => 'আগের রিডিং (kWh)';

  @override
  String get previousReadingHint =>
      'শুরুর মিটার রিডিং (প্রথম এন্ট্রির জন্য আবশ্যক)';

  @override
  String get previousReadingRequiredFirst => 'প্রথম রিডিংয়ের জন্য আবশ্যক';

  @override
  String get readingDateLabel => 'রিডিংয়ের তারিখ';

  @override
  String get billingPeriodSectionTitle => 'বিলিং পিরিয়ড';

  @override
  String get monthFieldLabel => 'মাস';

  @override
  String get yearFieldLabel => 'বছর';

  @override
  String get saveReadingButton => 'রিডিং সেভ করুন';

  @override
  String get readingSaved => 'রিডিং সেভ হয়েছে';

  @override
  String get adjustReadingAppBarTitle => 'রিডিং অ্যাডজাস্ট করুন';

  @override
  String get correctingReadingFor => 'যে রিডিং সংশোধন করা হচ্ছে';

  @override
  String currentReadingLine(String current, String rate) {
    return 'বর্তমান রিডিং: $current kWh · @ ৳$rate/ইউনিট';
  }

  @override
  String get correctedReadingLabel => 'সংশোধিত রিডিং (kWh)';

  @override
  String get correctedReadingHint => 'যেমন 1645';

  @override
  String get correctedReadingRequired => 'সংশোধিত রিডিং আবশ্যক';

  @override
  String get rateOverrideLabel => 'রেট ওভাররাইড (প্রতি ইউনিট)';

  @override
  String get rateOverrideHint => 'খালি রাখলে কনফিগার করা রেট প্রযোজ্য হবে';

  @override
  String get rateOverrideHelper =>
      'ঐচ্ছিক — শুধু এই অ্যাডজাস্টমেন্টের জন্য রেট পরিবর্তন করে';

  @override
  String get saveAdjustmentButton => 'অ্যাডজাস্টমেন্ট সেভ করুন';

  @override
  String get adjustmentSaved => 'অ্যাডজাস্টমেন্ট সেভ হয়েছে';

  @override
  String get managersTitle => 'ম্যানেজার';

  @override
  String get newManagerTooltip => 'নতুন ম্যানেজার';

  @override
  String get failedToLoadManagers => 'ম্যানেজারের তালিকা লোড করা যায়নি';

  @override
  String get noManagersYet => 'এখনও কোনো ম্যানেজার নেই।';

  @override
  String get newManagerAppBarTitle => 'নতুন ম্যানেজার';

  @override
  String get emailLabel => 'ইমেইল';

  @override
  String get emailRequired => 'ইমেইল আবশ্যক';

  @override
  String get emailInvalid => 'সঠিক ইমেইল লিখুন';

  @override
  String get passwordLabel => 'পাসওয়ার্ড';

  @override
  String get passwordRequired => 'পাসওয়ার্ড আবশ্যক';

  @override
  String get passwordTooShort => 'পাসওয়ার্ড কমপক্ষে 8 ক্যারেক্টারের হতে হবে';

  @override
  String get managerCreated => 'ম্যানেজার তৈরি হয়েছে';

  @override
  String get assignManagerTooltip => 'ম্যানেজার অ্যাসাইন করুন';

  @override
  String get noManagersAssigned => 'এই বাসায় কোনো ম্যানেজার অ্যাসাইন করা নেই।';

  @override
  String get expensesSwitchLabel => 'খরচ';

  @override
  String get removeManagerTooltip => 'রিমুভ';

  @override
  String get removeManagerDialogTitle => 'ম্যানেজার রিমুভ করবেন?';

  @override
  String removeManagerDialogBody(String name) {
    return '$name-এর এই বাসার অ্যাক্সেস বাতিল হবে।';
  }

  @override
  String get managerFallbackName => 'ম্যানেজার';

  @override
  String get managerRemoved => 'ম্যানেজার রিমুভ হয়েছে';

  @override
  String get noManagersYetDialogTitle => 'এখনও কোনো ম্যানেজার নেই';

  @override
  String get noManagersYetDialogBody =>
      'প্রথমে একটি ম্যানেজার তৈরি করুন, তারপর এই বাসায় অ্যাসাইন করুন।';

  @override
  String get createManagerButton => 'ম্যানেজার তৈরি করুন';

  @override
  String get allManagersAssignedBody =>
      'আপনার সব ম্যানেজার এই বাসায় ইতিমধ্যে অ্যাসাইন করা আছে।';

  @override
  String get managerDropdownLabel => 'ম্যানেজার';

  @override
  String get canLogExpensesLabel => 'খরচ লগ করতে পারবে';

  @override
  String get expensesTitle => 'খরচ';

  @override
  String get addExpenseTooltip => 'খরচ যুক্ত করুন';

  @override
  String get failedToLoadExpenses => 'খরচের তালিকা লোড করা যায়নি';

  @override
  String get noExpensesThisMonth => 'এই মাসে কোনো খরচ নেই।';

  @override
  String get monthTotalLabel => 'মাসের মোট';

  @override
  String get deleteExpenseTooltip => 'ডিলিট';

  @override
  String get deleteExpenseDialogTitle => 'এই খরচটি ডিলিট করবেন?';

  @override
  String deleteExpenseDialogBody(String label, String amount) {
    return '$label — ৳$amount';
  }

  @override
  String get expenseDeleted => 'খরচ ডিলিট হয়েছে';

  @override
  String paidToLine(String name) {
    return 'পরিশোধ করা হয়েছে $name-কে';
  }

  @override
  String get categoryRepair => 'মেরামত';

  @override
  String get categoryMaintenance => 'রক্ষণাবেক্ষণ';

  @override
  String get categoryStaffSalary => 'স্টাফ বেতন';

  @override
  String get categoryUtilityBill => 'ইউটিলিটি বিল';

  @override
  String get categoryCustom => 'কাস্টম';

  @override
  String get addExpenseAppBarTitle => 'খরচ যুক্ত করুন';

  @override
  String get editExpenseAppBarTitle => 'খরচ এডিট করুন';

  @override
  String get categoryFieldLabel => 'ক্যাটাগরি';

  @override
  String get categoryRequired => 'একটি ক্যাটাগরি বেছে নিন';

  @override
  String get expenseDateLabel => 'খরচের তারিখ';

  @override
  String get paidToLabel => 'যাকে পরিশোধ করা হয়েছে';

  @override
  String get expenseUpdated => 'খরচ আপডেট হয়েছে';

  @override
  String get expenseAdded => 'খরচ যুক্ত হয়েছে';

  @override
  String get duesTitle => 'বকেয়া';

  @override
  String get addDueTooltip => 'বকেয়া যুক্ত করুন';

  @override
  String get failedToLoadDues => 'বকেয়ার তালিকা লোড করা যায়নি';

  @override
  String get noDuesForRenter => 'এই ভাড়াটিয়ার কোনো বকেয়া নেই।';

  @override
  String get manualTag => 'ম্যানুয়াল';

  @override
  String waivedLine(String reason) {
    return 'মওকুফ: $reason';
  }

  @override
  String get waiveTooltip => 'মওকুফ';

  @override
  String get dueWaived => 'বকেয়া মওকুফ হয়েছে';

  @override
  String get dueStatusOpen => 'বাকি';

  @override
  String get dueStatusPartial => 'আংশিক পরিশোধিত';

  @override
  String get dueStatusPaid => 'পরিশোধিত';

  @override
  String get dueStatusWaived => 'মওকুফ করা হয়েছে';

  @override
  String get addDueAppBarTitle => 'বকেয়া যুক্ত করুন';

  @override
  String get dueHeadElectricity => 'বিদ্যুৎ';

  @override
  String get dueHeadRent => 'ভাড়া';

  @override
  String dueOfAmount(String outstanding, String amount) {
    return '$amount-এর মধ্যে $outstanding';
  }

  @override
  String get dueDateLabel => 'বকেয়ার তারিখ';

  @override
  String get dueAdded => 'বকেয়া যুক্ত হয়েছে';

  @override
  String get waiveDueDialogTitle => 'এই বকেয়া মওকুফ করবেন?';

  @override
  String waiveDueDialogBody(String headLabel, String outstanding) {
    return '$headLabel — ৳$outstanding বাকি আছে। এটি আর ফিরিয়ে আনা যাবে না।';
  }

  @override
  String get invoicesTitle => 'ইনভয়েস';

  @override
  String get generateButton => 'জেনারেট';

  @override
  String get noInvoicesThisMonth => 'এই মাসে কোনো ইনভয়েস নেই।';

  @override
  String get tapGenerateHint => 'এই মাসের ইনভয়েস তৈরি করতে জেনারেট চাপুন।';

  @override
  String get failedToLoadInvoices => 'ইনভয়েসের তালিকা লোড করা যায়নি';

  @override
  String get invoiceAppBarTitle => 'ইনভয়েস';

  @override
  String get failedToLoadInvoice => 'ইনভয়েস লোড করা যায়নি';

  @override
  String get invoiceFieldRenter => 'ভাড়াটিয়া';

  @override
  String get invoiceFieldRoom => 'রুম';

  @override
  String get invoiceFieldDueDate => 'বকেয়ার তারিখ';

  @override
  String get invoiceFieldIssued => 'ইস্যু করা হয়েছে';

  @override
  String get lineItemsSectionTitle => 'লাইন আইটেম';

  @override
  String get invoiceFieldTotal => 'মোট';

  @override
  String get invoiceFieldPaid => 'পরিশোধিত';

  @override
  String get invoiceStatusUnpaid => 'অপরিশোধিত';

  @override
  String get invoiceStatusPartial => 'আংশিক পরিশোধিত';

  @override
  String get invoiceStatusPaid => 'পরিশোধিত';

  @override
  String get invoiceStatusClosed => 'বন্ধ';

  @override
  String get generateInvoicesDialogTitle => 'ইনভয়েস জেনারেট করুন';

  @override
  String get billHeadsSectionTitle => 'বিল হেড';

  @override
  String get selectAtLeastOneBillHead =>
      'কমপক্ষে একটি বিল হেড বেছে নিন (বা সবকিছুর জন্য সব বেছে নিন)';

  @override
  String get includeElectricityLabel => 'বিদ্যুৎ অন্তর্ভুক্ত করুন';

  @override
  String get generateWarningBody =>
      'এতে সব ভর্তি রুমের ইনভয়েস তৈরি হবে এবং আগের অপরিশোধিত ইনভয়েস বকেয়ায় রূপান্তরিত হবে। এটি আর ফিরিয়ে আনা যাবে না।';

  @override
  String get alreadyGeneratedTitle => 'আগেই জেনারেট করা হয়েছে';

  @override
  String get invoicesGeneratedTitle => 'ইনভয়েস জেনারেট হয়েছে';

  @override
  String get alreadyGeneratedBody =>
      'এই মাসের ইনভয়েস আগে থেকেই আছে। নতুন কিছু তৈরি হয়নি।';

  @override
  String invoicesCreatedCount(int count) {
    return '$countটি ইনভয়েস তৈরি হয়েছে।';
  }

  @override
  String invoicesClosedLine(int closedCount, int duesCount) {
    return '$closedCountটি আগের ইনভয়েস বন্ধ হয়েছে → $duesCountটি বকেয়া তৈরি হয়েছে।';
  }

  @override
  String get skippedRoomsTitle => 'বাদ দেওয়া রুম';

  @override
  String get skippedRoomFallback => 'রুম';

  @override
  String get skippedReasonFallback => 'অজানা কারণ';

  @override
  String get warningsTitle => 'সতর্কতা';

  @override
  String get warningElectricityMissing => 'বিদ্যুৎ রিডিং পাওয়া যায়নি';

  @override
  String warningRoomLine(String roomNumber, String reason) {
    return 'রুম $roomNumber: $reason';
  }

  @override
  String get reportsTitle => 'রিপোর্ট';

  @override
  String get occupancySectionTitle => 'অকুপেন্সি';

  @override
  String get pnlSectionTitle => 'P&L';

  @override
  String get duesAgingSectionTitle => 'বকেয়ার মেয়াদ';

  @override
  String get failedToLoadOccupancy => 'অকুপেন্সি লোড করা যায়নি';

  @override
  String occupiedPercent(String rate) {
    return '$rate% ভর্তি';
  }

  @override
  String get totalLabel => 'মোট';

  @override
  String get occupiedLabel => 'ভর্তি';

  @override
  String get vacantLabel => 'খালি';

  @override
  String get failedToLoadPnl => 'P&L লোড করা যায়নি';

  @override
  String get billedSectionTitle => 'বিল করা হয়েছে';

  @override
  String get rentLabel => 'ভাড়া';

  @override
  String get electricityLabel => 'বিদ্যুৎ';

  @override
  String get billsLabel => 'বিল';

  @override
  String get manualDuesLabel => 'ম্যানুয়াল বকেয়া';

  @override
  String get collectedSectionTitle => 'সংগ্রহ করা হয়েছে';

  @override
  String get expensesSectionTitle => 'খরচ';

  @override
  String get netBilledLabel => 'নেট (বিল করা)';

  @override
  String get netCollectedLabel => 'নেট (সংগৃহীত)';

  @override
  String get collectionGapLabel => 'সংগ্রহের ঘাটতি';

  @override
  String get failedToLoadDuesAging => 'বকেয়ার মেয়াদ লোড করা যায়নি';

  @override
  String get bucket0_30 => '0–30 দিন';

  @override
  String get bucket31_60 => '31–60 দিন';

  @override
  String get bucket61_90 => '61–90 দিন';

  @override
  String get bucket90Plus => '90+ দিন';

  @override
  String get totalOutstandingLabel => 'মোট বাকি';

  @override
  String get mustBeOnlineToCollect => 'পেমেন্ট সংগ্রহ করতে অনলাইনে থাকতে হবে।';

  @override
  String get unexpectedErrorRetry =>
      'একটি অপ্রত্যাশিত সমস্যা হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get paymentDetailsSectionTitle => 'পেমেন্টের বিবরণ';

  @override
  String get amountLabel => 'পরিমাণ';

  @override
  String outstandingHelper(String amount) {
    return 'বাকি: ৳$amount';
  }

  @override
  String get enterAnAmount => 'একটি পরিমাণ লিখুন';

  @override
  String get amountMustBeGreaterThanZero => 'পরিমাণ 0-এর বেশি হতে হবে';

  @override
  String get enterValidAmount => 'সঠিক পরিমাণ লিখুন (যেমন 1500.00)';

  @override
  String get paymentMethodLabel => 'পেমেন্ট মেথড';

  @override
  String get paymentMethodCash => 'ক্যাশ';

  @override
  String get paymentMethodBank => 'ব্যাংক';

  @override
  String get paymentMethodMobile => 'মোবাইল';

  @override
  String get referenceLabel => 'রেফারেন্স (ঐচ্ছিক)';

  @override
  String get referenceHint => 'চেক নম্বর, ট্রানজেকশন আইডি…';

  @override
  String get notesOptionalLabel => 'নোট (ঐচ্ছিক)';

  @override
  String get collectButton => 'সংগ্রহ করুন';

  @override
  String invoiceTitleLine(String month, int year) {
    return '$month $year ইনভয়েস';
  }

  @override
  String get outstandingDuesSectionTitle => 'বাকি থাকা বকেয়া';

  @override
  String get paymentReceivedTitle => 'পেমেন্ট পাওয়া গেছে';

  @override
  String paymentViaLine(String amount, String method) {
    return '৳$amount, $method-এর মাধ্যমে';
  }

  @override
  String get appliedToSectionTitle => 'প্রয়োগ করা হয়েছে';

  @override
  String get newOutstandingLabel => 'নতুন বাকি';

  @override
  String appliedAmountToInvoice(String amount, String month, int year) {
    return '৳$amount → $month $year ইনভয়েস';
  }

  @override
  String appliedAmountToDue(String amount, String label) {
    return '৳$amount → $label';
  }

  @override
  String appliedAmountToOther(String amount, String targetType) {
    return '৳$amount → $targetType';
  }

  @override
  String get dueFallback => 'বকেয়া';

  @override
  String get roomAppBarFallback => 'রুম';

  @override
  String get failedToLoadRoom => 'রুম লোড করা যায়নি';

  @override
  String get renterAppBarFallback => 'ভাড়াটিয়া';

  @override
  String get failedToLoadRenter => 'ভাড়াটিয়ার তথ্য লোড করা যায়নি';

  @override
  String get houseAppBarFallback => 'বাসা';

  @override
  String get failedToLoadHouse => 'বাসা লোড করা যায়নি';

  @override
  String meterNumberLine(String number) {
    return 'মিটার $number';
  }

  @override
  String get outstandingLabel => 'বাকি';

  @override
  String ownerChipLabel(String id) {
    return 'মালিক: $id…';
  }

  @override
  String get auditLogTitle => 'অডিট লগ';

  @override
  String get noAuditEntries => 'কোনো অডিট এন্ট্রি নেই';

  @override
  String get failedToLoadAuditLogs => 'অডিট লগ লোড করা যায়নি';

  @override
  String get auditSystemActor => 'সিস্টেম';

  @override
  String get auditDetailsDialogTitle => 'পরিবর্তনের বিবরণ';

  @override
  String get auditNoChangeDetails => 'কোনো পরিবর্তনের বিবরণ পাওয়া যায়নি।';

  @override
  String auditFieldChangeLine(String field, String before, String after) {
    return '$field: $before → $after';
  }
}
