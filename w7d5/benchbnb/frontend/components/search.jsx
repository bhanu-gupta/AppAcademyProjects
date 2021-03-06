import React from 'react';  
import BenchMap from './bench_map';
import BenchIndex from './bench_index';

export default (props) => {
    const { benches, fetchBenches, updateBounds} = props;
    return (
        <>
        <BenchMap benches={benches} updateBounds={updateBounds}/>
        <BenchIndex benches={benches} fetchBenches={fetchBenches}/>
        </>
    );
};