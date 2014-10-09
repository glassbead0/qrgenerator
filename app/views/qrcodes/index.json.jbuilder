json.array!(@qrcodes) do |qrcode|
  json.extract! qrcode, :id, :text_to_encode, :size, :level
  json.url qrcode_url(qrcode, format: :json)
end
