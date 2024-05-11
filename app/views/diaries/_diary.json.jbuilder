json.extract! diary, :id, :starttime, :endtime, :place, :people, :impetus, :created_at, :updated_at
json.url diary_url(diary, format: :json)
