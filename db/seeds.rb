ActiveRecord::Base.connection.execute('ALTER TABLE categories AUTO_INCREMENT = 1')
parent = Category.create do |c|
  c.name = 'レディースファッション'
  c.rakuten_id = 100371
  c.yahoo_id = 2494
end
current_time = Time.now

genre = RakutenWebService::Ichiba::Genre[100371]
params = genre.children.map do |genre|
  {
    name: genre.name,
    rakuten_id: genre.id,
    created_at: current_time,
    updated_at: current_time
  }
end
parent.children.insert_all(params)

parent.children.each do |parent|
  genre = RakutenWebService::Ichiba::Genre[parent.rakuten_id]
  params = genre.children.map do |genre|
    {
      name: genre.name,
      rakuten_id: genre.id,
      created_at: current_time,
      updated_at: current_time
    }
  end
  parent.children.insert_all(params) if params.present?

  parent.children.each do |parent|
    genre = RakutenWebService::Ichiba::Genre[parent.rakuten_id]
    next if genre.children.blank?

    params = genre.children.map do |genre|
      {
        name: genre.name,
        rakuten_id: genre.id,
        created_at: current_time,
        updated_at: current_time
      }
    end
    parent.children.insert_all(params) if params.present?
  end
end
