json.array!(@estimates) do |estimate|
  json.extract! estimate, :id, :summary, :from, :date, :number, :to, :due_on, :estimate_number, :estimate_notes
  json.url estimate_url(estimate, format: :json)
end
