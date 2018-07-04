def generate_id
  sprintf("%20.10f", Time.now.to_f).
    delete('.').to_i.to_s(36)
end
