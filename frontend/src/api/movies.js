import { backOffCall } from 'api/api.js'
import { API_URL } from 'config/constants'

const index = (actor) => {
  const query = () => {
    return fetch(`${API_URL}/movies?actor=${actor}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      }
    })
  }

  return backOffCall(query)
}

export default {
  index
}
