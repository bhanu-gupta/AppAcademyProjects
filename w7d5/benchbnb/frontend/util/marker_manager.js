
class MarkerManager{
    constructor(map) {
        this.map = map;
        this.markers = {};
    }

    updateMarkers(benches) {
        let benchObj = {};
        benches.map((bench) => {
            if(!this.markers[bench.id]) {
                this.createMarkerFromBench(bench);
            }
            benchObj[bench.id] = bench;
        });
        Object.keys(this.markers).map((benchId) => {
            if(!benchObj[benchId]) {
                this.removeMarker(this.markers[benchId], benchId);
            }
        });
    }

    removeMarker(marker, benchId) {
        marker.setMap(null);
        delete this.markers[benchId];
    }

    createMarkerFromBench(bench) {
        const {lat, lng, description} = bench;
        const marker = new google.maps.Marker({
            position: {
                lat, lng
            },
            map: this.map,
            title: description
        });
        marker.setMap(this.map);
        this.markers[bench.id] = marker;
    }
}


export default MarkerManager;