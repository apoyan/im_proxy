FactoryBot.define do
  factory :message do
    sequence(:user_id) {|n| "a User #{n}" }
    messenger { 'viber' }
    body { 'lorep ipsum' }

    factory :telegram_message do
      messenger { 'telegram' }
    end

    factory :whatsapp_message do
      messenger { 'whatsapp' }
    end

    factory :scheduled_messages do
      delivery_at { Time.current + 10.minutes }
    end
  end

  factory :message_params, class: Hash do
    body { 'lorem ipsum' }
    receivers { [{ messenger: 'telegram', datetime: '', user_ids: ['11'] }] }

    factory :invalid_message_params do
      body { nil }
    end

    initialize_with { attributes }
  end
end
