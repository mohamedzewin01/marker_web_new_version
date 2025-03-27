import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: 0, // Replace with your cubit.index
            children: [
              // Replace with your views
              Center(child: Text('View 1')),
              Center(child: Text('View 2')),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavigationBar(
              currentIndex: 0, // Replace with your cubit.index
              onItemTapped: (index) {
                // Replace with your cubit.changeIndex(index)
              },
            ),
          ),
        ],
      ),
      floatingActionButton: PositionedFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class PositionedFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          bottom: 30, // Adjust this value to move the button upwards
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(80, 80), // Adjust size as needed
                painter: FloatingButtonCurvePainter(),
              ),
              FloatingActionButton(
                backgroundColor: Colors.blue, // Replace with your ColorManager.primaryColor
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Your action here
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FloatingButtonCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.2) // Adjust color and opacity as needed
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..quadraticBezierTo(size.width / 2, 0, size.width, size.height / 2)
      ..quadraticBezierTo(size.width / 2, size.height, 0, size.height / 2)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => onItemTapped(0),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => onItemTapped(1),
          ),
        ],
      ),
    );
  }
}
