class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # stream_from "product_channel"
    # product = Product.find(params[:id])
    # stream_for product
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def listen(data)
    stop_all_streams
    stream_for data["product_id"]
  end
end
