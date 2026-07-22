// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'HRMS';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get retry => 'Retry';

  @override
  String get done => 'Done';

  @override
  String get close => 'Close';

  @override
  String get add => 'Add';

  @override
  String get assign => 'Assign';

  @override
  String get remove => 'Remove';

  @override
  String get transfer => 'Transfer';

  @override
  String get moveOut => 'Move Out';

  @override
  String get saved => 'Saved';

  @override
  String get mustBeOnlineToSave => 'You must be online to save.';

  @override
  String get createdLabel => 'Created';

  @override
  String get updatedLabel => 'Updated';

  @override
  String get notesLabel => 'Notes';

  @override
  String get reasonLabel => 'Reason';

  @override
  String get reasonRequired => 'Reason is required';

  @override
  String get labelFieldLabel => 'Label';

  @override
  String get labelRequired => 'Label is required';

  @override
  String get amountFieldLabel => 'Amount';

  @override
  String get amountRequired => 'Amount is required';

  @override
  String get amountMustBePositive => 'Amount must be positive';

  @override
  String get enterValidNumber => 'Enter a valid number';

  @override
  String get positiveNumberRequired => 'Must be a positive number';

  @override
  String get nonNegativeNumberRequired => 'Must be a non-negative number';

  @override
  String get waive => 'Waive';

  @override
  String get monthName1 => 'January';

  @override
  String get monthName2 => 'February';

  @override
  String get monthName3 => 'March';

  @override
  String get monthName4 => 'April';

  @override
  String get monthName5 => 'May';

  @override
  String get monthName6 => 'June';

  @override
  String get monthName7 => 'July';

  @override
  String get monthName8 => 'August';

  @override
  String get monthName9 => 'September';

  @override
  String get monthName10 => 'October';

  @override
  String get monthName11 => 'November';

  @override
  String get monthName12 => 'December';

  @override
  String get roleSuperAdmin => 'Super Admin';

  @override
  String get roleHouseOwner => 'House Owner';

  @override
  String get roleManager => 'Manager';

  @override
  String get roleUnknown => 'Unknown';

  @override
  String get loginSubtitle => 'Sign in to your account';

  @override
  String get loginEmailLabel => 'Email';

  @override
  String get loginEmailRequired => 'Enter your email';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginPasswordRequired => 'Enter your password';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get signIn => 'Sign In';

  @override
  String homeWelcome(String name) {
    return 'Welcome, $name';
  }

  @override
  String get homeHousesButton => 'Houses';

  @override
  String get homeManagersButton => 'Managers';

  @override
  String get signOutTooltip => 'Sign out';

  @override
  String get languageSwitchTooltip => 'Language';

  @override
  String get languageBangla => 'বাংলা';

  @override
  String get languageEnglish => 'English';

  @override
  String get adminSectionTitle => 'Admin';

  @override
  String get housesTitle => 'Houses';

  @override
  String get newHouseTooltip => 'New House';

  @override
  String get noHousesYet => 'No houses yet';

  @override
  String get failedToLoadHouses => 'Failed to load houses';

  @override
  String get refreshFailed => 'Refresh failed';

  @override
  String get editHouseTooltip => 'Edit';

  @override
  String get deleteHouseTooltip => 'Delete';

  @override
  String get deleteHouseDialogTitle => 'Delete this house?';

  @override
  String get deleteHouseDialogBody => 'This cannot be undone.';

  @override
  String get houseDeleted => 'House deleted';

  @override
  String get mustBeOnlineToDelete => 'You must be online to delete.';

  @override
  String get houseNotFound => 'House not found';

  @override
  String get connectToLoadHouse =>
      'Connect to the internet to load this house.';

  @override
  String get houseFieldName => 'Name';

  @override
  String get houseFieldAddress => 'Address';

  @override
  String get houseFieldCity => 'City';

  @override
  String get houseFieldTotalFloors => 'Total Floors';

  @override
  String get roomsButton => 'Rooms';

  @override
  String get rentersButton => 'Renters';

  @override
  String get metersButton => 'Meters';

  @override
  String get billConfigButton => 'Bill Configuration';

  @override
  String get managersButton => 'Managers';

  @override
  String get expensesButton => 'Expenses';

  @override
  String get reportsButton => 'Reports';

  @override
  String get invoicesButton => 'Invoices';

  @override
  String get newHouseAppBarTitle => 'New House';

  @override
  String get editHouseAppBarTitle => 'Edit House';

  @override
  String get houseNameHint => 'e.g. Sunrise Apartments';

  @override
  String get houseNameRequired => 'Name is required';

  @override
  String get houseAddressHint => 'Street address';

  @override
  String get houseAddressRequired => 'Address is required';

  @override
  String get houseFloorsHint => 'e.g. 4';

  @override
  String get roomsTitle => 'Rooms';

  @override
  String get noRoomsYet => 'No rooms yet';

  @override
  String get failedToLoadRooms => 'Failed to load rooms';

  @override
  String roomTileTitle(String number) {
    return 'Room $number';
  }

  @override
  String get editRoomTooltip => 'Edit room';

  @override
  String get roomNotFound => 'Room not found';

  @override
  String get connectToLoadRoom => 'Connect to the internet to load this room.';

  @override
  String get roomFieldRoomNumber => 'Room Number';

  @override
  String get roomFieldStatus => 'Status';

  @override
  String get roomFieldBaseRent => 'Base Rent';

  @override
  String get roomFieldFloor => 'Floor';

  @override
  String get roomFieldMeter => 'Meter';

  @override
  String get meterAttachedYes => 'Attached';

  @override
  String get meterAttachedNo => 'Not attached';

  @override
  String get roomFieldMeterNumber => 'Meter Number';

  @override
  String get currentRenterSectionTitle => 'Current Renter';

  @override
  String get roomFieldName => 'Name';

  @override
  String get roomFieldMobile => 'Mobile';

  @override
  String get roomFieldSince => 'Since';

  @override
  String get collectPaymentButton => 'Collect Payment';

  @override
  String get vacantNoRenter => 'Vacant — no current renter';

  @override
  String get meterReadingsButton => 'Meter Readings';

  @override
  String get roomStatusVacant => 'Vacant';

  @override
  String get roomStatusOccupied => 'Occupied';

  @override
  String get newRoomAppBarTitle => 'New Room';

  @override
  String get editRoomAppBarTitle => 'Edit Room';

  @override
  String get roomNumberHint => 'e.g. 101';

  @override
  String get roomNumberRequired => 'Room number is required';

  @override
  String get baseRentHint => 'e.g. 7500';

  @override
  String get baseRentRequired => 'Base rent is required';

  @override
  String get floorHint => 'e.g. 2 or Ground';

  @override
  String get meterAttachedTitle => 'Meter Attached';

  @override
  String get meterPresentSubtitle => 'Electricity meter present';

  @override
  String get noMeterSubtitle => 'No meter';

  @override
  String get meterNumberHint => 'e.g. MTR-001';

  @override
  String get rentersTitle => 'Renters';

  @override
  String get noRentersYet => 'No renters yet';

  @override
  String get failedToLoadRenters => 'Failed to load renters';

  @override
  String get editRenterTooltip => 'Edit renter';

  @override
  String get renterNotFound => 'Renter not found';

  @override
  String get connectToLoadRenter =>
      'Connect to the internet to load this renter.';

  @override
  String get renterFieldAdvance => 'Advance';

  @override
  String get currentAssignmentSectionTitle => 'Current Assignment';

  @override
  String get renterFieldRoom => 'Room';

  @override
  String get renterFieldMoveIn => 'Move-in';

  @override
  String get contactIdentitySectionTitle => 'Contact & Identity';

  @override
  String get renterFieldNid => 'NID';

  @override
  String get renterFieldPresentAddress => 'Present Address';

  @override
  String get renterFieldPermanentAddress => 'Permanent Address';

  @override
  String get renterFieldOccupation => 'Occupation';

  @override
  String get renterFieldOrganization => 'Organization';

  @override
  String get renterFieldEmergencyContact => 'Emergency Contact';

  @override
  String get renterFieldEmergencyMobile => 'Emergency Mobile';

  @override
  String get assignToRoomButton => 'Assign to Room';

  @override
  String get duesButton => 'Dues';

  @override
  String get newRenterAppBarTitle => 'New Renter';

  @override
  String get editRenterAppBarTitle => 'Edit Renter';

  @override
  String get sectionBasic => 'Basic';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get fullNameHint => 'e.g. Rahim Uddin';

  @override
  String get fullNameRequired => 'Full name is required';

  @override
  String get mobileLabel => 'Mobile';

  @override
  String get mobileHint => 'e.g. 01711-000000';

  @override
  String get mobileRequired => 'Mobile is required';

  @override
  String get sectionIdentity => 'Identity';

  @override
  String get nidNumberLabel => 'NID Number';

  @override
  String get nidNumberHint => 'National ID number';

  @override
  String get sectionAddress => 'Address';

  @override
  String get presentAddressLabel => 'Present Address';

  @override
  String get permanentAddressLabel => 'Permanent Address';

  @override
  String get sectionWork => 'Work';

  @override
  String get occupationLabel => 'Occupation';

  @override
  String get occupationHint => 'e.g. Teacher';

  @override
  String get organizationLabel => 'Organization';

  @override
  String get organizationHint => 'e.g. City College';

  @override
  String get sectionEmergencyContact => 'Emergency Contact';

  @override
  String get contactNameLabel => 'Contact Name';

  @override
  String get contactNameHint => 'e.g. Karim Uddin';

  @override
  String get contactMobileLabel => 'Contact Mobile';

  @override
  String get contactMobileHint => 'e.g. 01711-000001';

  @override
  String get sectionFinancial => 'Financial';

  @override
  String get advanceAmountLabel => 'Advance Amount';

  @override
  String get advanceAmountHint => 'e.g. 5000';

  @override
  String get assignDialogTitle => 'Assign to Room';

  @override
  String get noVacantRooms => 'No vacant rooms available.';

  @override
  String get vacantRoomLabel => 'Vacant Room';

  @override
  String get selectARoom => 'Select a room';

  @override
  String get moveInDateLabel => 'Move-in Date';

  @override
  String get openingMeterReadingLabel => 'Opening Meter Reading';

  @override
  String get openingMeterReadingHint => 'kWh at move-in (recommended)';

  @override
  String get assignedSuccess => 'Assigned successfully';

  @override
  String get transferDialogTitle => 'Transfer to Room';

  @override
  String get noOtherVacantRooms => 'No other vacant rooms available.';

  @override
  String get transferToRoomLabel => 'Transfer to Room';

  @override
  String get transferDateLabel => 'Transfer Date';

  @override
  String get transferredSuccess => 'Transferred successfully';

  @override
  String get moveOutDialogTitle => 'Move Out';

  @override
  String get moveOutDateLabel => 'Move-out Date';

  @override
  String get selectAReason => 'Select a reason';

  @override
  String get movedOutSuccess => 'Moved out successfully';

  @override
  String get moveOutReasonMovedOut => 'Moved Out';

  @override
  String get moveOutReasonEvicted => 'Evicted';

  @override
  String get billConfigTitle => 'Bill Configuration';

  @override
  String get addBillHeadTooltip => 'Add Bill Head';

  @override
  String get failedToLoadBillConfig => 'Failed to load bill config';

  @override
  String get noBillHeadsConfigured => 'No bill heads configured.';

  @override
  String get billHeadServiceCharge => 'Service Charge';

  @override
  String get billHeadWasteBill => 'Waste Bill';

  @override
  String get billHeadElectricityRate => 'Electricity Rate (per unit)';

  @override
  String get billHeadElectricityRateShort => 'Electricity Rate';

  @override
  String get billHeadCustom => 'Custom';

  @override
  String billConfigSubtitle(String headLabel, String date) {
    return '$headLabel · effective $date';
  }

  @override
  String get addBillHeadAppBarTitle => 'Add Bill Head';

  @override
  String get updateBillHeadAppBarTitle => 'Update Bill Head';

  @override
  String get billHeadFieldLabel => 'Head';

  @override
  String get pleaseSelectAHead => 'Please select a head';

  @override
  String get perUnitSuffix => 'per unit';

  @override
  String get effectiveFromFieldLabel => 'Effective From';

  @override
  String get billHeadUpdated => 'Bill head updated';

  @override
  String get billHeadAdded => 'Bill head added';

  @override
  String get metersTitle => 'Meters';

  @override
  String get failedToLoadMeters => 'Failed to load meters';

  @override
  String get noMeteredRooms => 'No metered rooms in this house.';

  @override
  String get meterReadingsTitle => 'Meter Readings';

  @override
  String get failedToLoadReadings => 'Failed to load readings';

  @override
  String get noReadingsYet => 'No readings yet.';

  @override
  String get adjustTooltip => 'Adjust';

  @override
  String get adjustmentChipLabel => 'ADJUSTMENT';

  @override
  String unitsConsumedLine(String units, String current, String previous) {
    return '$units units · $current kWh (prev $previous)';
  }

  @override
  String rateLine(String rate, String date) {
    return '@ ৳$rate/unit · $date';
  }

  @override
  String get addMeterReadingAppBarTitle => 'Add Meter Reading';

  @override
  String get currentReadingLabel => 'Current Reading (kWh)';

  @override
  String get currentReadingHint => 'e.g. 1640';

  @override
  String get currentReadingRequired => 'Current reading is required';

  @override
  String get previousReadingLabel => 'Previous Reading (kWh)';

  @override
  String get previousReadingHint =>
      'Starting meter reading (required for first entry)';

  @override
  String get previousReadingRequiredFirst => 'Required for the first reading';

  @override
  String get readingDateLabel => 'Reading Date';

  @override
  String get billingPeriodSectionTitle => 'Billing Period';

  @override
  String get monthFieldLabel => 'Month';

  @override
  String get yearFieldLabel => 'Year';

  @override
  String get saveReadingButton => 'Save Reading';

  @override
  String get readingSaved => 'Reading saved';

  @override
  String get adjustReadingAppBarTitle => 'Adjust Reading';

  @override
  String get correctingReadingFor => 'Correcting reading for';

  @override
  String currentReadingLine(String current, String rate) {
    return 'Current reading: $current kWh · @ ৳$rate/unit';
  }

  @override
  String get correctedReadingLabel => 'Corrected Reading (kWh)';

  @override
  String get correctedReadingHint => 'e.g. 1645';

  @override
  String get correctedReadingRequired => 'Corrected reading is required';

  @override
  String get rateOverrideLabel => 'Rate Override (per unit)';

  @override
  String get rateOverrideHint => 'Leave blank to use configured rate';

  @override
  String get rateOverrideHelper =>
      'Optional — overrides the rate for this adjustment only';

  @override
  String get saveAdjustmentButton => 'Save Adjustment';

  @override
  String get adjustmentSaved => 'Adjustment saved';

  @override
  String get managersTitle => 'Managers';

  @override
  String get newManagerTooltip => 'New Manager';

  @override
  String get failedToLoadManagers => 'Failed to load managers';

  @override
  String get noManagersYet => 'No managers yet.';

  @override
  String get newManagerAppBarTitle => 'New Manager';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get emailInvalid => 'Enter a valid email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordTooShort => 'Password must be at least 8 characters';

  @override
  String get managerCreated => 'Manager created';

  @override
  String get assignManagerTooltip => 'Assign Manager';

  @override
  String get noManagersAssigned => 'No managers assigned to this house.';

  @override
  String get expensesSwitchLabel => 'Expenses';

  @override
  String get removeManagerTooltip => 'Remove';

  @override
  String get removeManagerDialogTitle => 'Remove manager?';

  @override
  String removeManagerDialogBody(String name) {
    return 'Revoke $name\'s access to this house.';
  }

  @override
  String get managerFallbackName => 'Manager';

  @override
  String get managerRemoved => 'Manager removed';

  @override
  String get noManagersYetDialogTitle => 'No managers yet';

  @override
  String get noManagersYetDialogBody =>
      'Create a manager first, then assign them to this house.';

  @override
  String get createManagerButton => 'Create Manager';

  @override
  String get allManagersAssignedBody =>
      'All of your managers are already assigned to this house.';

  @override
  String get managerDropdownLabel => 'Manager';

  @override
  String get canLogExpensesLabel => 'Can log expenses';

  @override
  String get expensesTitle => 'Expenses';

  @override
  String get addExpenseTooltip => 'Add Expense';

  @override
  String get failedToLoadExpenses => 'Failed to load expenses';

  @override
  String get noExpensesThisMonth => 'No expenses for this month.';

  @override
  String get monthTotalLabel => 'Month Total';

  @override
  String get deleteExpenseTooltip => 'Delete';

  @override
  String get deleteExpenseDialogTitle => 'Delete this expense?';

  @override
  String deleteExpenseDialogBody(String label, String amount) {
    return '$label — ৳$amount';
  }

  @override
  String get expenseDeleted => 'Expense deleted';

  @override
  String paidToLine(String name) {
    return 'Paid to $name';
  }

  @override
  String get categoryRepair => 'Repair';

  @override
  String get categoryMaintenance => 'Maintenance';

  @override
  String get categoryStaffSalary => 'Staff Salary';

  @override
  String get categoryUtilityBill => 'Utility Bill';

  @override
  String get categoryCustom => 'Custom';

  @override
  String get addExpenseAppBarTitle => 'Add Expense';

  @override
  String get editExpenseAppBarTitle => 'Edit Expense';

  @override
  String get categoryFieldLabel => 'Category';

  @override
  String get categoryRequired => 'Please select a category';

  @override
  String get expenseDateLabel => 'Expense Date';

  @override
  String get paidToLabel => 'Paid To';

  @override
  String get expenseUpdated => 'Expense updated';

  @override
  String get expenseAdded => 'Expense added';

  @override
  String get duesTitle => 'Dues';

  @override
  String get addDueTooltip => 'Add Due';

  @override
  String get failedToLoadDues => 'Failed to load dues';

  @override
  String get noDuesForRenter => 'No dues for this renter.';

  @override
  String get manualTag => 'Manual';

  @override
  String waivedLine(String reason) {
    return 'Waived: $reason';
  }

  @override
  String get waiveTooltip => 'Waive';

  @override
  String get dueWaived => 'Due waived';

  @override
  String get dueStatusOpen => 'Open';

  @override
  String get dueStatusPartial => 'Partial';

  @override
  String get dueStatusPaid => 'Paid';

  @override
  String get dueStatusWaived => 'Waived';

  @override
  String get addDueAppBarTitle => 'Add Due';

  @override
  String get dueHeadElectricity => 'Electricity';

  @override
  String get dueHeadRent => 'Rent';

  @override
  String dueOfAmount(String outstanding, String amount) {
    return '$outstanding of $amount';
  }

  @override
  String get dueDateLabel => 'Due Date';

  @override
  String get dueAdded => 'Due added';

  @override
  String get waiveDueDialogTitle => 'Waive this due?';

  @override
  String waiveDueDialogBody(String headLabel, String outstanding) {
    return '$headLabel — ৳$outstanding outstanding. This cannot be undone.';
  }

  @override
  String get invoicesTitle => 'Invoices';

  @override
  String get generateButton => 'Generate';

  @override
  String get noInvoicesThisMonth => 'No invoices for this month.';

  @override
  String get tapGenerateHint =>
      'Tap Generate to create invoices for this month.';

  @override
  String get failedToLoadInvoices => 'Failed to load invoices';

  @override
  String get invoiceAppBarTitle => 'Invoice';

  @override
  String get failedToLoadInvoice => 'Failed to load invoice';

  @override
  String get invoiceFieldRenter => 'Renter';

  @override
  String get invoiceFieldRoom => 'Room';

  @override
  String get invoiceFieldDueDate => 'Due Date';

  @override
  String get invoiceFieldIssued => 'Issued';

  @override
  String get lineItemsSectionTitle => 'Line Items';

  @override
  String get invoiceFieldTotal => 'Total';

  @override
  String get invoiceFieldPaid => 'Paid';

  @override
  String get invoiceStatusUnpaid => 'Unpaid';

  @override
  String get invoiceStatusPartial => 'Partial';

  @override
  String get invoiceStatusPaid => 'Paid';

  @override
  String get invoiceStatusClosed => 'Closed';

  @override
  String get generateInvoicesDialogTitle => 'Generate Invoices';

  @override
  String get billHeadsSectionTitle => 'Bill Heads';

  @override
  String get selectAtLeastOneBillHead =>
      'Select at least one bill head (or all for everything)';

  @override
  String get includeElectricityLabel => 'Include Electricity';

  @override
  String get generateWarningBody =>
      'This will create invoices for all occupied rooms and close prior unpaid invoices into dues. This cannot be undone.';

  @override
  String get alreadyGeneratedTitle => 'Already Generated';

  @override
  String get invoicesGeneratedTitle => 'Invoices Generated';

  @override
  String get alreadyGeneratedBody =>
      'Invoices for this month already exist. Nothing new was created.';

  @override
  String invoicesCreatedCount(int count) {
    return '$count invoice(s) created.';
  }

  @override
  String invoicesClosedLine(int closedCount, int duesCount) {
    return '$closedCount prior invoice(s) closed → $duesCount due(s) created.';
  }

  @override
  String get skippedRoomsTitle => 'Skipped Rooms';

  @override
  String get skippedRoomFallback => 'Room';

  @override
  String get skippedReasonFallback => 'unknown reason';

  @override
  String get warningsTitle => 'Warnings';

  @override
  String get warningElectricityMissing => 'electricity reading missing';

  @override
  String warningRoomLine(String roomNumber, String reason) {
    return 'Room $roomNumber: $reason';
  }

  @override
  String get reportsTitle => 'Reports';

  @override
  String get occupancySectionTitle => 'Occupancy';

  @override
  String get pnlSectionTitle => 'P&L';

  @override
  String get duesAgingSectionTitle => 'Dues Aging';

  @override
  String get failedToLoadOccupancy => 'Failed to load occupancy';

  @override
  String occupiedPercent(String rate) {
    return '$rate% occupied';
  }

  @override
  String get totalLabel => 'Total';

  @override
  String get occupiedLabel => 'Occupied';

  @override
  String get vacantLabel => 'Vacant';

  @override
  String get failedToLoadPnl => 'Failed to load P&L';

  @override
  String get billedSectionTitle => 'Billed';

  @override
  String get rentLabel => 'Rent';

  @override
  String get electricityLabel => 'Electricity';

  @override
  String get billsLabel => 'Bills';

  @override
  String get manualDuesLabel => 'Manual Dues';

  @override
  String get collectedSectionTitle => 'Collected';

  @override
  String get expensesSectionTitle => 'Expenses';

  @override
  String get netBilledLabel => 'Net (billed)';

  @override
  String get netCollectedLabel => 'Net (collected)';

  @override
  String get collectionGapLabel => 'Collection Gap';

  @override
  String get failedToLoadDuesAging => 'Failed to load dues aging';

  @override
  String get bucket0_30 => '0–30 days';

  @override
  String get bucket31_60 => '31–60 days';

  @override
  String get bucket61_90 => '61–90 days';

  @override
  String get bucket90Plus => '90+ days';

  @override
  String get totalOutstandingLabel => 'Total Outstanding';

  @override
  String get mustBeOnlineToCollect => 'You must be online to collect payments.';

  @override
  String get unexpectedErrorRetry =>
      'An unexpected error occurred. Please try again.';

  @override
  String get paymentDetailsSectionTitle => 'Payment Details';

  @override
  String get amountLabel => 'Amount';

  @override
  String outstandingHelper(String amount) {
    return 'Outstanding: ৳$amount';
  }

  @override
  String get enterAnAmount => 'Enter an amount';

  @override
  String get amountMustBeGreaterThanZero => 'Amount must be greater than 0';

  @override
  String get enterValidAmount => 'Enter a valid amount (e.g. 1500.00)';

  @override
  String get paymentMethodLabel => 'Payment Method';

  @override
  String get paymentMethodCash => 'Cash';

  @override
  String get paymentMethodBank => 'Bank';

  @override
  String get paymentMethodMobile => 'Mobile';

  @override
  String get referenceLabel => 'Reference (optional)';

  @override
  String get referenceHint => 'Cheque no., transaction ID…';

  @override
  String get notesOptionalLabel => 'Notes (optional)';

  @override
  String get collectButton => 'Collect';

  @override
  String invoiceTitleLine(String month, int year) {
    return '$month $year Invoice';
  }

  @override
  String get outstandingDuesSectionTitle => 'Outstanding Dues';

  @override
  String get paymentReceivedTitle => 'Payment Received';

  @override
  String paymentViaLine(String amount, String method) {
    return '৳$amount via $method';
  }

  @override
  String get appliedToSectionTitle => 'Applied to';

  @override
  String get newOutstandingLabel => 'New Outstanding';

  @override
  String appliedAmountToInvoice(String amount, String month, int year) {
    return '৳$amount → $month $year Invoice';
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
  String get dueFallback => 'Due';

  @override
  String get roomAppBarFallback => 'Room';

  @override
  String get failedToLoadRoom => 'Failed to load room';

  @override
  String get renterAppBarFallback => 'Renter';

  @override
  String get failedToLoadRenter => 'Failed to load renter';

  @override
  String get houseAppBarFallback => 'House';

  @override
  String get failedToLoadHouse => 'Failed to load house';

  @override
  String meterNumberLine(String number) {
    return 'Meter $number';
  }

  @override
  String get outstandingLabel => 'Outstanding';

  @override
  String ownerChipLabel(String id) {
    return 'Owner: $id…';
  }

  @override
  String get auditLogTitle => 'Audit Log';

  @override
  String get noAuditEntries => 'No audit entries';

  @override
  String get failedToLoadAuditLogs => 'Failed to load audit logs';

  @override
  String get auditSystemActor => 'system';

  @override
  String get auditDetailsDialogTitle => 'Change Details';

  @override
  String get auditNoChangeDetails => 'No change details recorded.';

  @override
  String auditFieldChangeLine(String field, String before, String after) {
    return '$field: $before → $after';
  }

  @override
  String get changePasswordTitle => 'Change password';

  @override
  String get changePasswordButton => 'Change password';

  @override
  String get passwordResetRequiredNotice =>
      'Your account requires a password change before you can continue.';

  @override
  String get passwordChangedRelogin =>
      'Password changed. Please sign in again.';

  @override
  String get currentPasswordLabel => 'Current password';

  @override
  String get currentPasswordRequired => 'Enter your current password';

  @override
  String get newPasswordLabel => 'New password';

  @override
  String get newPasswordRequired => 'Enter a new password';

  @override
  String get newPasswordTooShort => 'Password must be at least 8 characters';

  @override
  String get confirmPasswordLabel => 'Confirm new password';

  @override
  String get confirmPasswordRequired => 'Confirm your new password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get auditFilterOwnerLabel => 'Owner';

  @override
  String get auditFilterHouseLabel => 'House';

  @override
  String get auditFilterAllOwners => 'All owners';

  @override
  String get auditFilterAllHouses => 'All houses';

  @override
  String get auditFilterAllTheirHouses => 'All their houses';

  @override
  String get auditClearFilters => 'Clear filters';

  @override
  String get auditSystemGroup => 'System';

  @override
  String get auditPickHousePrompt => 'Pick a house to view its audit entries.';

  @override
  String auditOwnerMultiHouseHint(int count) {
    return 'This owner has $count houses — the server filters one house at a time. Pick one above.';
  }

  @override
  String auditHouseShort(String shortId) {
    return 'House $shortId';
  }

  @override
  String get ownersTitle => 'Owners';

  @override
  String get ownersSuperAdminOnly =>
      'Owner management is available to super admins only.';

  @override
  String get ownersCreateButton => 'Create owner';

  @override
  String get ownersCreateTitle => 'Create owner';

  @override
  String get ownersSearchLabel => 'Search name or email';

  @override
  String get ownersStatusAll => 'All statuses';

  @override
  String get ownerStatusActive => 'Active';

  @override
  String get ownerStatusSuspended => 'Suspended';

  @override
  String get ownerStatusResetRequired => 'Reset required';

  @override
  String get ownersLoadFailed => 'Failed to load owners';

  @override
  String get ownersEmpty => 'No owners found';

  @override
  String get ownersActionFailed => 'Action failed. Please try again.';

  @override
  String ownersHousesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count houses',
      one: '1 house',
      zero: 'No houses',
    );
    return '$_temp0';
  }

  @override
  String get ownerActivate => 'Activate';

  @override
  String get ownerSuspend => 'Suspend';

  @override
  String get ownerDeleteTitle => 'Delete owner?';

  @override
  String ownerDeleteConfirm(String name) {
    return 'Delete $name? Owners with houses cannot be deleted — remove or reassign their houses first.';
  }

  @override
  String get ownerDeleted => 'Owner deleted';

  @override
  String get ownersFullNameLabel => 'Full name';

  @override
  String get ownersFullNameRequired => 'Enter the full name';

  @override
  String get ownersEmailLabel => 'Email';

  @override
  String get ownersEmailRequired => 'Enter the email';

  @override
  String get ownersMobileLabel => 'Mobile (optional)';

  @override
  String get ownersTempPasswordLabel => 'Temporary password';

  @override
  String get ownersTempPasswordHelp =>
      'At least 8 characters. Shown once after creation.';

  @override
  String get ownersTempPasswordTooShort =>
      'Password must be at least 8 characters';

  @override
  String get ownersCreatedTitle => 'Owner created';

  @override
  String ownersCreatedFor(String name, String email) {
    return '$name ($email) can now sign in with this temporary password:';
  }

  @override
  String get ownersTempPasswordRelay =>
      'Give this password to the owner — no email is sent. They must change it on first login.';

  @override
  String get profileTooltip => 'Profile';

  @override
  String get profileTitle => 'My profile';

  @override
  String get profileAccountSection => 'Account';

  @override
  String get profileRoleLabel => 'Role';

  @override
  String get profileStatusLabel => 'Status';

  @override
  String get profileLastLoginLabel => 'Last login';

  @override
  String get profileMemberSinceLabel => 'Member since';

  @override
  String get profileEditSection => 'Edit info';

  @override
  String get profileNotSet => 'Not set';

  @override
  String get profileChangePasswordDescription =>
      'You\'ll be signed out of all devices and asked to sign in again with the new password.';

  @override
  String get invoicePdfButton => 'Invoice PDF (A4)';

  @override
  String get receiptPdfButton => 'Receipt PDF (thermal)';

  @override
  String get noInvoiceForPaymentHint => 'No current invoice for this payment';

  @override
  String get pdfGenerationFailed =>
      'Could not generate the PDF. Check your connection and try again.';

  @override
  String get dueAmountLabel => 'Due amount';
}
