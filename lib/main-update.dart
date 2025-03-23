import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelapp/model/TravelModel.dart';

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
      home: IntroScreen(),
    );
  }
}

// Intro/Splash screen that shows the landscape image and "Go" button
class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image covering the entire screen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/natuer.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Overlay with text
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const Text(
                  'Explore Your',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Favorite Journey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Let\'s Make Our Life Better',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Spacer(),

                // "Go" button and arrows (static)
                Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Two arrows (static with glow effect)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, -30),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // "Go" button with glassmorphism effect
                      GestureDetector(
                        onTap: () {
                          // Navigate to main page with iOS-style transition
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.9),
                                Colors.white.withOpacity(0.5),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              // Outer shadow for depth
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                              // Inner glow effect
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 20,
                                offset: const Offset(0, -5),
                              ),
                              // Subtle glow around the button
                              BoxShadow(
                                color: Colors.white.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 30,
                              ),
                            ],
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Go',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                // You can use a custom font here
                                shadows: [
                                  Shadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
    );
  }
}

// Main page of the application that requires state management
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

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
                      bottom: 20,
                      left: 30,
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

                      Expanded(
                        child: SingleChildScrollView(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              key: ValueKey<String>(
                                travelList[_selectedIndex].discription,
                              ),
                              travelList[_selectedIndex].discription,
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

                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      child: Text(
                                        key: ValueKey<String>(
                                          travelList[_selectedIndex].price,
                                        ),
                                        '\$${travelList[_selectedIndex].price}',
                                        style: const TextStyle(
                                          fontSize: 22,
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
                                    const Text(
                                      '/person',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Booking ${travelList[_selectedIndex].name} trip!',
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade800,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 3,
                              ),
                              child: const Text(
                                'Book Now',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
