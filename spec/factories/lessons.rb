FactoryBot.define do
  factory :lesson do
    transcription { nil }
    audio { nil }
    youtube_link { "MyString" }
    course { nil }
  end
end
