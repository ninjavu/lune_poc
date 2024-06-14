import { React, useState, useEffect } from 'react'
import moviesApi from 'api/movies.js'
import { Loader } from 'components/Loader'
import { useDebouncedCallback } from 'use-debounce';

export const Home = () => {
  const DEBOUNCE_TIME = 500
  const [isLoading, setIsLoading] = useState(false)
  const [movies, setMovies] = useState([])
  const debounced = useDebouncedCallback(
    (value) => {
      setIsLoading(true)
      moviesApi.index(value)
        .then(data => {
          setMovies(data.movies)
          setIsLoading(false)
        })
    },
    DEBOUNCE_TIME
  );

  useEffect(() => {
    setIsLoading(true)
    moviesApi.index('')
      .then(data => {
        setMovies(data.movies)
        setIsLoading(false)
      })
  }, [])


  return (
    <>
      <h1> Movies </h1>
      <input placeholder='search by actor' onChange={ (e) => debounced(e.target.value) } />
        <>{ isLoading ? <Loader/> : 
          movies.length == 0 ? <h2>No movies</h2> :
          <table className="table">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Id</th>
                <th scope="col">Movie</th>
                <th scope="col">Actor</th>
              </tr>
            </thead>
            <tbody>
              { movies.map((movie, i) => (
                <tr key={ movie.id }>
                  <th>{ i + 1 }</th>
                  <td>{ movie.id }</td>
                  <td>{ movie.movie }</td>
                  <td>{ movie.actor }</td>
                </tr>
              ))}
            </tbody>
          </table>
        }</>
    </>
  )
}
