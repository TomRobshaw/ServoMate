import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import { clippingParents } from "@popperjs/core";

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder ({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }));
      this.map.addControl(
        new MapboxDirections({
        accessToken: mapboxgl.accessToken
        }),
        'bottom-left'
        );
        this.map.addControl(
          new mapboxgl.GeolocateControl({
          positionOptions: {
          enableHighAccuracy: true
          },
          // When active the map will receive updates to the device's location as it changes.
          trackUserLocation: true,
          // Draw an arrow next to the location dot to indicate which direction the device is heading.
          showUserHeading: true
          })
          );
  }


  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup({
        closeButton: false
        }).setHTML(marker.info_window)
      const customMarker = document.createElement("div")
      // customMarker.style.backgroundImage = 'url("https://cdn-icons-png.flaticon.com/512/5717/5717505.png")';
      // customMarker.style.backgroundImage = 'url("https://cdn-icons-png.flaticon.com/512/3448/3448327.png")';
      // customMarker.style.backgroundImage = 'url("https://cdn-icons-png.flaticon.com/512/4244/4244891.png")';
      // customMarker.style.backgroundImage = 'url("https://cdn-icons-png.flaticon.com/512/4244/4244928.png")';
      // customMarker.style.backgroundImage = 'url("https://cdn-user-icons.flaticon.com/87203/87203389/1670387854655.svg?token=exp=1670388756~hmac=47a1ebd02b85244c1fedc2253be5a963")';
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      // console.log(customMarker.style.backgroundImage);
      customMarker.style.width = "40px"
      customMarker.style.height = "40px"
      // customMarker.style.color = "#2a3a75"
      customMarker.className = "marker"
      customMarker.style.backgroundSize = "contain"
      new mapboxgl.Marker(customMarker)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(this.map)
      this.map.on('mouseenter', 'places', (e) => {
        // Change the cursor style as a UI indicator.
        this.map.getCanvas().style.cursor = 'pointer';

        // Copy coordinates array.
        const coordinates = e.features[0].geometry.coordinates.slice();
        const description = e.features[0].properties.description;

        // Ensure that if the map is zoomed out such that multiple
        // copies of the feature are visible, the popup appears
        // over the copy being pointed to.
        while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
        coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
        }

        // Populate the popup and set its coordinates
        // based on the feature found.
        popup.setLngLat(coordinates).setHTML(description).addTo(map);
        });

        this.map.on('mouseleave', 'places', () => {
        this.map.getCanvas().style.cursor = '';
        popup.remove();
        });
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}
