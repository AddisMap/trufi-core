import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';
import 'package:vector_tile_renderer/vector_tile_renderer.dart';
import 'package:latlong2/latlong.dart';

import 'package:trufi_core/base/blocs/map_configuration/map_configuration_cubit.dart';
import 'package:trufi_core/base/blocs/map_tile_provider/map_tile_provider_cubit.dart';
import 'package:trufi_core/base/blocs/providers/gps_location_provider.dart';
import 'package:trufi_core/base/widgets/maps/buttons/your_location_button.dart';
import 'package:trufi_core/base/widgets/maps/trufi_map_cubit/trufi_map_cubit.dart';

typedef LayerOptionsBuilder = List<LayerOptions> Function(BuildContext context);

class TrufiMap extends StatelessWidget {
  final TrufiMapController trufiMapController;
  final LayerOptionsBuilder layerOptionsBuilder;
  final Widget? floatingActionButtons;
  final TapCallback? onTap;
  final LongPressCallback? onLongPress;
  final PositionCallback? onPositionChanged;

  const TrufiMap({
    Key? key,
    required this.trufiMapController,
    required this.layerOptionsBuilder,
    this.floatingActionButtons,
    this.onTap,
    this.onLongPress,
    this.onPositionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapConfiguratiom = context.read<MapConfigurationCubit>().state;
    final currentMapType = context.watch<MapTileProviderCubit>().state;
    return Stack(
      children: [
        StreamBuilder<LatLng?>(
            initialData: null,
            stream: GPSLocationProvider().streamLocation,
            builder: (context, snapshot) {
              final currentLocation = snapshot.data;
              return FlutterMap(
                mapController: trufiMapController.mapController,
                options: MapOptions(
                  interactiveFlags: InteractiveFlag.drag |
                      InteractiveFlag.flingAnimation |
                      InteractiveFlag.pinchMove |
                      InteractiveFlag.pinchZoom |
                      InteractiveFlag.doubleTapZoom,
                  minZoom: mapConfiguratiom.onlineMinZoom,
                  maxZoom: 16,
                  zoom: mapConfiguratiom.onlineZoom,
                  plugins: [VectorMapTilesPlugin()],
                  onTap: onTap,
                  onLongPress: onLongPress,
                  center: mapConfiguratiom.center,
                  onPositionChanged: (
                    MapPosition position,
                    bool hasGesture,
                  ) {
                    if (onPositionChanged != null) {
                      Future.delayed(Duration.zero, () {
                        onPositionChanged!(position, hasGesture);
                      });
                    }
                  },
                ),
                layers: [
                  VectorTileLayerOptions(
                      theme: _mapTheme(context),
                      tileProviders: TileProviders(
                          {'openmaptiles': _cachingTileProvider(_urlTemplate())})),
                  mapConfiguratiom.markersConfiguration
                      .buildYourLocationMarkerLayerOptions(currentLocation),
                  ...layerOptionsBuilder(context)
                ],
              );
            }),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              if (floatingActionButtons != null) floatingActionButtons!,
              const Padding(padding: EdgeInsets.all(4.0)),
              YourLocationButton(
                trufiMapController: trufiMapController,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: mapConfiguratiom.mapAttributionBuilder!(context),
        ),
      ],
    );
  }

  VectorTileProvider _cachingTileProvider(String urlTemplate) {
    return MemoryCacheVectorTileProvider(
        delegate: NetworkVectorTileProvider(
            urlTemplate: urlTemplate,
            // this is the maximum zoom of the provider, not the
            // maximum of the map. vector tiles are rendered
            // to larger sizes to support higher zoom levels
            maximumZoom: 14),
        maxSizeBytes: 1024 * 1024 * 2);
  }

  _mapTheme(BuildContext context) {
    // maps are rendered using themes
    // to provide a dark theme do something like this:
    // if (MediaQuery.of(context).platformBrightness == Brightness.dark) return myDarkTheme();
    return ProvidedThemes.lightTheme();
  }

  String _urlTemplate() {
    // Stadia Maps source https://docs.stadiamaps.com/vector/
    // return 'https://d-makinamaps.makina-corpus.net/data/v3/{z}/{x}/{y}.pbf';

    return 'https://tiles.stadiamaps.com/data/openmaptiles/{z}/{x}/{y}.pbf?api_key=fill-your-api-key-here';

    // Mapbox source https://docs.mapbox.com/api/maps/vector-tiles/#example-request-retrieve-vector-tiles
    // return 'https://api.mapbox.com/v4/mapbox.mapbox-streets-v8/{z}/{x}/{y}.mvt?access_token=$apiKey',
  }

}
