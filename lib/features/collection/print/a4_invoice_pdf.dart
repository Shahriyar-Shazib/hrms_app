import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'pdf_font.dart';
import 'print_data.dart';

/// A4 invoice PDF: house header, invoice number, billing period, line-items
/// table, payment section, balance remaining. Built ONLY from [PrintData]
/// fields sourced from the pre-collect preview snapshot (see
/// resolve_application_lines.dart) — never from the collect response's own
/// (unreliable) invoice field.
Future<Uint8List> buildA4InvoicePdf(PrintData data) async {
  final doc = pw.Document(theme: await loadPrintTheme());

  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.stretch,
        children: [
          pw.Center(
            child: pw.Column(
              children: [
                pw.Text(
                  data.houseName,
                  style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 4),
                pw.Text('INVOICE', style: const pw.TextStyle(fontSize: 11, letterSpacing: 1)),
              ],
            ),
          ),
          pw.SizedBox(height: 24),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  _kv('Invoice No', data.invoiceNumber ?? '-'),
                  _kv('Billing period', data.billingPeriodLabel ?? '-'),
                  _kv('Renter', data.renterName),
                  _kv('Room', data.roomNumber),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  _kv('Issued', data.issuedAt ?? '-'),
                  _kv('Due', data.dueDate ?? '-'),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 24),
          pw.Table(
            border: const pw.TableBorder(
              top: pw.BorderSide(width: 1),
              bottom: pw.BorderSide(width: 1),
              horizontalInside: pw.BorderSide(width: 0.5, color: PdfColors.grey400),
            ),
            columnWidths: const {0: pw.FlexColumnWidth(3), 1: pw.FlexColumnWidth(1)},
            children: [
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(vertical: 6),
                    child: pw.Text('Description', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(vertical: 6),
                    child: pw.Text(
                      'Amount',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      textAlign: pw.TextAlign.right,
                    ),
                  ),
                ],
              ),
              for (final item in data.lineItems)
                pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 4),
                      child: pw.Text(item.label),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 4),
                      child: pw.Text('৳${item.amount}', textAlign: pw.TextAlign.right),
                    ),
                  ],
                ),
              // Electricity is its own invoice field, not part of line_items
              // — added as an extra row so it's still part of the same table
              // that sums to Total.
              if (data.electricityAmount != null)
                pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 4),
                      child: pw.Text('Electricity'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 4),
                      child: pw.Text('৳${data.electricityAmount}', textAlign: pw.TextAlign.right),
                    ),
                  ],
                ),
            ],
          ),
          pw.SizedBox(height: 6),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Total', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('৳${data.totalAmount ?? '0.00'}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ],
          ),
          pw.SizedBox(height: 24),
          pw.Divider(),
          pw.Text('Payment', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13)),
          pw.SizedBox(height: 6),
          pw.Text('Due amount: ৳${data.dueBeforePayment}'),
          pw.Text('Amount paid: ৳${data.payment.amount}'),
          pw.Text('Method: ${data.payment.method}'),
          pw.Text('Paid at: ${data.payment.paidAt}'),
          if (data.payment.reference != null) pw.Text('Reference: ${data.payment.reference}'),
          pw.SizedBox(height: 10),
          pw.Text('Applied to', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 4),
          for (final app in data.applications)
            pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 2),
              child: pw.Text('•  ${app.label}: ৳${app.amount}'),
            ),
          pw.SizedBox(height: 20),
          pw.Divider(thickness: 1.5),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Balance remaining', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13)),
              pw.Text('৳${data.balanceRemaining}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13)),
            ],
          ),
        ],
      ),
    ),
  );

  return doc.save();
}

pw.Widget _kv(String label, String value) => pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 2),
      child: pw.Text('$label: $value'),
    );
