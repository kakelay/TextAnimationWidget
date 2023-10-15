import 'package:animated_flight_paths/animated_flight_paths.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';
import 'package:waveui/waveui.dart';

void main() => runApp(const MyApp());
bool isDarkMode = false;
final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.purple,
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  brightness: Brightness.dark,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = isDarkMode ? darkTheme : lightTheme;
    return MaterialApp(
      theme: theme,
      title: 'Animated Flight Paths Example',
      debugShowCheckedModeBanner: false,
      home: const AnimatedFlightPathsExample(),
    );
  }
}

class AnimatedFlightPathsExample extends StatefulWidget {
  const AnimatedFlightPathsExample({super.key});

  @override
  State<AnimatedFlightPathsExample> createState() =>
      _AnimatedFlightPathsExampleState();
}

class _AnimatedFlightPathsExampleState extends State<AnimatedFlightPathsExample>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  List<Segment> segments = [
    Segment(
      value: 80,
      valueLabel: Text(' : 80 %',
          style: TextStyle(
            color: isDarkMode ? Colors.black : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      color: const Color.fromARGB(255, 54, 187, 227),
      label: Text("Flutter",
          style: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    ),
    Segment(
      value: 70,
      valueLabel: Text(' : 70 %',
          style: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      color: const Color.fromARGB(255, 234, 255, 0),
      label: Text("NodeJs",
          style: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    ),
    Segment(
      value: 65,
      valueLabel: Text(' : 65 %',
          style: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      color: const Color.fromARGB(255, 255, 0, 174),
      label: Text("Figma",
          style: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    ),
    Segment(
      value: 45,
      valueLabel: Text(' : 45 %',
          style: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      color: const Color.fromARGB(255, 0, 255, 8),
      label: Text("NuxtJs",
          style: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    ),
    Segment(
      value: 40,
      valueLabel: Text(' : 40 %',
          style: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      color: const Color.fromARGB(255, 255, 0, 0),
      label: Text("HTML & CSS",
          style: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    ),
    Segment(
      value: 35,
      valueLabel: Text(' : 35 %',
          style: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      color: const Color.fromARGB(255, 255, 106, 0),
      label: Text("Jave&Spring",
          style: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Portfolio',
          style: TextStyle(
            fontSize: 30,
            color: isDarkMode ? Colors.black : Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: isDarkMode ? Colors.grey : const Color(0xFF27163e),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => toggleTheme(),
              child: isDarkMode
                  ? Icon(
                      Icons.wb_sunny_outlined,
                      color: isDarkMode ? Colors.black : Colors.black,
                    )
                  : Icon(
                      Icons.brightness_2,
                      color: isDarkMode ? Colors.white : Colors.white,
                    ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.4, 1],
            colors: !isDarkMode
                ? [
                    const Color(0xFF27163e),
                    const Color(0xFF432a72),
                  ]
                : [
                    const Color.fromARGB(255, 62, 60, 60),
                    const Color.fromARGB(60, 35, 32, 32),
                  ],
          ),
        ),
        child: ListView(
          children: [
            if (isDarkMode == true)
              Image.asset('assets/images/black.png')
            else
              Image.asset('assets/images/white.png'),
            Center(
              child: Text(
                'Kak Elay',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.black : Colors.white,
                ),
              ),
            ),
            const Center(
              child: TextAnimationWidget(),
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.content_paste_search_rounded,
                      size: 40,
                      color: isDarkMode ? Colors.black : Colors.white),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Skills',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.black : Colors.white),
                  ),
                ],
              ),
            ),
            PrimerProgressBar(segments: segments),
            const SizedBox(height: 50),
            Center(child: _animatedFlightPaths),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }

  Widget get _animatedFlightPaths => AnimatedFlightPaths(
        controller: controller,
        debugShowOffsetOnTap: false,
        flightSchedule: FlightSchedule(
          start: DateTime.parse('2023-01-01 00:00:00'),
          end: DateTime.parse('2023-01-01 23:59:00'),
          flights: flights,
        ),
        options: FlightPathOptions(
          showLabels: true,
          fromEndpointColor:
              isDarkMode ? SynthwaveColors.yellow : SynthwaveColors.red,
          toEndpointColor:
              isDarkMode ? SynthwaveColors.yellow : SynthwaveColors.red,
          flightPathColor:
              isDarkMode ? SynthwaveColors.yellow : SynthwaveColors.blue,
          fromEndpointCurve: Curves.easeInOut,
          flightPathCurve: Curves.easeInOutSine,
          toEndpointCurve: Curves.easeInOut,
          flightPathStrokeWidth: 2,
          endpointRadius: 5,
          endpointToLabelSpacing: 12,
          endpointDotAlwaysVisible: false,
          endpointLabelAlwaysVisible: false,
          keepFlightPathsVisible: false,
          curveDepth: 0.5,
          endpointWeight: 0.2,
        ),
        child: MapSvg(
          map: FlightMap.worldMercatorProjection,
          outlineColor: isDarkMode ? Colors.black : SynthwaveColors.pink,
          fillColor: isDarkMode ? Colors.black26 : SynthwaveColors.black,
        ),
      );
}

final flights = <Flight>[
  Flight(
    from: Cities.paris,
    to: Cities.tokyo,
    departureTime: DateTime.parse('2023-01-01 00:00:00'),
    arrivalTime: DateTime.parse('2023-01-01 14:00:00'),
  ),
  Flight(
    from: Cities.sydney,
    to: Cities.capeTown,
    departureTime: DateTime.parse('2023-01-01 00:00:00'),
    arrivalTime: DateTime.parse('2023-01-01 18:00:00'),
  ),
  Flight(
    from: Cities.buenosAires,
    to: Cities.losAngeles,
    departureTime: DateTime.parse('2023-01-01 06:00:00'),
    arrivalTime: DateTime.parse('2023-01-01 21:00:00'),
  ),
  Flight(
    from: Cities.newYork,
    to: Cities.london,
    departureTime: DateTime.parse('2023-01-01 16:00:00'),
    arrivalTime: DateTime.parse('2023-01-01 23:00:00'),
  ),
  Flight(
    from: Cities.cairo,
    to: Cities.london,
    departureTime: DateTime.parse('2023-01-01 17:00:00'),
    arrivalTime: DateTime.parse('2023-01-01 23:00:00'),
  ),
  Flight(
    from: Cities.bangkok,
    to: Cities.london,
    departureTime: DateTime.parse('2023-01-01 10:00:00'),
    arrivalTime: DateTime.parse('2023-01-01 23:00:00'),
  ),
  Flight(
    from: Cities.paris,
    to: Cities.vietname,
    departureTime: DateTime.parse('2023-01-01 10:00:00'),
    arrivalTime: DateTime.parse('2023-01-01 13:00:00'),
  ),
];

abstract class Cities {
  static final bangkok = FlightEndpoint(
    offset: const Offset(75, 65),
    label: const Label(text: 'Bangkok'),
  );

  static final buenosAires = FlightEndpoint(
    offset: const Offset(32, 87),
    label: const Label(text: 'Buenos Aires'),
  );

  static final cairo = FlightEndpoint(
    offset: const Offset(60, 58),
    label: const Label(text: 'Cairo'),
  );

  static final capeTown = FlightEndpoint(
    offset: const Offset(55.5, 86),
    label: const Label(text: 'Cape Town'),
  );

  static final losAngeles = FlightEndpoint(
    offset: const Offset(16, 54),
    label: const Label(text: 'Los Angeles'),
  );

  static final london = FlightEndpoint(
    offset: const Offset(48, 45),
    label: ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Column(
          children: [
            const Label(text: 'Phnom Penh'),
            const CircleAvatar(
              radius: 80, // Image radius
              backgroundImage: AssetImage(
               'assets/images/kakelay.png'
              ),
            ),
           //Image.asset('assets/images/kakelay.png'),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  static final newYork = FlightEndpoint(
    offset: const Offset(28, 51),
    label: const Label(text: 'New York'),
  );

  static final paris = FlightEndpoint(
    offset: const Offset(49, 48),
    label: const Label(text: 'Paris'),
  );

  static final sydney = FlightEndpoint(
    offset: const Offset(89, 87),
    label: const Label(text: 'Sydney'),
  );

  static final tokyo = FlightEndpoint(
    offset: const Offset(86, 54),
    label: const Label(text: 'Tokyo'),
  );
  static final vietname = FlightEndpoint(
    offset: const Offset(70, 38), // Adjust the offset as needed
    label: const Label(text: 'Hanoi'),
  );
}

abstract class SynthwaveColors {
  static const pink = Color(0xFFeb2bb2);
  static const yellow = Color(0xFFfdfe43);
  static const blue = Color(0xFF74f7ff);
  static const black = Color(0xFF201130);
  static const white = Color.fromARGB(255, 255, 255, 255);
  static const red = Color.fromARGB(255, 255, 0, 0);
  static const orange = Color.fromARGB(255, 255, 85, 0);
  static const green = Color.fromARGB(255, 72, 255, 0);
}

class Label extends StatelessWidget {
  const Label({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: SynthwaveColors.black,
        border: Border.all(color: SynthwaveColors.blue, width: 2),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(
        text,
        style: GoogleFonts.righteous(color: SynthwaveColors.blue, fontSize: 14),
      ),
    );
  }
}

class TextAnimationWidget extends StatelessWidget {
  const TextAnimationWidget({super.key});

  Future<List<AnimatedText>> _generateTextAnimations() async {
    await Future.delayed(
      const Duration(milliseconds: 3),
    );
    return [
      TyperAnimatedText(
          'You cannot undo the moves but you can make the next step better.',
          curve: Curves.bounceIn),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimatedText>>(
      future: _generateTextAnimations(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return DefaultTextStyle(
            style: TextStyle(
              fontSize: 20,
              color: isDarkMode ? Colors.black : Colors.white,
              fontWeight: FontWeight.w900,
            ),
            child: AnimatedTextKit(
              animatedTexts: snapshot.data ?? [],
              totalRepeatCount: 1000,
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
