class ItemsSerializer < ActiveModel::Serializer
  attributes :id
             :trip_id
             :date
             :description
             :price
             :qty
end
