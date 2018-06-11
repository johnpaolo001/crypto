json.extract! cryptolist, :id, :symbol, :user_id, :cost_per, :amount_owned, :created_at, :updated_at
json.url cryptolist_url(cryptolist, format: :json)
