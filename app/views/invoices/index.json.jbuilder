json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :project_title, :client_id, :notes
  json.url invoice_url(invoice, format: :json)
end
