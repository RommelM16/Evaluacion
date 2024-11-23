import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Necesario para las coordenadas

const mapBoxAccessToken =
    'pk.eyJ1Ijoicm9tbWVsMTYiLCJhIjoiY20zbHZybXl5MHlxbTJpcHYzb2M3c3ZhZSJ9.mLbtYiqj9Wc714RZv2pXWQ';
//const myPosition =
//  LatLng(-2.900271853721257, -79.01577814825852); // Coordenadas

class MapboxScreen extends StatelessWidget {
  const MapboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> parametros =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Extraer los valores de latlng y nombre
    final double lat = parametros['lat'];
    final double long = parametros['long'];
    final String titulo = parametros['titulo'];

    LatLng myPosition = LatLng(lat, long);

    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: myPosition,
          initialZoom: 17,
          minZoom: 16,
          maxZoom: 20,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}/?access_token={accessToken}',
            additionalOptions: const {
              'accessToken': mapBoxAccessToken,
              'id': 'mapbox/streets-v12',
            },
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: myPosition,
                child: const Icon(
                  Icons.apartment,
                  color: Colors.blue,
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.contact_mail,
          color: Colors.blue,
        ),
      ),
    );
  }
}
