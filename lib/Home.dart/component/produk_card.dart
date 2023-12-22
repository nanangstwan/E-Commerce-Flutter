import 'package:flutter/material.dart';
import '../../decoration.dart';

class ProdukCard extends StatelessWidget {
  const ProdukCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.nama,
    required this.harga,
    required this.image,
  }) : super(key: key);

  final double width, aspectRetio;
  final String nama, harga, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.02,
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(image, 
                errorBuilder: (BuildContext context,
                    Object exception, StackTrace? stackTrace) {
                  return const Text('Gagal memuat gambar');
                }
                )
                ),
          ),
          const SizedBox(height: 8),
          Text(
            nama,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 2,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "RP. $harga",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
