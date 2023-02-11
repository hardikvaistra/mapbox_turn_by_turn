import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_mapbox_navigation/library.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:navigation_with_mapbox/navigation_with_mapbox.dart';
// import 'package:navigation_with_mapbox/navigation_with_mapbox.dart';

import '../ui/rate_ride.dart';

class TurnByTurn extends StatefulWidget {
  final LatLng source;
  final LatLng destination;

  const TurnByTurn({
    required this.source,
    required this.destination,
    Key? key,
  }) : super(key: key);

  @override
  State<TurnByTurn> createState() => _TurnByTurnState();
}
/*
class _TurnByTurnState extends State<TurnByTurn> {
  // Waypoints to mark trip start and end
  LatLng source = getTripLatLngFromSharedPrefs('source');
  LatLng destination = getTripLatLngFromSharedPrefs('destination');
  late WayPoint sourceWaypoint, destinationWaypoint;
  var wayPoints = <WayPoint>[];

  // Config variables for Mapbox Navigation
  late MapBoxNavigation directions;
  late MapBoxOptions _options;
  late double distanceRemaining, durationRemaining;
  late MapBoxNavigationViewController _controller;
  final bool isMultipleStop = false;
  String instruction = "";
  bool arrived = false;
  bool routeBuilt = false;
  bool isNavigating = false;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    if (!mounted) return;

    // Setup directions and options
    directions = MapBoxNavigation(onRouteEvent: _onRouteEvent);
    _options = MapBoxOptions(
      zoom: 18.0,
      voiceInstructionsEnabled: true,
      bannerInstructionsEnabled: true,
      mode: MapBoxNavigationMode.drivingWithTraffic,
      isOptimized: true,
      units: VoiceUnits.metric,
      simulateRoute: true,
      language: "en",
    );

    // Configure waypoints
    sourceWaypoint = WayPoint(
      name: "Source",
      latitude: source.latitude,
      longitude: source.longitude,
    );
    destinationWaypoint = WayPoint(
      name: "Destination",
      latitude: destination.latitude,
      longitude: destination.longitude,
    );
    wayPoints.add(sourceWaypoint);
    wayPoints.add(destinationWaypoint);

    // Start the trip
    await directions.startNavigation(wayPoints: wayPoints, options: _options);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: RateRide());
  }

  Future<void> _onRouteEvent(e) async {
    distanceRemaining = await directions.distanceRemaining;
    durationRemaining = await directions.durationRemaining;

    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        var progressEvent = e.data as RouteProgressEvent;
        arrived = progressEvent.arrived!;
        if (progressEvent.currentStepInstruction != null) {
          instruction = progressEvent.currentStepInstruction!;
        }
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        routeBuilt = true;
        break;
      case MapBoxEvent.route_build_failed:
        routeBuilt = false;
        break;
      case MapBoxEvent.navigation_running:
        isNavigating = true;
        break;
      case MapBoxEvent.on_arrival:
        arrived = true;
        if (!isMultipleStop) {
          await Future.delayed(const Duration(seconds: 3));
          await _controller.finishNavigation();
        } else {}
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        routeBuilt = false;
        isNavigating = false;
        break;
      default:
        break;
    }
    //refresh UI
    setState(() {});
  }
}
*/

class _TurnByTurnState extends State<TurnByTurn> {
  final _navigationWithMapboxPlugin = NavigationWithMapbox();

  @override
  void initState() {
    super.initState();
    initialize();
    // we instantiate the stream getStateMapboxView IOS
    // listenEvents = MapboxNavigationView.getStateMapboxView;
  }

  Future<void> initialize() async {
    if (!mounted) return;

    await _navigationWithMapboxPlugin.startNavigation(
        origin: WayPoint(
            latitude: widget.source.latitude,
            longitude: widget.source.longitude),
        destination: WayPoint(
            latitude: widget.destination.latitude,
            longitude: widget.destination.longitude),
        setDestinationWithLongTap: false,
        simulateRoute: true,
        msg: 'On The Way', // optional
        profile: '', // optional, default: driving, others: walking, cycling
        style:
            '', // optional, default: streets, others: dark, light, traffic_day, traffic_night, satellite, satellite_streets, outdoors
        voiceUnits: '', // optional, default: metric
        language: '', // optional, default: en
        alternativeRoute: true // optional, default: false
        );

    // var options = MapboxOptions(
    //   // origin refers to the user's starting point at the time of starting the navigation
    //   origin: WayPoint(latitude: source.latitude, longitude: source.longitude),
    //   // destination refers to the end point or goal for the user at the time of starting the navigation
    //   destination: WayPoint(
    //       latitude: destination.latitude, longitude: destination.longitude),
    //   // if we enable this option we can choose a destination with a sustained tap
    //   setDestinationWithLongTap: false,
    //   // if we enable this option we will activate the simulation of the route
    //   simulateRoute: false,
    //   // optional, message that will be displayed when starting the navigation map ONLY ANDROID
    //   msg: 'On Your Way',
    //   // unit of measure in which the navigation assistant will speak to us
    //   // optional, default: metric
    //   voiceUnits: 'imperial',
    //   // language in which the navigation assistant will speak to us
    //   // optional, default: en
    //   language: 'es',
    //   // if we enable this option we can see alternative routes when starting the navigation map ONLY ANDROID
    //   // optional, default: false
    //   alternativeRoute: true,
    //   // the style or theme with which the navigation map will be loaded
    //   // optional, default: streets, others: dark, light, traffic_day, traffic_night, satellite, satellite_streets, outdoors
    //   style: 'traffic_night',
    //   // refers to the navigation mode, the route and time will be calculated depending on this
    //   // optional, default: driving, others: walking, cycling
    //   profile: '',
    // );
    // // we save the options and go on to show the map view
    // setState(() {
    //   _options = options;
    //   _controlView = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return const Dialog(child: RateRide());
  }
}
