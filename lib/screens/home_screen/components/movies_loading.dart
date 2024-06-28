import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MoviesLoading extends StatelessWidget {
  const MoviesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[400]!,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Adjust as needed
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 8, // Number of shimmer items
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 218, 211, 211),
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}
