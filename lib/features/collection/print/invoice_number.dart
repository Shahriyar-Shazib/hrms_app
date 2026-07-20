/// Display-only synthetic invoice identifier for print — the API never
/// returns one, and raw UUIDs must never appear on a printout. Derived from
/// the room number + billing period, e.g. INV-3A-202607. Matches the web
/// print feature's formatting exactly.
String formatInvoiceNumber(String roomNumber, int year, int month) {
  final mm = month.toString().padLeft(2, '0');
  return 'INV-$roomNumber-$year$mm';
}
