import 'package:animated_flight_paths/animated_flight_paths.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave/share_widgets/text_animation.dart';

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
        backgroundColor: isDarkMode ? Colors.white : const Color(0xFF27163e),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: toggleTheme,
              icon: isDarkMode
                  ? Icon(
                      Icons.wb_sunny,
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
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.4, 1],
            colors: !isDarkMode
                ? [
                    const Color(0xFF27163e),
                    const Color(0xFF432a72),
                  ]
                : [
                    Colors.white,
                    Colors.white24,
                  ],
          ),
        ),
        child: ListView(
          children: [
            Image.network(
                'https://www.hostinger.com/tutorials/wp-content/uploads/sites/2/2023/08/ine-agresta-homepage.png'),
            Center(child: _title),
            const Center(child: TextAnimationWidget()),
            const SizedBox(height: 24),
            Center(child: _animatedFlightPaths),
          ],
        ),
      ),
    );
  }

  Widget get _title => AutoSizeText(
        'Kak Elay',
        maxLines: 1,
        style: GoogleFonts.righteous(
          fontSize: 66,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..color = SynthwaveColors.blue,
        ),
      );

  Widget get _animatedFlightPaths => AnimatedFlightPaths(
        controller: controller,
        debugShowOffsetOnTap: false,
        flightSchedule: FlightSchedule(
          start: DateTime.parse('2023-01-01 00:00:00'),
          end: DateTime.parse('2023-01-01 23:59:00'),
          flights: flights,
        ),
        options: const FlightPathOptions(
          showLabels: true,
          fromEndpointColor: SynthwaveColors.yellow,
          toEndpointColor: SynthwaveColors.yellow,
          flightPathColor: SynthwaveColors.yellow,
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

          // color: isDarkMode ? Colors.white : Colors.white,
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
    from: Cities.paris, // Update the departure location
    to: Cities.cambodia, // Specify Cambodia as the destination
    departureTime:
        DateTime.parse('2023-01-01 10:00:00'), // Update the departure time
    arrivalTime:
        DateTime.parse('2023-01-01 13:00:00'), // Update the arrival time
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
    offset: const Offset(56, 58),
    label: const Label(text: 'Cairo'),
  );

  static final capeTown = FlightEndpoint(
    offset: const Offset(53.5, 86),
    label: const Label(text: 'Cape Town'),
  );

  static final losAngeles = FlightEndpoint(
    offset: const Offset(16, 54),
    label: const Label(text: 'Los Angeles'),
  );

  static final london = FlightEndpoint(
    offset: const Offset(48, 45),
    label: const Label(text: 'London'),
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
  static final cambodia = FlightEndpoint(
    offset: const Offset(70, 38), // Adjust the offset as needed
    label: const Label(text: 'Cambodia'),
  );
}

abstract class SynthwaveColors {
  static const pink = Color(0xFFeb2bb2);
  static const yellow = Color(0xFFfdfe43);
  static const blue = Color(0xFF74f7ff);
  static const black = Color(0xFF201130);
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
      const Duration(milliseconds: 2),
    );
    return [
      TyperAnimatedText(
          'Flutter Developer Extraordinaire: Crafting the Future with Innovation'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimatedText>>(
      future: _generateTextAnimations(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return DefaultTextStyle(
            style:   TextStyle(
              fontSize: 40,
               color: isDarkMode ? Colors.black : Colors.black,
              fontWeight: FontWeight.w900,
            ),
            child: AnimatedTextKit(
              animatedTexts: snapshot.data ?? [],
              totalRepeatCount: 1000, // 0 means animation runs indefinitely
            ),
          );
        } else {
          return const CircularProgressIndicator(); // Show a loading indicator
        }
      },
    );
  }
}
