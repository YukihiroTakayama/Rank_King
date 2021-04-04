i = 1
Category.seed do |s|
  s.id = i
  s.name = 'レディースファッション'
  s.rakuten_id = 100371
  s.yahoo_id = 2494
  i += 1
end
category = Category.find(1)
RakutenWebService::Ichiba::Genre[100371].children.each do |genre|
  Category.seed do |s|
    s.id = i
    s.name = 'レディスバッグ'
    s.rakuten_id = 110933
    s.yahoo_id = 1574
    i += 1
  end
end

Category.seed do |s|
  s.id = i
  s.name = 'メンズファッション'
  s.rakuten_id = 551177
  s.yahoo_id = 2495
  i += 1
end
