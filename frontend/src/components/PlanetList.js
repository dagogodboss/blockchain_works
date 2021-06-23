import React, { useState, useEffect } from 'react'

export function PlanetList({ token, totalSupply }) {
    const [planets, setPlanets] = useState([])
    useEffect(() => {
        const runLoop = async () => {
            for (let index = 0; index < totalSupply; index++) {
                const list = await token.plantFounderList(index)
                planets.push(list)
                let x = (planets) => planets.filter((v, i) => planets.indexOf(v) === i)
                setPlanets(x(planets))
            }
        }
        runLoop();
    }, [totalSupply]);

    return (
        <>
            <h2>List Of Added Planets</h2>
            <div className="container">
                <div className="row">
                    {
                        planets.map((planet, index) => (
                            <div className="col-md-4">
                                <div style={{ height: 'content', overflow: 'hidden', paddingBottom: '10px', }} className="card  card-flex" key={index}>
                                    <div className='card-body'>
                                        <div className="row">
                                            <div className="col-md-4">
                                                <img style={{ width: '100%' }} src="https://source.unsplash.com/user/c_v_r" alt="Random Things" className="avatar" />
                                            </div>
                                        </div>
                                        <div className="row">
                                            <div className="col-md-6">
                                                Planet Name : {planet.split('/')[0]}
                                            </div>
                                            <div className="col-md-6">
                                                Founder's Name : {planet.split('/')[1]}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        ))
                    }
                </div>
            </div>
        </>
    )

}

