import 'package:flutter_nasa_app/core/failure.dart';
import 'package:flutter_nasa_app/domain/entities/apod.dart';

Apod Function() tApod = () =>  Apod(
  copyright: "Demison Lopes",
  date: DateTime.parse("2024-04-19"),
  explanation: "A jewel of the southern sky, the Great Carina Nebula is more modestly known as NGC 3372. One of our Galaxy's largest star forming regions, it spans over 300 light-years. Like the smaller, more northerly Great Orion Nebula, the Carina Nebula is easily visible to the unaided eye. But at a distance of 7,500 light-years it lies some 5 times farther away. This stunning telescopic view reveals remarkable details of the region's glowing filaments of interstellar gas and obscuring cosmic dust clouds. The Carina Nebula is home to young, extremely massive stars, including the still enigmatic variable Eta Carinae, a star with well over 100 times the mass of the Sun.  Eta Carinae is the bright star above the central dark notch in this field and left of the dusty Keyhole Nebula (NGC 3324).",
  hdurl: "https://apod.nasa.gov/apod/image/2404/NGC3372_ETA CARINA_LOPES.jpg",
  thumbnailUrl: "https://img.youtube.com/vi/X4UF9Akman0/0.jpg",
  mediaType: "image",
  serviceVersion: "v1",
  title: "The Great Carina Nebula",
  url: "https://apod.nasa.gov/apod/image/2404/NGC3372_ETA CARINA_LOPES1024.jpg"
);

Failure Function() tNoConnection = () => NoConnection();