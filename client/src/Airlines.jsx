import React, { useEffect, Fragment } from 'react';
import { useState } from 'react';
import axios from 'axios'
import Airline from './Airline';

const Airlines = () => {

    axios.defaults.baseURL = 'http://localhost:3000/api/v1/';

    const [airlines, setAirlines] = useState([])

    useEffect(() => {
        axios('airlines').then(({data: airlines}) =>{
            console.log(airlines);
            setAirlines(airlines)
        }
        )
    }, [])

    return (  
        
        <Fragment>
            <h1>Airlines</h1>

            <ul>
                {airlines.map(airline => <li><Airline airline = {airline}/></li>)}
            </ul>
        </Fragment>

    );
}
 
export default Airlines;