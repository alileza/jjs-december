module.exports = (request, response, next) ->
  return response.send """
  <form method="POST">
    <button type="submit">Sign Up</button>
  </form>
  """
