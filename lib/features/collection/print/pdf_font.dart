import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

/// Noto Sans Bengali covers both the ৳ currency sign (U+09F3) and Bengali
/// script (renter/house names may be in Bengali) — the `pdf` package's core
/// Helvetica font is Latin-1 only and would render either as a blank glyph.
/// Downloaded once via Google Fonts and cached on-device by the `printing`
/// package (PdfBaseCache) — subsequent PDFs reuse the cached font, no
/// re-download. Requires network on first use only.
Future<pw.ThemeData> loadPrintTheme() async {
  final regular = await PdfGoogleFonts.notoSansBengaliRegular();
  final bold = await PdfGoogleFonts.notoSansBengaliBold();
  return pw.ThemeData.withFont(base: regular, bold: bold);
}
