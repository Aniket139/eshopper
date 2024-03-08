module BusinessCache
  def redis_cache
    @business_key = Business.first.id
    data = $business_redis.get(@business_key)

    unless data.present?
      generate_cache
      data = $business_redis.get(@business_key)
    end

    JSON.parse(data)
  end

  def generate_cache
    $business_redis.set(
      @business_key,
      {
        business_address: address
      }.to_json,
      ex: 3600
    )
  end
end
