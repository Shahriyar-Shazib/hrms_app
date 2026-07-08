import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'HRMS'**
  String get appTitle;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @assign.
  ///
  /// In en, this message translates to:
  /// **'Assign'**
  String get assign;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @moveOut.
  ///
  /// In en, this message translates to:
  /// **'Move Out'**
  String get moveOut;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// No description provided for @mustBeOnlineToSave.
  ///
  /// In en, this message translates to:
  /// **'You must be online to save.'**
  String get mustBeOnlineToSave;

  /// No description provided for @createdLabel.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get createdLabel;

  /// No description provided for @updatedLabel.
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get updatedLabel;

  /// No description provided for @notesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesLabel;

  /// No description provided for @reasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reasonLabel;

  /// No description provided for @reasonRequired.
  ///
  /// In en, this message translates to:
  /// **'Reason is required'**
  String get reasonRequired;

  /// No description provided for @labelFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get labelFieldLabel;

  /// No description provided for @labelRequired.
  ///
  /// In en, this message translates to:
  /// **'Label is required'**
  String get labelRequired;

  /// No description provided for @amountFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountFieldLabel;

  /// No description provided for @amountRequired.
  ///
  /// In en, this message translates to:
  /// **'Amount is required'**
  String get amountRequired;

  /// No description provided for @amountMustBePositive.
  ///
  /// In en, this message translates to:
  /// **'Amount must be positive'**
  String get amountMustBePositive;

  /// No description provided for @enterValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid number'**
  String get enterValidNumber;

  /// No description provided for @positiveNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Must be a positive number'**
  String get positiveNumberRequired;

  /// No description provided for @nonNegativeNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Must be a non-negative number'**
  String get nonNegativeNumberRequired;

  /// No description provided for @waive.
  ///
  /// In en, this message translates to:
  /// **'Waive'**
  String get waive;

  /// No description provided for @monthName1.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get monthName1;

  /// No description provided for @monthName2.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get monthName2;

  /// No description provided for @monthName3.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get monthName3;

  /// No description provided for @monthName4.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get monthName4;

  /// No description provided for @monthName5.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthName5;

  /// No description provided for @monthName6.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get monthName6;

  /// No description provided for @monthName7.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get monthName7;

  /// No description provided for @monthName8.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get monthName8;

  /// No description provided for @monthName9.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get monthName9;

  /// No description provided for @monthName10.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get monthName10;

  /// No description provided for @monthName11.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get monthName11;

  /// No description provided for @monthName12.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get monthName12;

  /// No description provided for @roleSuperAdmin.
  ///
  /// In en, this message translates to:
  /// **'Super Admin'**
  String get roleSuperAdmin;

  /// No description provided for @roleHouseOwner.
  ///
  /// In en, this message translates to:
  /// **'House Owner'**
  String get roleHouseOwner;

  /// No description provided for @roleManager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get roleManager;

  /// No description provided for @roleUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get roleUnknown;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account'**
  String get loginSubtitle;

  /// No description provided for @loginEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginEmailLabel;

  /// No description provided for @loginEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get loginEmailRequired;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordLabel;

  /// No description provided for @loginPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get loginPasswordRequired;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @homeWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}'**
  String homeWelcome(String name);

  /// No description provided for @homeHousesButton.
  ///
  /// In en, this message translates to:
  /// **'Houses'**
  String get homeHousesButton;

  /// No description provided for @homeManagersButton.
  ///
  /// In en, this message translates to:
  /// **'Managers'**
  String get homeManagersButton;

  /// No description provided for @signOutTooltip.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOutTooltip;

  /// No description provided for @languageSwitchTooltip.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSwitchTooltip;

  /// No description provided for @languageBangla.
  ///
  /// In en, this message translates to:
  /// **'বাংলা'**
  String get languageBangla;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @adminSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get adminSectionTitle;

  /// No description provided for @housesTitle.
  ///
  /// In en, this message translates to:
  /// **'Houses'**
  String get housesTitle;

  /// No description provided for @newHouseTooltip.
  ///
  /// In en, this message translates to:
  /// **'New House'**
  String get newHouseTooltip;

  /// No description provided for @noHousesYet.
  ///
  /// In en, this message translates to:
  /// **'No houses yet'**
  String get noHousesYet;

  /// No description provided for @failedToLoadHouses.
  ///
  /// In en, this message translates to:
  /// **'Failed to load houses'**
  String get failedToLoadHouses;

  /// No description provided for @refreshFailed.
  ///
  /// In en, this message translates to:
  /// **'Refresh failed'**
  String get refreshFailed;

  /// No description provided for @editHouseTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editHouseTooltip;

  /// No description provided for @deleteHouseTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteHouseTooltip;

  /// No description provided for @deleteHouseDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this house?'**
  String get deleteHouseDialogTitle;

  /// No description provided for @deleteHouseDialogBody.
  ///
  /// In en, this message translates to:
  /// **'This cannot be undone.'**
  String get deleteHouseDialogBody;

  /// No description provided for @houseDeleted.
  ///
  /// In en, this message translates to:
  /// **'House deleted'**
  String get houseDeleted;

  /// No description provided for @mustBeOnlineToDelete.
  ///
  /// In en, this message translates to:
  /// **'You must be online to delete.'**
  String get mustBeOnlineToDelete;

  /// No description provided for @houseNotFound.
  ///
  /// In en, this message translates to:
  /// **'House not found'**
  String get houseNotFound;

  /// No description provided for @connectToLoadHouse.
  ///
  /// In en, this message translates to:
  /// **'Connect to the internet to load this house.'**
  String get connectToLoadHouse;

  /// No description provided for @houseFieldName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get houseFieldName;

  /// No description provided for @houseFieldAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get houseFieldAddress;

  /// No description provided for @houseFieldCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get houseFieldCity;

  /// No description provided for @houseFieldTotalFloors.
  ///
  /// In en, this message translates to:
  /// **'Total Floors'**
  String get houseFieldTotalFloors;

  /// No description provided for @roomsButton.
  ///
  /// In en, this message translates to:
  /// **'Rooms'**
  String get roomsButton;

  /// No description provided for @rentersButton.
  ///
  /// In en, this message translates to:
  /// **'Renters'**
  String get rentersButton;

  /// No description provided for @metersButton.
  ///
  /// In en, this message translates to:
  /// **'Meters'**
  String get metersButton;

  /// No description provided for @billConfigButton.
  ///
  /// In en, this message translates to:
  /// **'Bill Configuration'**
  String get billConfigButton;

  /// No description provided for @managersButton.
  ///
  /// In en, this message translates to:
  /// **'Managers'**
  String get managersButton;

  /// No description provided for @expensesButton.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expensesButton;

  /// No description provided for @reportsButton.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reportsButton;

  /// No description provided for @invoicesButton.
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get invoicesButton;

  /// No description provided for @newHouseAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'New House'**
  String get newHouseAppBarTitle;

  /// No description provided for @editHouseAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit House'**
  String get editHouseAppBarTitle;

  /// No description provided for @houseNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Sunrise Apartments'**
  String get houseNameHint;

  /// No description provided for @houseNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get houseNameRequired;

  /// No description provided for @houseAddressHint.
  ///
  /// In en, this message translates to:
  /// **'Street address'**
  String get houseAddressHint;

  /// No description provided for @houseAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Address is required'**
  String get houseAddressRequired;

  /// No description provided for @houseFloorsHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 4'**
  String get houseFloorsHint;

  /// No description provided for @roomsTitle.
  ///
  /// In en, this message translates to:
  /// **'Rooms'**
  String get roomsTitle;

  /// No description provided for @noRoomsYet.
  ///
  /// In en, this message translates to:
  /// **'No rooms yet'**
  String get noRoomsYet;

  /// No description provided for @failedToLoadRooms.
  ///
  /// In en, this message translates to:
  /// **'Failed to load rooms'**
  String get failedToLoadRooms;

  /// No description provided for @roomTileTitle.
  ///
  /// In en, this message translates to:
  /// **'Room {number}'**
  String roomTileTitle(String number);

  /// No description provided for @editRoomTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit room'**
  String get editRoomTooltip;

  /// No description provided for @roomNotFound.
  ///
  /// In en, this message translates to:
  /// **'Room not found'**
  String get roomNotFound;

  /// No description provided for @connectToLoadRoom.
  ///
  /// In en, this message translates to:
  /// **'Connect to the internet to load this room.'**
  String get connectToLoadRoom;

  /// No description provided for @roomFieldRoomNumber.
  ///
  /// In en, this message translates to:
  /// **'Room Number'**
  String get roomFieldRoomNumber;

  /// No description provided for @roomFieldStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get roomFieldStatus;

  /// No description provided for @roomFieldBaseRent.
  ///
  /// In en, this message translates to:
  /// **'Base Rent'**
  String get roomFieldBaseRent;

  /// No description provided for @roomFieldFloor.
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get roomFieldFloor;

  /// No description provided for @roomFieldMeter.
  ///
  /// In en, this message translates to:
  /// **'Meter'**
  String get roomFieldMeter;

  /// No description provided for @meterAttachedYes.
  ///
  /// In en, this message translates to:
  /// **'Attached'**
  String get meterAttachedYes;

  /// No description provided for @meterAttachedNo.
  ///
  /// In en, this message translates to:
  /// **'Not attached'**
  String get meterAttachedNo;

  /// No description provided for @roomFieldMeterNumber.
  ///
  /// In en, this message translates to:
  /// **'Meter Number'**
  String get roomFieldMeterNumber;

  /// No description provided for @currentRenterSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Current Renter'**
  String get currentRenterSectionTitle;

  /// No description provided for @roomFieldName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get roomFieldName;

  /// No description provided for @roomFieldMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get roomFieldMobile;

  /// No description provided for @roomFieldSince.
  ///
  /// In en, this message translates to:
  /// **'Since'**
  String get roomFieldSince;

  /// No description provided for @collectPaymentButton.
  ///
  /// In en, this message translates to:
  /// **'Collect Payment'**
  String get collectPaymentButton;

  /// No description provided for @vacantNoRenter.
  ///
  /// In en, this message translates to:
  /// **'Vacant — no current renter'**
  String get vacantNoRenter;

  /// No description provided for @meterReadingsButton.
  ///
  /// In en, this message translates to:
  /// **'Meter Readings'**
  String get meterReadingsButton;

  /// No description provided for @roomStatusVacant.
  ///
  /// In en, this message translates to:
  /// **'Vacant'**
  String get roomStatusVacant;

  /// No description provided for @roomStatusOccupied.
  ///
  /// In en, this message translates to:
  /// **'Occupied'**
  String get roomStatusOccupied;

  /// No description provided for @newRoomAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'New Room'**
  String get newRoomAppBarTitle;

  /// No description provided for @editRoomAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Room'**
  String get editRoomAppBarTitle;

  /// No description provided for @roomNumberHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 101'**
  String get roomNumberHint;

  /// No description provided for @roomNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Room number is required'**
  String get roomNumberRequired;

  /// No description provided for @baseRentHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 7500'**
  String get baseRentHint;

  /// No description provided for @baseRentRequired.
  ///
  /// In en, this message translates to:
  /// **'Base rent is required'**
  String get baseRentRequired;

  /// No description provided for @floorHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 2 or Ground'**
  String get floorHint;

  /// No description provided for @meterAttachedTitle.
  ///
  /// In en, this message translates to:
  /// **'Meter Attached'**
  String get meterAttachedTitle;

  /// No description provided for @meterPresentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Electricity meter present'**
  String get meterPresentSubtitle;

  /// No description provided for @noMeterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'No meter'**
  String get noMeterSubtitle;

  /// No description provided for @meterNumberHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. MTR-001'**
  String get meterNumberHint;

  /// No description provided for @rentersTitle.
  ///
  /// In en, this message translates to:
  /// **'Renters'**
  String get rentersTitle;

  /// No description provided for @noRentersYet.
  ///
  /// In en, this message translates to:
  /// **'No renters yet'**
  String get noRentersYet;

  /// No description provided for @failedToLoadRenters.
  ///
  /// In en, this message translates to:
  /// **'Failed to load renters'**
  String get failedToLoadRenters;

  /// No description provided for @editRenterTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit renter'**
  String get editRenterTooltip;

  /// No description provided for @renterNotFound.
  ///
  /// In en, this message translates to:
  /// **'Renter not found'**
  String get renterNotFound;

  /// No description provided for @connectToLoadRenter.
  ///
  /// In en, this message translates to:
  /// **'Connect to the internet to load this renter.'**
  String get connectToLoadRenter;

  /// No description provided for @renterFieldAdvance.
  ///
  /// In en, this message translates to:
  /// **'Advance'**
  String get renterFieldAdvance;

  /// No description provided for @currentAssignmentSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Current Assignment'**
  String get currentAssignmentSectionTitle;

  /// No description provided for @renterFieldRoom.
  ///
  /// In en, this message translates to:
  /// **'Room'**
  String get renterFieldRoom;

  /// No description provided for @renterFieldMoveIn.
  ///
  /// In en, this message translates to:
  /// **'Move-in'**
  String get renterFieldMoveIn;

  /// No description provided for @contactIdentitySectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact & Identity'**
  String get contactIdentitySectionTitle;

  /// No description provided for @renterFieldNid.
  ///
  /// In en, this message translates to:
  /// **'NID'**
  String get renterFieldNid;

  /// No description provided for @renterFieldPresentAddress.
  ///
  /// In en, this message translates to:
  /// **'Present Address'**
  String get renterFieldPresentAddress;

  /// No description provided for @renterFieldPermanentAddress.
  ///
  /// In en, this message translates to:
  /// **'Permanent Address'**
  String get renterFieldPermanentAddress;

  /// No description provided for @renterFieldOccupation.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get renterFieldOccupation;

  /// No description provided for @renterFieldOrganization.
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get renterFieldOrganization;

  /// No description provided for @renterFieldEmergencyContact.
  ///
  /// In en, this message translates to:
  /// **'Emergency Contact'**
  String get renterFieldEmergencyContact;

  /// No description provided for @renterFieldEmergencyMobile.
  ///
  /// In en, this message translates to:
  /// **'Emergency Mobile'**
  String get renterFieldEmergencyMobile;

  /// No description provided for @assignToRoomButton.
  ///
  /// In en, this message translates to:
  /// **'Assign to Room'**
  String get assignToRoomButton;

  /// No description provided for @duesButton.
  ///
  /// In en, this message translates to:
  /// **'Dues'**
  String get duesButton;

  /// No description provided for @newRenterAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'New Renter'**
  String get newRenterAppBarTitle;

  /// No description provided for @editRenterAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Renter'**
  String get editRenterAppBarTitle;

  /// No description provided for @sectionBasic.
  ///
  /// In en, this message translates to:
  /// **'Basic'**
  String get sectionBasic;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullNameLabel;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Rahim Uddin'**
  String get fullNameHint;

  /// No description provided for @fullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name is required'**
  String get fullNameRequired;

  /// No description provided for @mobileLabel.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get mobileLabel;

  /// No description provided for @mobileHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 01711-000000'**
  String get mobileHint;

  /// No description provided for @mobileRequired.
  ///
  /// In en, this message translates to:
  /// **'Mobile is required'**
  String get mobileRequired;

  /// No description provided for @sectionIdentity.
  ///
  /// In en, this message translates to:
  /// **'Identity'**
  String get sectionIdentity;

  /// No description provided for @nidNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'NID Number'**
  String get nidNumberLabel;

  /// No description provided for @nidNumberHint.
  ///
  /// In en, this message translates to:
  /// **'National ID number'**
  String get nidNumberHint;

  /// No description provided for @sectionAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get sectionAddress;

  /// No description provided for @presentAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Present Address'**
  String get presentAddressLabel;

  /// No description provided for @permanentAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Permanent Address'**
  String get permanentAddressLabel;

  /// No description provided for @sectionWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get sectionWork;

  /// No description provided for @occupationLabel.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get occupationLabel;

  /// No description provided for @occupationHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Teacher'**
  String get occupationHint;

  /// No description provided for @organizationLabel.
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get organizationLabel;

  /// No description provided for @organizationHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. City College'**
  String get organizationHint;

  /// No description provided for @sectionEmergencyContact.
  ///
  /// In en, this message translates to:
  /// **'Emergency Contact'**
  String get sectionEmergencyContact;

  /// No description provided for @contactNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact Name'**
  String get contactNameLabel;

  /// No description provided for @contactNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Karim Uddin'**
  String get contactNameHint;

  /// No description provided for @contactMobileLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact Mobile'**
  String get contactMobileLabel;

  /// No description provided for @contactMobileHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 01711-000001'**
  String get contactMobileHint;

  /// No description provided for @sectionFinancial.
  ///
  /// In en, this message translates to:
  /// **'Financial'**
  String get sectionFinancial;

  /// No description provided for @advanceAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Advance Amount'**
  String get advanceAmountLabel;

  /// No description provided for @advanceAmountHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 5000'**
  String get advanceAmountHint;

  /// No description provided for @assignDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Assign to Room'**
  String get assignDialogTitle;

  /// No description provided for @noVacantRooms.
  ///
  /// In en, this message translates to:
  /// **'No vacant rooms available.'**
  String get noVacantRooms;

  /// No description provided for @vacantRoomLabel.
  ///
  /// In en, this message translates to:
  /// **'Vacant Room'**
  String get vacantRoomLabel;

  /// No description provided for @selectARoom.
  ///
  /// In en, this message translates to:
  /// **'Select a room'**
  String get selectARoom;

  /// No description provided for @moveInDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Move-in Date'**
  String get moveInDateLabel;

  /// No description provided for @openingMeterReadingLabel.
  ///
  /// In en, this message translates to:
  /// **'Opening Meter Reading'**
  String get openingMeterReadingLabel;

  /// No description provided for @openingMeterReadingHint.
  ///
  /// In en, this message translates to:
  /// **'kWh at move-in (recommended)'**
  String get openingMeterReadingHint;

  /// No description provided for @assignedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Assigned successfully'**
  String get assignedSuccess;

  /// No description provided for @transferDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Transfer to Room'**
  String get transferDialogTitle;

  /// No description provided for @noOtherVacantRooms.
  ///
  /// In en, this message translates to:
  /// **'No other vacant rooms available.'**
  String get noOtherVacantRooms;

  /// No description provided for @transferToRoomLabel.
  ///
  /// In en, this message translates to:
  /// **'Transfer to Room'**
  String get transferToRoomLabel;

  /// No description provided for @transferDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Transfer Date'**
  String get transferDateLabel;

  /// No description provided for @transferredSuccess.
  ///
  /// In en, this message translates to:
  /// **'Transferred successfully'**
  String get transferredSuccess;

  /// No description provided for @moveOutDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Move Out'**
  String get moveOutDialogTitle;

  /// No description provided for @moveOutDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Move-out Date'**
  String get moveOutDateLabel;

  /// No description provided for @selectAReason.
  ///
  /// In en, this message translates to:
  /// **'Select a reason'**
  String get selectAReason;

  /// No description provided for @movedOutSuccess.
  ///
  /// In en, this message translates to:
  /// **'Moved out successfully'**
  String get movedOutSuccess;

  /// No description provided for @moveOutReasonMovedOut.
  ///
  /// In en, this message translates to:
  /// **'Moved Out'**
  String get moveOutReasonMovedOut;

  /// No description provided for @moveOutReasonEvicted.
  ///
  /// In en, this message translates to:
  /// **'Evicted'**
  String get moveOutReasonEvicted;

  /// No description provided for @billConfigTitle.
  ///
  /// In en, this message translates to:
  /// **'Bill Configuration'**
  String get billConfigTitle;

  /// No description provided for @addBillHeadTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add Bill Head'**
  String get addBillHeadTooltip;

  /// No description provided for @failedToLoadBillConfig.
  ///
  /// In en, this message translates to:
  /// **'Failed to load bill config'**
  String get failedToLoadBillConfig;

  /// No description provided for @noBillHeadsConfigured.
  ///
  /// In en, this message translates to:
  /// **'No bill heads configured.'**
  String get noBillHeadsConfigured;

  /// No description provided for @billHeadServiceCharge.
  ///
  /// In en, this message translates to:
  /// **'Service Charge'**
  String get billHeadServiceCharge;

  /// No description provided for @billHeadWasteBill.
  ///
  /// In en, this message translates to:
  /// **'Waste Bill'**
  String get billHeadWasteBill;

  /// No description provided for @billHeadElectricityRate.
  ///
  /// In en, this message translates to:
  /// **'Electricity Rate (per unit)'**
  String get billHeadElectricityRate;

  /// No description provided for @billHeadElectricityRateShort.
  ///
  /// In en, this message translates to:
  /// **'Electricity Rate'**
  String get billHeadElectricityRateShort;

  /// No description provided for @billHeadCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get billHeadCustom;

  /// No description provided for @billConfigSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{headLabel} · effective {date}'**
  String billConfigSubtitle(String headLabel, String date);

  /// No description provided for @addBillHeadAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Bill Head'**
  String get addBillHeadAppBarTitle;

  /// No description provided for @updateBillHeadAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Bill Head'**
  String get updateBillHeadAppBarTitle;

  /// No description provided for @billHeadFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Head'**
  String get billHeadFieldLabel;

  /// No description provided for @pleaseSelectAHead.
  ///
  /// In en, this message translates to:
  /// **'Please select a head'**
  String get pleaseSelectAHead;

  /// No description provided for @perUnitSuffix.
  ///
  /// In en, this message translates to:
  /// **'per unit'**
  String get perUnitSuffix;

  /// No description provided for @effectiveFromFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Effective From'**
  String get effectiveFromFieldLabel;

  /// No description provided for @billHeadUpdated.
  ///
  /// In en, this message translates to:
  /// **'Bill head updated'**
  String get billHeadUpdated;

  /// No description provided for @billHeadAdded.
  ///
  /// In en, this message translates to:
  /// **'Bill head added'**
  String get billHeadAdded;

  /// No description provided for @metersTitle.
  ///
  /// In en, this message translates to:
  /// **'Meters'**
  String get metersTitle;

  /// No description provided for @failedToLoadMeters.
  ///
  /// In en, this message translates to:
  /// **'Failed to load meters'**
  String get failedToLoadMeters;

  /// No description provided for @noMeteredRooms.
  ///
  /// In en, this message translates to:
  /// **'No metered rooms in this house.'**
  String get noMeteredRooms;

  /// No description provided for @meterReadingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Meter Readings'**
  String get meterReadingsTitle;

  /// No description provided for @failedToLoadReadings.
  ///
  /// In en, this message translates to:
  /// **'Failed to load readings'**
  String get failedToLoadReadings;

  /// No description provided for @noReadingsYet.
  ///
  /// In en, this message translates to:
  /// **'No readings yet.'**
  String get noReadingsYet;

  /// No description provided for @adjustTooltip.
  ///
  /// In en, this message translates to:
  /// **'Adjust'**
  String get adjustTooltip;

  /// No description provided for @adjustmentChipLabel.
  ///
  /// In en, this message translates to:
  /// **'ADJUSTMENT'**
  String get adjustmentChipLabel;

  /// No description provided for @unitsConsumedLine.
  ///
  /// In en, this message translates to:
  /// **'{units} units · {current} kWh (prev {previous})'**
  String unitsConsumedLine(String units, String current, String previous);

  /// No description provided for @rateLine.
  ///
  /// In en, this message translates to:
  /// **'@ ৳{rate}/unit · {date}'**
  String rateLine(String rate, String date);

  /// No description provided for @addMeterReadingAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Meter Reading'**
  String get addMeterReadingAppBarTitle;

  /// No description provided for @currentReadingLabel.
  ///
  /// In en, this message translates to:
  /// **'Current Reading (kWh)'**
  String get currentReadingLabel;

  /// No description provided for @currentReadingHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 1640'**
  String get currentReadingHint;

  /// No description provided for @currentReadingRequired.
  ///
  /// In en, this message translates to:
  /// **'Current reading is required'**
  String get currentReadingRequired;

  /// No description provided for @previousReadingLabel.
  ///
  /// In en, this message translates to:
  /// **'Previous Reading (kWh)'**
  String get previousReadingLabel;

  /// No description provided for @previousReadingHint.
  ///
  /// In en, this message translates to:
  /// **'Starting meter reading (required for first entry)'**
  String get previousReadingHint;

  /// No description provided for @previousReadingRequiredFirst.
  ///
  /// In en, this message translates to:
  /// **'Required for the first reading'**
  String get previousReadingRequiredFirst;

  /// No description provided for @readingDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Reading Date'**
  String get readingDateLabel;

  /// No description provided for @billingPeriodSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Billing Period'**
  String get billingPeriodSectionTitle;

  /// No description provided for @monthFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get monthFieldLabel;

  /// No description provided for @yearFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get yearFieldLabel;

  /// No description provided for @saveReadingButton.
  ///
  /// In en, this message translates to:
  /// **'Save Reading'**
  String get saveReadingButton;

  /// No description provided for @readingSaved.
  ///
  /// In en, this message translates to:
  /// **'Reading saved'**
  String get readingSaved;

  /// No description provided for @adjustReadingAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Adjust Reading'**
  String get adjustReadingAppBarTitle;

  /// No description provided for @correctingReadingFor.
  ///
  /// In en, this message translates to:
  /// **'Correcting reading for'**
  String get correctingReadingFor;

  /// No description provided for @currentReadingLine.
  ///
  /// In en, this message translates to:
  /// **'Current reading: {current} kWh · @ ৳{rate}/unit'**
  String currentReadingLine(String current, String rate);

  /// No description provided for @correctedReadingLabel.
  ///
  /// In en, this message translates to:
  /// **'Corrected Reading (kWh)'**
  String get correctedReadingLabel;

  /// No description provided for @correctedReadingHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 1645'**
  String get correctedReadingHint;

  /// No description provided for @correctedReadingRequired.
  ///
  /// In en, this message translates to:
  /// **'Corrected reading is required'**
  String get correctedReadingRequired;

  /// No description provided for @rateOverrideLabel.
  ///
  /// In en, this message translates to:
  /// **'Rate Override (per unit)'**
  String get rateOverrideLabel;

  /// No description provided for @rateOverrideHint.
  ///
  /// In en, this message translates to:
  /// **'Leave blank to use configured rate'**
  String get rateOverrideHint;

  /// No description provided for @rateOverrideHelper.
  ///
  /// In en, this message translates to:
  /// **'Optional — overrides the rate for this adjustment only'**
  String get rateOverrideHelper;

  /// No description provided for @saveAdjustmentButton.
  ///
  /// In en, this message translates to:
  /// **'Save Adjustment'**
  String get saveAdjustmentButton;

  /// No description provided for @adjustmentSaved.
  ///
  /// In en, this message translates to:
  /// **'Adjustment saved'**
  String get adjustmentSaved;

  /// No description provided for @managersTitle.
  ///
  /// In en, this message translates to:
  /// **'Managers'**
  String get managersTitle;

  /// No description provided for @newManagerTooltip.
  ///
  /// In en, this message translates to:
  /// **'New Manager'**
  String get newManagerTooltip;

  /// No description provided for @failedToLoadManagers.
  ///
  /// In en, this message translates to:
  /// **'Failed to load managers'**
  String get failedToLoadManagers;

  /// No description provided for @noManagersYet.
  ///
  /// In en, this message translates to:
  /// **'No managers yet.'**
  String get noManagersYet;

  /// No description provided for @newManagerAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'New Manager'**
  String get newManagerAppBarTitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get emailInvalid;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordTooShort;

  /// No description provided for @managerCreated.
  ///
  /// In en, this message translates to:
  /// **'Manager created'**
  String get managerCreated;

  /// No description provided for @assignManagerTooltip.
  ///
  /// In en, this message translates to:
  /// **'Assign Manager'**
  String get assignManagerTooltip;

  /// No description provided for @noManagersAssigned.
  ///
  /// In en, this message translates to:
  /// **'No managers assigned to this house.'**
  String get noManagersAssigned;

  /// No description provided for @expensesSwitchLabel.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expensesSwitchLabel;

  /// No description provided for @removeManagerTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get removeManagerTooltip;

  /// No description provided for @removeManagerDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove manager?'**
  String get removeManagerDialogTitle;

  /// No description provided for @removeManagerDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Revoke {name}\'s access to this house.'**
  String removeManagerDialogBody(String name);

  /// No description provided for @managerFallbackName.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get managerFallbackName;

  /// No description provided for @managerRemoved.
  ///
  /// In en, this message translates to:
  /// **'Manager removed'**
  String get managerRemoved;

  /// No description provided for @noManagersYetDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'No managers yet'**
  String get noManagersYetDialogTitle;

  /// No description provided for @noManagersYetDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Create a manager first, then assign them to this house.'**
  String get noManagersYetDialogBody;

  /// No description provided for @createManagerButton.
  ///
  /// In en, this message translates to:
  /// **'Create Manager'**
  String get createManagerButton;

  /// No description provided for @allManagersAssignedBody.
  ///
  /// In en, this message translates to:
  /// **'All of your managers are already assigned to this house.'**
  String get allManagersAssignedBody;

  /// No description provided for @managerDropdownLabel.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get managerDropdownLabel;

  /// No description provided for @canLogExpensesLabel.
  ///
  /// In en, this message translates to:
  /// **'Can log expenses'**
  String get canLogExpensesLabel;

  /// No description provided for @expensesTitle.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expensesTitle;

  /// No description provided for @addExpenseTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add Expense'**
  String get addExpenseTooltip;

  /// No description provided for @failedToLoadExpenses.
  ///
  /// In en, this message translates to:
  /// **'Failed to load expenses'**
  String get failedToLoadExpenses;

  /// No description provided for @noExpensesThisMonth.
  ///
  /// In en, this message translates to:
  /// **'No expenses for this month.'**
  String get noExpensesThisMonth;

  /// No description provided for @monthTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Month Total'**
  String get monthTotalLabel;

  /// No description provided for @deleteExpenseTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteExpenseTooltip;

  /// No description provided for @deleteExpenseDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this expense?'**
  String get deleteExpenseDialogTitle;

  /// No description provided for @deleteExpenseDialogBody.
  ///
  /// In en, this message translates to:
  /// **'{label} — ৳{amount}'**
  String deleteExpenseDialogBody(String label, String amount);

  /// No description provided for @expenseDeleted.
  ///
  /// In en, this message translates to:
  /// **'Expense deleted'**
  String get expenseDeleted;

  /// No description provided for @paidToLine.
  ///
  /// In en, this message translates to:
  /// **'Paid to {name}'**
  String paidToLine(String name);

  /// No description provided for @categoryRepair.
  ///
  /// In en, this message translates to:
  /// **'Repair'**
  String get categoryRepair;

  /// No description provided for @categoryMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Maintenance'**
  String get categoryMaintenance;

  /// No description provided for @categoryStaffSalary.
  ///
  /// In en, this message translates to:
  /// **'Staff Salary'**
  String get categoryStaffSalary;

  /// No description provided for @categoryUtilityBill.
  ///
  /// In en, this message translates to:
  /// **'Utility Bill'**
  String get categoryUtilityBill;

  /// No description provided for @categoryCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get categoryCustom;

  /// No description provided for @addExpenseAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Expense'**
  String get addExpenseAppBarTitle;

  /// No description provided for @editExpenseAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Expense'**
  String get editExpenseAppBarTitle;

  /// No description provided for @categoryFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryFieldLabel;

  /// No description provided for @categoryRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a category'**
  String get categoryRequired;

  /// No description provided for @expenseDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Expense Date'**
  String get expenseDateLabel;

  /// No description provided for @paidToLabel.
  ///
  /// In en, this message translates to:
  /// **'Paid To'**
  String get paidToLabel;

  /// No description provided for @expenseUpdated.
  ///
  /// In en, this message translates to:
  /// **'Expense updated'**
  String get expenseUpdated;

  /// No description provided for @expenseAdded.
  ///
  /// In en, this message translates to:
  /// **'Expense added'**
  String get expenseAdded;

  /// No description provided for @duesTitle.
  ///
  /// In en, this message translates to:
  /// **'Dues'**
  String get duesTitle;

  /// No description provided for @addDueTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add Due'**
  String get addDueTooltip;

  /// No description provided for @failedToLoadDues.
  ///
  /// In en, this message translates to:
  /// **'Failed to load dues'**
  String get failedToLoadDues;

  /// No description provided for @noDuesForRenter.
  ///
  /// In en, this message translates to:
  /// **'No dues for this renter.'**
  String get noDuesForRenter;

  /// No description provided for @manualTag.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get manualTag;

  /// No description provided for @waivedLine.
  ///
  /// In en, this message translates to:
  /// **'Waived: {reason}'**
  String waivedLine(String reason);

  /// No description provided for @waiveTooltip.
  ///
  /// In en, this message translates to:
  /// **'Waive'**
  String get waiveTooltip;

  /// No description provided for @dueWaived.
  ///
  /// In en, this message translates to:
  /// **'Due waived'**
  String get dueWaived;

  /// No description provided for @dueStatusOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get dueStatusOpen;

  /// No description provided for @dueStatusPartial.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get dueStatusPartial;

  /// No description provided for @dueStatusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get dueStatusPaid;

  /// No description provided for @dueStatusWaived.
  ///
  /// In en, this message translates to:
  /// **'Waived'**
  String get dueStatusWaived;

  /// No description provided for @addDueAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Due'**
  String get addDueAppBarTitle;

  /// No description provided for @dueHeadElectricity.
  ///
  /// In en, this message translates to:
  /// **'Electricity'**
  String get dueHeadElectricity;

  /// No description provided for @dueHeadRent.
  ///
  /// In en, this message translates to:
  /// **'Rent'**
  String get dueHeadRent;

  /// No description provided for @dueOfAmount.
  ///
  /// In en, this message translates to:
  /// **'{outstanding} of {amount}'**
  String dueOfAmount(String outstanding, String amount);

  /// No description provided for @dueDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Due Date'**
  String get dueDateLabel;

  /// No description provided for @dueAdded.
  ///
  /// In en, this message translates to:
  /// **'Due added'**
  String get dueAdded;

  /// No description provided for @waiveDueDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Waive this due?'**
  String get waiveDueDialogTitle;

  /// No description provided for @waiveDueDialogBody.
  ///
  /// In en, this message translates to:
  /// **'{headLabel} — ৳{outstanding} outstanding. This cannot be undone.'**
  String waiveDueDialogBody(String headLabel, String outstanding);

  /// No description provided for @invoicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get invoicesTitle;

  /// No description provided for @generateButton.
  ///
  /// In en, this message translates to:
  /// **'Generate'**
  String get generateButton;

  /// No description provided for @noInvoicesThisMonth.
  ///
  /// In en, this message translates to:
  /// **'No invoices for this month.'**
  String get noInvoicesThisMonth;

  /// No description provided for @tapGenerateHint.
  ///
  /// In en, this message translates to:
  /// **'Tap Generate to create invoices for this month.'**
  String get tapGenerateHint;

  /// No description provided for @failedToLoadInvoices.
  ///
  /// In en, this message translates to:
  /// **'Failed to load invoices'**
  String get failedToLoadInvoices;

  /// No description provided for @invoiceAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Invoice'**
  String get invoiceAppBarTitle;

  /// No description provided for @failedToLoadInvoice.
  ///
  /// In en, this message translates to:
  /// **'Failed to load invoice'**
  String get failedToLoadInvoice;

  /// No description provided for @invoiceFieldRenter.
  ///
  /// In en, this message translates to:
  /// **'Renter'**
  String get invoiceFieldRenter;

  /// No description provided for @invoiceFieldRoom.
  ///
  /// In en, this message translates to:
  /// **'Room'**
  String get invoiceFieldRoom;

  /// No description provided for @invoiceFieldDueDate.
  ///
  /// In en, this message translates to:
  /// **'Due Date'**
  String get invoiceFieldDueDate;

  /// No description provided for @invoiceFieldIssued.
  ///
  /// In en, this message translates to:
  /// **'Issued'**
  String get invoiceFieldIssued;

  /// No description provided for @lineItemsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Line Items'**
  String get lineItemsSectionTitle;

  /// No description provided for @invoiceFieldTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get invoiceFieldTotal;

  /// No description provided for @invoiceFieldPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get invoiceFieldPaid;

  /// No description provided for @invoiceStatusUnpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get invoiceStatusUnpaid;

  /// No description provided for @invoiceStatusPartial.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get invoiceStatusPartial;

  /// No description provided for @invoiceStatusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get invoiceStatusPaid;

  /// No description provided for @invoiceStatusClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get invoiceStatusClosed;

  /// No description provided for @generateInvoicesDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Generate Invoices'**
  String get generateInvoicesDialogTitle;

  /// No description provided for @billHeadsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Bill Heads'**
  String get billHeadsSectionTitle;

  /// No description provided for @selectAtLeastOneBillHead.
  ///
  /// In en, this message translates to:
  /// **'Select at least one bill head (or all for everything)'**
  String get selectAtLeastOneBillHead;

  /// No description provided for @includeElectricityLabel.
  ///
  /// In en, this message translates to:
  /// **'Include Electricity'**
  String get includeElectricityLabel;

  /// No description provided for @generateWarningBody.
  ///
  /// In en, this message translates to:
  /// **'This will create invoices for all occupied rooms and close prior unpaid invoices into dues. This cannot be undone.'**
  String get generateWarningBody;

  /// No description provided for @alreadyGeneratedTitle.
  ///
  /// In en, this message translates to:
  /// **'Already Generated'**
  String get alreadyGeneratedTitle;

  /// No description provided for @invoicesGeneratedTitle.
  ///
  /// In en, this message translates to:
  /// **'Invoices Generated'**
  String get invoicesGeneratedTitle;

  /// No description provided for @alreadyGeneratedBody.
  ///
  /// In en, this message translates to:
  /// **'Invoices for this month already exist. Nothing new was created.'**
  String get alreadyGeneratedBody;

  /// No description provided for @invoicesCreatedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} invoice(s) created.'**
  String invoicesCreatedCount(int count);

  /// No description provided for @invoicesClosedLine.
  ///
  /// In en, this message translates to:
  /// **'{closedCount} prior invoice(s) closed → {duesCount} due(s) created.'**
  String invoicesClosedLine(int closedCount, int duesCount);

  /// No description provided for @skippedRoomsTitle.
  ///
  /// In en, this message translates to:
  /// **'Skipped Rooms'**
  String get skippedRoomsTitle;

  /// No description provided for @skippedRoomFallback.
  ///
  /// In en, this message translates to:
  /// **'Room'**
  String get skippedRoomFallback;

  /// No description provided for @skippedReasonFallback.
  ///
  /// In en, this message translates to:
  /// **'unknown reason'**
  String get skippedReasonFallback;

  /// No description provided for @warningsTitle.
  ///
  /// In en, this message translates to:
  /// **'Warnings'**
  String get warningsTitle;

  /// No description provided for @warningElectricityMissing.
  ///
  /// In en, this message translates to:
  /// **'electricity reading missing'**
  String get warningElectricityMissing;

  /// No description provided for @warningRoomLine.
  ///
  /// In en, this message translates to:
  /// **'Room {roomNumber}: {reason}'**
  String warningRoomLine(String roomNumber, String reason);

  /// No description provided for @reportsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reportsTitle;

  /// No description provided for @occupancySectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Occupancy'**
  String get occupancySectionTitle;

  /// No description provided for @pnlSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'P&L'**
  String get pnlSectionTitle;

  /// No description provided for @duesAgingSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Dues Aging'**
  String get duesAgingSectionTitle;

  /// No description provided for @failedToLoadOccupancy.
  ///
  /// In en, this message translates to:
  /// **'Failed to load occupancy'**
  String get failedToLoadOccupancy;

  /// No description provided for @occupiedPercent.
  ///
  /// In en, this message translates to:
  /// **'{rate}% occupied'**
  String occupiedPercent(String rate);

  /// No description provided for @totalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalLabel;

  /// No description provided for @occupiedLabel.
  ///
  /// In en, this message translates to:
  /// **'Occupied'**
  String get occupiedLabel;

  /// No description provided for @vacantLabel.
  ///
  /// In en, this message translates to:
  /// **'Vacant'**
  String get vacantLabel;

  /// No description provided for @failedToLoadPnl.
  ///
  /// In en, this message translates to:
  /// **'Failed to load P&L'**
  String get failedToLoadPnl;

  /// No description provided for @billedSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Billed'**
  String get billedSectionTitle;

  /// No description provided for @rentLabel.
  ///
  /// In en, this message translates to:
  /// **'Rent'**
  String get rentLabel;

  /// No description provided for @electricityLabel.
  ///
  /// In en, this message translates to:
  /// **'Electricity'**
  String get electricityLabel;

  /// No description provided for @billsLabel.
  ///
  /// In en, this message translates to:
  /// **'Bills'**
  String get billsLabel;

  /// No description provided for @manualDuesLabel.
  ///
  /// In en, this message translates to:
  /// **'Manual Dues'**
  String get manualDuesLabel;

  /// No description provided for @collectedSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Collected'**
  String get collectedSectionTitle;

  /// No description provided for @expensesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expensesSectionTitle;

  /// No description provided for @netBilledLabel.
  ///
  /// In en, this message translates to:
  /// **'Net (billed)'**
  String get netBilledLabel;

  /// No description provided for @netCollectedLabel.
  ///
  /// In en, this message translates to:
  /// **'Net (collected)'**
  String get netCollectedLabel;

  /// No description provided for @collectionGapLabel.
  ///
  /// In en, this message translates to:
  /// **'Collection Gap'**
  String get collectionGapLabel;

  /// No description provided for @failedToLoadDuesAging.
  ///
  /// In en, this message translates to:
  /// **'Failed to load dues aging'**
  String get failedToLoadDuesAging;

  /// No description provided for @bucket0_30.
  ///
  /// In en, this message translates to:
  /// **'0–30 days'**
  String get bucket0_30;

  /// No description provided for @bucket31_60.
  ///
  /// In en, this message translates to:
  /// **'31–60 days'**
  String get bucket31_60;

  /// No description provided for @bucket61_90.
  ///
  /// In en, this message translates to:
  /// **'61–90 days'**
  String get bucket61_90;

  /// No description provided for @bucket90Plus.
  ///
  /// In en, this message translates to:
  /// **'90+ days'**
  String get bucket90Plus;

  /// No description provided for @totalOutstandingLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Outstanding'**
  String get totalOutstandingLabel;

  /// No description provided for @mustBeOnlineToCollect.
  ///
  /// In en, this message translates to:
  /// **'You must be online to collect payments.'**
  String get mustBeOnlineToCollect;

  /// No description provided for @unexpectedErrorRetry.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get unexpectedErrorRetry;

  /// No description provided for @paymentDetailsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment Details'**
  String get paymentDetailsSectionTitle;

  /// No description provided for @amountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountLabel;

  /// No description provided for @outstandingHelper.
  ///
  /// In en, this message translates to:
  /// **'Outstanding: ৳{amount}'**
  String outstandingHelper(String amount);

  /// No description provided for @enterAnAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter an amount'**
  String get enterAnAmount;

  /// No description provided for @amountMustBeGreaterThanZero.
  ///
  /// In en, this message translates to:
  /// **'Amount must be greater than 0'**
  String get amountMustBeGreaterThanZero;

  /// No description provided for @enterValidAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid amount (e.g. 1500.00)'**
  String get enterValidAmount;

  /// No description provided for @paymentMethodLabel.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethodLabel;

  /// No description provided for @paymentMethodCash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get paymentMethodCash;

  /// No description provided for @paymentMethodBank.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get paymentMethodBank;

  /// No description provided for @paymentMethodMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get paymentMethodMobile;

  /// No description provided for @referenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Reference (optional)'**
  String get referenceLabel;

  /// No description provided for @referenceHint.
  ///
  /// In en, this message translates to:
  /// **'Cheque no., transaction ID…'**
  String get referenceHint;

  /// No description provided for @notesOptionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get notesOptionalLabel;

  /// No description provided for @collectButton.
  ///
  /// In en, this message translates to:
  /// **'Collect'**
  String get collectButton;

  /// No description provided for @invoiceTitleLine.
  ///
  /// In en, this message translates to:
  /// **'{month} {year} Invoice'**
  String invoiceTitleLine(String month, int year);

  /// No description provided for @outstandingDuesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Outstanding Dues'**
  String get outstandingDuesSectionTitle;

  /// No description provided for @paymentReceivedTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment Received'**
  String get paymentReceivedTitle;

  /// No description provided for @paymentViaLine.
  ///
  /// In en, this message translates to:
  /// **'৳{amount} via {method}'**
  String paymentViaLine(String amount, String method);

  /// No description provided for @appliedToSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Applied to'**
  String get appliedToSectionTitle;

  /// No description provided for @newOutstandingLabel.
  ///
  /// In en, this message translates to:
  /// **'New Outstanding'**
  String get newOutstandingLabel;

  /// No description provided for @appliedAmountToInvoice.
  ///
  /// In en, this message translates to:
  /// **'৳{amount} → {month} {year} Invoice'**
  String appliedAmountToInvoice(String amount, String month, int year);

  /// No description provided for @appliedAmountToDue.
  ///
  /// In en, this message translates to:
  /// **'৳{amount} → {label}'**
  String appliedAmountToDue(String amount, String label);

  /// No description provided for @appliedAmountToOther.
  ///
  /// In en, this message translates to:
  /// **'৳{amount} → {targetType}'**
  String appliedAmountToOther(String amount, String targetType);

  /// No description provided for @dueFallback.
  ///
  /// In en, this message translates to:
  /// **'Due'**
  String get dueFallback;

  /// No description provided for @roomAppBarFallback.
  ///
  /// In en, this message translates to:
  /// **'Room'**
  String get roomAppBarFallback;

  /// No description provided for @failedToLoadRoom.
  ///
  /// In en, this message translates to:
  /// **'Failed to load room'**
  String get failedToLoadRoom;

  /// No description provided for @renterAppBarFallback.
  ///
  /// In en, this message translates to:
  /// **'Renter'**
  String get renterAppBarFallback;

  /// No description provided for @failedToLoadRenter.
  ///
  /// In en, this message translates to:
  /// **'Failed to load renter'**
  String get failedToLoadRenter;

  /// No description provided for @houseAppBarFallback.
  ///
  /// In en, this message translates to:
  /// **'House'**
  String get houseAppBarFallback;

  /// No description provided for @failedToLoadHouse.
  ///
  /// In en, this message translates to:
  /// **'Failed to load house'**
  String get failedToLoadHouse;

  /// No description provided for @meterNumberLine.
  ///
  /// In en, this message translates to:
  /// **'Meter {number}'**
  String meterNumberLine(String number);

  /// No description provided for @outstandingLabel.
  ///
  /// In en, this message translates to:
  /// **'Outstanding'**
  String get outstandingLabel;

  /// No description provided for @ownerChipLabel.
  ///
  /// In en, this message translates to:
  /// **'Owner: {id}…'**
  String ownerChipLabel(String id);

  /// No description provided for @auditLogTitle.
  ///
  /// In en, this message translates to:
  /// **'Audit Log'**
  String get auditLogTitle;

  /// No description provided for @noAuditEntries.
  ///
  /// In en, this message translates to:
  /// **'No audit entries'**
  String get noAuditEntries;

  /// No description provided for @failedToLoadAuditLogs.
  ///
  /// In en, this message translates to:
  /// **'Failed to load audit logs'**
  String get failedToLoadAuditLogs;

  /// No description provided for @auditSystemActor.
  ///
  /// In en, this message translates to:
  /// **'system'**
  String get auditSystemActor;

  /// No description provided for @auditDetailsDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Details'**
  String get auditDetailsDialogTitle;

  /// No description provided for @auditNoChangeDetails.
  ///
  /// In en, this message translates to:
  /// **'No change details recorded.'**
  String get auditNoChangeDetails;

  /// No description provided for @auditFieldChangeLine.
  ///
  /// In en, this message translates to:
  /// **'{field}: {before} → {after}'**
  String auditFieldChangeLine(String field, String before, String after);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
