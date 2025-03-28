import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_filex/open_filex.dart';
import 'package:http/http.dart' as http;

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}

class ProductScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: "منتج 1", price: 100.0, imageUrl: "https://via.placeholder.com/150"),
    Product(name: "منتج 2", price: 200.0, imageUrl: "https://via.placeholder.com/150"),
    Product(name: "منتج 3", price: 300.0, imageUrl: "https://via.placeholder.com/150"),
    Product(name: "منتج 4", price: 400.0, imageUrl: "https://via.placeholder.com/150"),
  ];

  Future<Uint8List> _downloadImage(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception("فشل تحميل الصورة");
    }
  }

  Future<void> _createPdf(BuildContext context) async {
    final pdf = pw.Document();

    List<Uint8List> imageBytesList = [];

    for (var product in products) {
      try {
        final imageBytes = await _downloadImage(product.imageUrl);
        imageBytesList.add(imageBytes);
      } catch (e) {
        print("خطأ في تحميل الصورة: $e");
        imageBytesList.add(Uint8List(0)); // صورة فارغة في حالة الخطأ
      }
    }

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: List.generate(products.length, (index) {
              return pw.Container(
                margin: const pw.EdgeInsets.symmetric(vertical: 8),
                padding: const pw.EdgeInsets.all(8),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                  borderRadius: pw.BorderRadius.circular(10),
                ),
                child: pw.Row(
                  children: [
                    pw.Container(
                      width: 50,
                      height: 50,
                      decoration: pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        border: pw.Border.all(color: PdfColors.grey),
                      ),
                      child: imageBytesList[index].isNotEmpty
                          ? pw.Image(pw.MemoryImage(imageBytesList[index]))
                          : pw.Container(), // إذا فشل تحميل الصورة
                    ),
                    pw.SizedBox(width: 10),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(products[index].name, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
                        pw.Text("${products[index].price} جنيه", style: pw.TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/products.pdf";
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("تم حفظ PDF في ${file.path}")),
    );

    print("PDF Created: ${filePath}");

    // 🔹 فتح ملف PDF بعد إنشائه
    OpenFilex.open(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("قائمة المنتجات")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(product.name),
            subtitle: Text("${product.price} جنيه"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createPdf(context),
        child: Icon(Icons.picture_as_pdf),
      ),
    );
  }
}
