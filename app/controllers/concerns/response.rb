module Response
  def json_response(object, status = :ok, message = "请求成功")
    rersponse={code: 0, msg: message, data: object}
    render json: rersponse, status: status
  end
end