# frozen_string_literal: true

module CustomerCache
  def redis_cache
    data = $redis.get("customer_#{id}")
    unless data.present?
      generate_cache
      data = $redis.get("customer_#{id}")
    end
    JSON.parse(data)
  end

  def generate_cache
    $redis.set(
      "customer_#{id}",
      {
        cart_counts: carts.count
      }.to_json,
      ex: 3600
    )
  end
end
