json.extract! comentario, :id, :usuario_id, :post_id, :conteudo, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)
