import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle'

import { React, useState, useEffect } from 'react'
import { Routes, Route } from 'react-router-dom'
import { Home } from 'components/Home'
import { Loader } from 'components/Loader'

const App = () => {
  const [isLoading, setIsLoading] = useState(true)

  useEffect(() => {
    setIsLoading(false)
  }, [])

  return (
    <div className='App'>
      <div className='container'>
        { isLoading ? <Loader/> : <></> }
        <Routes>
          <Route path = '/' element={ <Home /> } />
        </Routes>
      </div>
    </div>
  )
}

export default App
