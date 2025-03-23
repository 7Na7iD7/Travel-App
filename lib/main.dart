import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelapp/model/TravelModel.dart';
import 'package:expandable_text/expandable_text.dart';

// Entry point for the Flutter application
void main() {
  runApp(MyApp());
}

// Root widget of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

// Main page of the application that requires state management
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

// State class for MainPage that includes animation capabilities
class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  double imageSize = 60;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black.withAlpha((0.05 * 255).round()),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height / 1.8,
                child: Stack(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        key: ValueKey<int>(_selectedIndex),
                        width: double.infinity,
                        height: size.height / 2.1,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60),
                          ),
                          image: DecorationImage(
                            image: AssetImage(travelList[_selectedIndex].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                      ) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),

                    Positioned(
                      right: 0,
                      top: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.chevron_left,
                                  color: Colors.black.withOpacity(0.8),
                                  size: 28,
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(101, 255, 255, 255),
                              ),
                              child: const Icon(CupertinoIcons.heart),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 100,
                      right: 20,
                      child: SizedBox(
                        width: imageSize,
                        height:
                            (imageSize + 16) *
                            (travelList.length > 4 ? 4 : travelList.length),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: travelList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: GestureDetector(
                                onTap: () {
                                  _animationController.forward(from: 0.0);
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                child: AnimatedBuilder(
                                  animation: _animationController,
                                  builder: (context, child) {
                                    final scale =
                                        index == _selectedIndex
                                            ? (_animationController.isAnimating
                                                ? _scaleAnimation.value
                                                : 1.0)
                                            : 1.0;

                                    return Transform.scale(
                                      scale: scale,
                                      child: Container(
                                        width:
                                            _selectedIndex == index
                                                ? imageSize + 7
                                                : imageSize,
                                        height:
                                            _selectedIndex == index
                                                ? imageSize + 2
                                                : imageSize,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          child: Image.asset(
                                            travelList[index].image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 90,
                      left: size.width / 18,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (
                              Widget child,
                              Animation<double> animation,
                            ) {
                              return FadeTransition(
                                opacity: animation,
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0, 0.2),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                ),
                              );
                            },
                            child: Text(
                              key: ValueKey<String>(
                                travelList[_selectedIndex].name,
                              ),
                              travelList[_selectedIndex].name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 8.0,
                                    color: Colors.black54,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (
                              Widget child,
                              Animation<double> animation,
                            ) {
                              return FadeTransition(
                                opacity: animation,
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0, 0.2),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                ),
                              );
                            },
                            child: Row(
                              key: ValueKey<String>(
                                travelList[_selectedIndex].location,
                              ),
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  travelList[_selectedIndex].location,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 8.0,
                                        color: Colors.black54,
                                        offset: Offset(1.0, 1.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // part Two
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatCard(
                            Icons.location_on_outlined,
                            '${travelList[_selectedIndex].distance} km',
                            'Distance',
                            Colors.blue.shade100,
                            Colors.blue.shade700,
                          ),
                          _buildStatCard(
                            Icons.thermostat_outlined,
                            '${travelList[_selectedIndex].temp}°C',
                            'Temperature',
                            Colors.orange.shade100,
                            Colors.orange.shade700,
                          ),
                          _buildStatCard(
                            Icons.star_outline,
                            travelList[_selectedIndex].rating,
                            'Rating',
                            Colors.purple.shade100,
                            Colors.purple.shade700,
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Updated: Replaced Text with ExpandableText for collapsible description
                      Expanded(
                        child: SingleChildScrollView(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: ExpandableText(
                              key: ValueKey<String>(
                                travelList[_selectedIndex].discription,
                              ),
                              travelList[_selectedIndex].discription,
                              expandText: 'Show more',
                              collapseText: 'Show less',
                              maxLines: 3,
                              // Maximum lines before expanding
                              linkColor: Colors.blue,
                              // Color for "Show more/less" link
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                                height: 1.5,
                              ),
                            ),
                            transitionBuilder: (
                              Widget child,
                              Animation<double> animation,
                            ) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        ),
                      ),

                      // Updated: Modified price section to match the design in the image (Total Price and arrow button)
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total Price',
                                  // Changed: Updated label to "Total Price"
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  child: Text(
                                    key: ValueKey<String>(
                                      travelList[_selectedIndex].price,
                                    ),
                                    '\$${travelList[_selectedIndex].price}',
                                    style: const TextStyle(
                                      fontSize: 28,
                                      // Changed: Increased font size to match the image
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  transitionBuilder: (
                                    Widget child,
                                    Animation<double> animation,
                                  ) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              ],
                            ),
                            // Added: Circular arrow button as per the image
                            GestureDetector(
                              onTap: () {
                                // Added: Action for the arrow button
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Proceeding with ${travelList[_selectedIndex].name} trip!',
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Colors
                                          .black, // Added: Black background for the button
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  // Added: Arrow icon to match the image
                                  color: Colors.white,
                                  size: 24,
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
      ),
    );
  }

  Widget _buildStatCard(
    IconData icon,
    String value,
    String label,
    Color bgColor,
    Color iconColor,
  ) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 8),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Text(
              key: ValueKey<String>(value),
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: iconColor,
              ),
            ),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
