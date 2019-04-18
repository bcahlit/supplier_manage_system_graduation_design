module Response
  def json_response(object, status = :ok)
    # rersponse={code: 0, msg: message, data: object}
    render json: object, status: status
  end
end