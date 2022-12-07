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

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
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
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
