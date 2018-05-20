class EventConsumer < Racecar::Consumer
  subscribes_to "events"

  def process(message)
    data = JSON.parse(message.value)
    event = Event.find(data["id"])
    event.name = "streamed: #{event.name}"
    event.save!
  end
end
