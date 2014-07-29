json.array!(@bills) do |bill|
  json.extract! bill, :id, :summary, :bill_from, :date, :bill_number, :bill_to, :due_on, :purchase_order_number, :invoice_notes
  json.url bill_url(bill, format: :json)
end
