import { React, useState, useEffect } from 'react'
import transactionApi from 'api/movies.js'
import { Loader } from 'components/Loader'
import { useDebounce } from 'use-debounce';

export const Home = () => {
  const [isLoading, setIsLoading] = useState(false)
  const [movies, setMovies] = useState([])
  const [actorFilter, setActorFilter] = useState('')
  const [debouncedValue] = useDebounce(actorFilter, 1500);

  useEffect(() => {
    setIsLoading(true)
    transactionApi.index(actorFilter)
      .then(data => {
        setMovies(data.movies)
        setIsLoading(false)
      })
  }, [actorFilter])

  return (
    <>
      <h1> Movies </h1>
      <input placeholder='filter by actor' value={actorFilter} onChange={ (e) => setActorFilter(e.target.value) } />
      
        <>{ isLoading ? <Loader/> : 
          movies.length == 0 ? <h2>No movies</h2> :
          <table className="table" id='transactions-table'>
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Id</th>
                <th scope="col">Movie</th>
              </tr>
            </thead>
            <tbody>
              { movies.map((movie, i) => (
                <tr key={ movie.id }>
                  <th>{ i + 1 }</th>
                  <td>{ movie.id }</td>
                  <td>{ movie.movie }</td>
                </tr>
              ))}
            </tbody>
          </table>
        }</>
    </>
  )
}
