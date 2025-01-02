import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF27282E),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: toggleExpand,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.fastLinearToSlowEaseIn,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Stop Button
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOutCubic,
                      height: 60,
                      width: isExpanded ? 160 : 300,
                      decoration: BoxDecoration(
                        color: isExpanded
                            ? Colors.red
                            : const Color.fromARGB(255, 65, 67, 77),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          'Stop',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    // Spacing between buttons
                    isExpanded
                        ? SizedBox(
                            width: 16,
                          )
                        : SizedBox(
                            width: 16,
                          ),
                    // Resume Button
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOutCubic,
                      height: 60,
                      width: isExpanded ? 160 : 0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 65, 67, 77),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Stack(
                        children: [
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(
                              begin: isExpanded ? 160 : 50,
                              end: isExpanded ? 50 : 160,
                            ),
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOutCubic,
                            builder: (context, value, child) {
                              return Positioned(
                                left: value,
                                top: 0,
                                bottom: 0,
                                child: Center(child: child),
                              );
                            },
                            child: const Text(
                              'Resume',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
