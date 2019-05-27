import React from 'react';
import BenchIndexItem from './bench_index_item';

class BenchIndex extends React.Component {

    componentDidMount() {
        //this.props.fetchBenches(this.props.filters);
    }

    render() {
        const all_benches = this.props.benches.map((bench) => {
            return <BenchIndexItem key={bench.id} bench={bench} />
        });
        return (
            <div>
                <ul>
                    {all_benches}
                </ul>
            </div>
        );

    }
}

export default BenchIndex;