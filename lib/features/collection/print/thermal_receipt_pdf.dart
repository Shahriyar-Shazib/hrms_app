import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'pdf_font.dart';
import 'print_data.dart';

/// 80mm thermal receipt PDF: narrow single column, compact, house name,
/// receipt no, applications breakdown, bold total, method, balance.
Future<Uint8List> buildThermalReceiptPdf(PrintData data) async {
  final doc = pw.Document(theme: await loadPrintTheme());

  // No invoice for this payment (dues-only collection) — fall back to a
  // short payment-id tag. Never a raw UUID.
  final id = data.payment.id;
  final receiptNo = data.invoiceNumber ??
      '#${(id.length >= 6 ? id.substring(id.length - 6) : id).toUpperCase()}';

  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.roll80,
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.stretch,
        children: [
          pw.Center(
            child: pw.Text(
              data.houseName,
              style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Center(child: pw.Text('PAYMENT RECEIPT', style: const pw.TextStyle(fontSize: 9))),
          pw.SizedBox(height: 6),
          _divider(),
          pw.Text('Receipt: $receiptNo', style: const pw.TextStyle(fontSize: 8)),
          pw.Text(data.payment.paidAt, style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(height: 4),
          pw.Text(data.renterName, style: const pw.TextStyle(fontSize: 8)),
          pw.Text('Room ${data.roomNumber}', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(height: 4),
          _divider(),
          for (final app in data.applications)
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 1),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Expanded(child: pw.Text(app.label, style: const pw.TextStyle(fontSize: 8))),
                  pw.Text('৳${app.amount}', style: const pw.TextStyle(fontSize: 8)),
                ],
              ),
            ),
          pw.SizedBox(height: 4),
          _divider(),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('TOTAL PAID', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
              pw.Text('৳${data.payment.amount}', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            ],
          ),
          pw.SizedBox(height: 2),
          pw.Text('Method: ${data.payment.method}', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(height: 4),
          _divider(),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Balance remaining', style: const pw.TextStyle(fontSize: 8)),
              pw.Text('৳${data.balanceRemaining}', style: const pw.TextStyle(fontSize: 8)),
            ],
          ),
          pw.SizedBox(height: 8),
          pw.Center(child: pw.Text('Thank you!', style: const pw.TextStyle(fontSize: 8))),
        ],
      ),
    ),
  );

  return doc.save();
}

pw.Widget _divider() => pw.Container(
      margin: const pw.EdgeInsets.symmetric(vertical: 2),
      height: 0.6,
      color: PdfColors.black,
    );
