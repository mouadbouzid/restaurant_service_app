import 'package:flutter/material.dart';

// A StatefulWidget that provides a circular image picker interface
// This widget displays a circular avatar with a camera button overlay
// allowing users to tap and trigger image selection functionality

class PickImageWidget extends StatefulWidget {
  // Callback function triggered when the camera button is tapped
  // This should handle the image picking logic (camera, gallery, etc.)
  final VoidCallback onTap;

  const PickImageWidget({super.key, required this.onTap});

  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 135, 132, 132),
        child: Stack(
          children: [
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () async {},
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: GestureDetector(
                    onTap: widget.onTap,
                    child: const Icon(
                      Icons.camera_alt_sharp,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
