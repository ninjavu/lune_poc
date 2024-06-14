import { backOffCall } from 'api/api.js'
import { API_URL } from 'config/constants'

const index = (actor) => {
  const query = () => {
    const url = new URL(`${API_URL}/movies`)

    actor && url.searchParams.append('actor', actor)

    return fetch(url, {
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
