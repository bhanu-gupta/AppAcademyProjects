import React from 'react';
import MarkerManager from '../util/marker_manager';

class BenchMap extends React.Component {

    componentDidMount() {
        const mapOptions = {
            center: { lat: 37.7758, lng: -122.435 }, // this is SF
            zoom: 13
        };

        this.map = new google.maps.Map(this.mapNode, mapOptions);
        window.map = this.map;
        this.MarkerManager = new MarkerManager(this.map);
        this.MarkerManager.updateMarkers(this.props.benches);
        this.map.addListener('idle', () => {
            const bounds = this.map.getBounds();
            const northEastBound = bounds.getNorthEast();
            const southWestBound = bounds.getSouthWest();
            const bound_params = {
                lat: [southWestBound.lat(), northEastBound.lat()],
                lng: [southWestBound.lng(), northEastBound.lng()]
            };
            this.props.updateBounds(bound_params);
        });
    }

    componentDidUpdate(prevProps) {
        this.MarkerManager.updateMarkers(this.props.benches);
    }

    render() {
        return (
            <div id="map-container" ref={map => this.mapNode = map}></div>
        );
    }
}

export default BenchMap;