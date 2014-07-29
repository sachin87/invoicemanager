json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :summary, :invoice_from, :date, :invoice_number, :invoice_to, :invoice_due, :purchase_order_number, :invoice_notes
  json.url invoice_url(invoice, format: :json)
end
