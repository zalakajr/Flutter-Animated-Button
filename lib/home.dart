import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isExpanded = false;

  void toggleContainer() {
    if (!isExpanded) {
      // Only allow expansion when the container is not expanded
      setState(() {
        isExpanded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: toggleContainer, // Detect tap to expand
          child: AnimatedContainer(
            width: isExpanded ? 320 : 250,
            height: isExpanded ? 250 : 50,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: isExpanded ? Colors.white : Colors.red,
              borderRadius: BorderRadius.circular(25),
              boxShadow: isExpanded
                  ? [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 5),
                      )
                    ]
                  : [],
            ),
            child: isExpanded
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                color: Colors.red,
                                size: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isExpanded = false;
                                  });
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Are you sure?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'You might not have backed up your important data, and proceeding could lead to data loss. ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isExpanded = false;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                    child: Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
