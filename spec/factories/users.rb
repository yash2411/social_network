FactoryBot.define do
  factory :user do
    first_name {"Yash"}
    last_name {"Pandey"}
    email {"yash1@gmail.com"}
    password {"Rails@1234"}
    password_confirmation {"Rails@1234"}
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec','fixtures','images','sample.png'), 'image/png')}
  end
end
