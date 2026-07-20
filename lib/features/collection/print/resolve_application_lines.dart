import '../data/models/collection.dart';
import 'print_data.dart';

/// payment.applications only carries targetType/targetId/appliedAmount —
/// resolve human labels from the PRE-collect preview snapshot (billing period
/// + open dues). Post-collect, a fully-paid due drops out of "open" entirely
/// and a fully-paid invoice stops being "current", so both would be
/// unresolvable if looked up AFTER the collect call instead of before it.
List<PrintApplicationLine> resolveApplicationLines(
  List<PaymentApplication> applications, {
  required String? billingPeriodLabel,
  required List<PreviewDue> dues,
}) {
  final dueLabelById = {for (final due in dues) due.id: due.headLabel};
  return applications.map((app) {
    final label = app.targetType == 'INVOICE'
        ? '${billingPeriodLabel ?? 'Invoice'} invoice'
        : (dueLabelById[app.targetId] ?? 'Due');
    return PrintApplicationLine(label: label, amount: app.appliedAmount);
  }).toList();
}
