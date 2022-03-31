shared_examples 'successful_response_body' do
  it 'returns status 200' do
    expect(response.code).to eq '200'
  end

  it 'contains a collection of movies' do
    expect(response_body[:data]).to be_a(Array)
  end

  it 'contains an expected number of movies' do
    expect(response_body[:data].size).to eq(items_number)
  end

  it 'matches expected json schema' do
    expect { JSON::Validator.validate!(json_schema, response_body) }.not_to raise_error
  end
end
