genres = RakutenWebService::Ichiba::Genre.root.children
current_time = Time.current
genres.map! do |genre|
  { name: genre.name, rakuten_id: genre.id, created_at: current_time, updated_at: current_time }
end
Genre.insert_all!(genres)
