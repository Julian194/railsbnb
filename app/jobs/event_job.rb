class EventJob < ApplicationJob
  queue_as :default

  def perform(event)
    case event.source
    when "stripe"
      stripe_event = Stripe::Event.construct_from(
        JSON.parse(event.request_body, symbolize_names: true)
      )
      begin
        handle_stripe(stripe_event)
        event.update(
          event_type: stripe_event.type,
          error_message: '',
          status: :processed
        )
      rescue => e
        event.update(
          error_message: e.message,
          status: :failed
        )
      end
    else
      event.update(
        error_messages: "Unknown source #{stripe_event.source}",
        status: :failed
      )
    end

  end

  def handle_stripe(event)
    case event.type
    when "checkout.session.completed"
      checkout_session = event.data.object
      puts "Checkout session ID: #{checkout_session.id}"
      puts "Checkout session Metadata: #{checkout_session.metadata}"
    end
  end

end
